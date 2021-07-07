// Mocks generated by Mockito 5.0.10 from annotations
// in plante/test/outside/backend/user_params_auto_wiper_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:math' as _i13;

import 'package:mockito/mockito.dart' as _i1;
import 'package:plante/base/result.dart' as _i2;
import 'package:plante/model/user_params.dart' as _i6;
import 'package:plante/model/user_params_controller.dart' as _i4;
import 'package:plante/model/veg_status.dart' as _i10;
import 'package:plante/outside/backend/backend.dart' as _i7;
import 'package:plante/outside/backend/backend_error.dart' as _i8;
import 'package:plante/outside/backend/backend_product.dart' as _i9;
import 'package:plante/outside/backend/backend_products_at_shop.dart' as _i11;
import 'package:plante/outside/backend/backend_response.dart' as _i3;
import 'package:plante/outside/backend/backend_shop.dart' as _i12;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResult<OK, ERR> extends _i1.Fake implements _i2.Result<OK, ERR> {}

class _FakeBackendResponse extends _i1.Fake implements _i3.BackendResponse {}

/// A class which mocks [UserParamsController].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserParamsController extends _i1.Mock
    implements _i4.UserParamsController {
  MockUserParamsController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addObserver(_i4.UserParamsControllerObserver? observer) =>
      super.noSuchMethod(Invocation.method(#addObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  void removeObserver(_i4.UserParamsControllerObserver? observer) =>
      super.noSuchMethod(Invocation.method(#removeObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i6.UserParams?> getUserParams() =>
      (super.noSuchMethod(Invocation.method(#getUserParams, []),
              returnValue: Future<_i6.UserParams?>.value())
          as _i5.Future<_i6.UserParams?>);
  @override
  _i5.Future<void> setUserParams(_i6.UserParams? userParams) =>
      (super.noSuchMethod(Invocation.method(#setUserParams, [userParams]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
}

/// A class which mocks [Backend].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackend extends _i1.Mock implements _i7.Backend {
  MockBackend() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addObserver(_i7.BackendObserver? observer) =>
      super.noSuchMethod(Invocation.method(#addObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  void removeObserver(_i7.BackendObserver? observer) =>
      super.noSuchMethod(Invocation.method(#removeObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> isLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#isLoggedIn, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Result<_i6.UserParams, _i8.BackendError>> loginOrRegister(
          {String? googleIdToken, String? appleAuthorizationCode}) =>
      (super.noSuchMethod(
              Invocation.method(#loginOrRegister, [], {
                #googleIdToken: googleIdToken,
                #appleAuthorizationCode: appleAuthorizationCode
              }),
              returnValue:
                  Future<_i2.Result<_i6.UserParams, _i8.BackendError>>.value(
                      _FakeResult<_i6.UserParams, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i6.UserParams, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<bool, _i8.BackendError>> updateUserParams(
          _i6.UserParams? userParams,
          {String? backendClientTokenOverride}) =>
      (super.noSuchMethod(
              Invocation.method(#updateUserParams, [userParams],
                  {#backendClientTokenOverride: backendClientTokenOverride}),
              returnValue: Future<_i2.Result<bool, _i8.BackendError>>.value(
                  _FakeResult<bool, _i8.BackendError>()))
          as _i5.Future<_i2.Result<bool, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i9.BackendProduct?, _i8.BackendError>> requestProduct(
          String? barcode) =>
      (super.noSuchMethod(Invocation.method(#requestProduct, [barcode]),
          returnValue:
              Future<_i2.Result<_i9.BackendProduct?, _i8.BackendError>>.value(
                  _FakeResult<_i9.BackendProduct?, _i8.BackendError>())) as _i5
          .Future<_i2.Result<_i9.BackendProduct?, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i8.BackendError>> createUpdateProduct(
          String? barcode,
          {_i10.VegStatus? vegetarianStatus,
          _i10.VegStatus? veganStatus}) =>
      (super.noSuchMethod(
              Invocation.method(#createUpdateProduct, [
                barcode
              ], {
                #vegetarianStatus: vegetarianStatus,
                #veganStatus: veganStatus
              }),
              returnValue: Future<_i2.Result<_i2.None, _i8.BackendError>>.value(
                  _FakeResult<_i2.None, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i8.BackendError>> sendReport(
          String? barcode, String? reportText) =>
      (super.noSuchMethod(Invocation.method(#sendReport, [barcode, reportText]),
              returnValue: Future<_i2.Result<_i2.None, _i8.BackendError>>.value(
                  _FakeResult<_i2.None, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i8.BackendError>> sendProductScan(
          String? barcode) =>
      (super.noSuchMethod(Invocation.method(#sendProductScan, [barcode]),
              returnValue: Future<_i2.Result<_i2.None, _i8.BackendError>>.value(
                  _FakeResult<_i2.None, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i6.UserParams, _i8.BackendError>> userData() =>
      (super.noSuchMethod(Invocation.method(#userData, []),
              returnValue:
                  Future<_i2.Result<_i6.UserParams, _i8.BackendError>>.value(
                      _FakeResult<_i6.UserParams, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i6.UserParams, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<List<_i11.BackendProductsAtShop>, _i8.BackendError>>
      requestProductsAtShops(Iterable<String>? osmIds) => (super.noSuchMethod(
          Invocation.method(#requestProductsAtShops, [osmIds]),
          returnValue: Future<_i2.Result<List<_i11.BackendProductsAtShop>, _i8.BackendError>>.value(
              _FakeResult<List<_i11.BackendProductsAtShop>,
                  _i8.BackendError>())) as _i5
          .Future<_i2.Result<List<_i11.BackendProductsAtShop>, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<List<_i12.BackendShop>, _i8.BackendError>> requestShops(
          Iterable<String>? osmIds) =>
      (super.noSuchMethod(Invocation.method(#requestShops, [osmIds]),
          returnValue: Future<
                  _i2.Result<List<_i12.BackendShop>, _i8.BackendError>>.value(
              _FakeResult<List<_i12.BackendShop>, _i8.BackendError>())) as _i5
          .Future<_i2.Result<List<_i12.BackendShop>, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i8.BackendError>> productPresenceVote(
          String? barcode, String? osmId, bool? positive) =>
      (super.noSuchMethod(
          Invocation.method(#productPresenceVote, [barcode, osmId, positive]),
          returnValue: Future<_i2.Result<_i2.None, _i8.BackendError>>.value(
              _FakeResult<_i2.None, _i8.BackendError>())) as _i5
          .Future<_i2.Result<_i2.None, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i8.BackendError>> putProductToShop(
          String? barcode, String? osmId) =>
      (super.noSuchMethod(
              Invocation.method(#putProductToShop, [barcode, osmId]),
              returnValue: Future<_i2.Result<_i2.None, _i8.BackendError>>.value(
                  _FakeResult<_i2.None, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i8.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i12.BackendShop, _i8.BackendError>> createShop(
          {String? name, _i13.Point<double>? coords, String? type}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #createShop, [], {#name: name, #coords: coords, #type: type}),
              returnValue:
                  Future<_i2.Result<_i12.BackendShop, _i8.BackendError>>.value(
                      _FakeResult<_i12.BackendShop, _i8.BackendError>()))
          as _i5.Future<_i2.Result<_i12.BackendShop, _i8.BackendError>>);
  @override
  _i5.Future<_i3.BackendResponse> customGet(String? path,
          [Map<String, String>? queryParams, Map<String, String>? headers]) =>
      (super.noSuchMethod(
              Invocation.method(#customGet, [path, queryParams, headers]),
              returnValue:
                  Future<_i3.BackendResponse>.value(_FakeBackendResponse()))
          as _i5.Future<_i3.BackendResponse>);
}
