import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:plante/model/gender.dart';
import 'package:plante/model/user_params.dart';
import 'package:plante/model/user_params_controller.dart';

import 'user_params_controller_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<UserParamsControllerObserver>(returnNullOnMissingStub: true)
])
void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final controller = UserParamsController();
    await controller.setUserParams(null);
  });

  test('Save and restore params', () async {
    final controller = UserParamsController();
    final initialParams = await controller.getUserParams();
    expect(initialParams, equals(null));

    final params = UserParams((v) => v
      ..name = 'Bob'
      ..genderStr = Gender.MALE.name
      ..birthdayStr = '20.07.1993'
      ..eatsMilk = true
      ..eatsEggs = false
      ..eatsHoney = true
      ..userGroup = 321);
    await controller.setUserParams(params);

    final finalParams = await controller.getUserParams();
    expect(finalParams, equals(params));
  });

  test('Gradual parameters filling', () async {
    final controller = UserParamsController();

    // Empty params

    var params = UserParams();
    await controller.setUserParams(params);
    expect(null, equals(await controller.getUserParams()));

    // Not empty params

    params = params.rebuild((v) => v.name = 'Bob');
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.birthdayStr = '20.07.1993');
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.eatsMilk = true);
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.eatsEggs = false);
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.eatsHoney = false);
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.genderStr = Gender.FEMALE.name);
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.backendId = '123');
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.backendClientToken = '321');
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    params = params.rebuild((v) => v.userGroup = 123);
    await controller.setUserParams(params);
    expect(params, equals(await controller.getUserParams()));

    final expectedParams = UserParams((v) => v
      ..name = 'Bob'
      ..genderStr = Gender.FEMALE.name
      ..birthdayStr = '20.07.1993'
      ..eatsMilk = true
      ..eatsEggs = false
      ..eatsHoney = false
      ..backendId = '123'
      ..backendClientToken = '321'
      ..userGroup = 123);
    expect(params, equals(expectedParams));
  });

  test('Observer', () async {
    final controller = UserParamsController();
    final observer = MockUserParamsControllerObserver();
    controller.addObserver(observer);

    final params = UserParams((v) => v
      ..name = 'Bob'
      ..genderStr = Gender.MALE.name
      ..birthdayStr = '20.07.1993'
      ..eatsMilk = true
      ..eatsEggs = false
      ..eatsHoney = true);

    verifyNever(observer.onUserParamsUpdate(any));
    await controller.setUserParams(params);
    verify(observer.onUserParamsUpdate(params));

    reset(observer);

    verifyNever(observer.onUserParamsUpdate(any));
    await controller.setUserParams(null);
    verify(observer.onUserParamsUpdate(null));
  });

  test(
      'Cached user params throw if obtained immediately after controller creation',
      () async {
    final controller = UserParamsController();
    bool threw = false;
    try {
      controller.cachedUserParams;
    } catch (e) {
      threw = true;
    }
    expect(threw, isTrue);
  });

  test(
      'Cached user params do not throw if obtained some time after controller creation',
      () async {
    final controller = UserParamsController();

    // Some time!
    await Future.delayed(const Duration(milliseconds: 10));

    bool threw = false;
    try {
      controller.cachedUserParams;
    } catch (e) {
      threw = true;
    }
    expect(threw, isFalse);
  });

  test('Cached user params are updated', () async {
    final controller = UserParamsController();
    // Some time!
    await Future.delayed(const Duration(milliseconds: 10));

    expect(controller.cachedUserParams, isNull);

    final params = UserParams((v) => v
      ..name = 'Bob'
      ..genderStr = Gender.MALE.name
      ..birthdayStr = '20.07.1993'
      ..eatsMilk = true
      ..eatsEggs = false
      ..eatsHoney = true);
    await controller.setUserParams(params);

    expect(controller.cachedUserParams, equals(params));
  });
}
