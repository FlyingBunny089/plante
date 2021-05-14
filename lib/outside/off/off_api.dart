import 'package:openfoodfacts/model/OcrIngredientsResult.dart' as off;
import 'package:openfoodfacts/openfoodfacts.dart' as off;
import 'package:plante/base/log.dart';
import 'package:plante/base/settings.dart';
import 'package:plante/outside/off/fake_off_api.dart';

/// OFF wrapper mainly needed for DI in tests
class OffApi {
  final Settings _settings;
  final FakeOffApi _fakeOffApi;

  OffApi(this._settings) : _fakeOffApi = FakeOffApi(_settings);

  Future<off.ProductResult> getProduct(
      off.ProductQueryConfiguration configuration) async {
    if (await _settings.fakeOffApi()) {
      return await _fakeOffApi.getProduct(configuration);
    }
    return await off.OpenFoodAPIClient.getProduct(configuration);
  }

  Future<off.Status> saveProduct(off.User user, off.Product product) async {
    if (await _settings.fakeOffApi()) {
      return await _fakeOffApi.saveProduct(user, product);
    }
    final result = await off.OpenFoodAPIClient.saveProduct(user, product);
    if (result.error != null) {
      Log.w('OffApi.saveProduct error: ${result.toJson()}');
    }
    return result;
  }

  Future<off.Status> addProductImage(off.User user, off.SendImage image) async {
    if (await _settings.fakeOffApi()) {
      return await _fakeOffApi.addProductImage(user, image);
    }
    final result = await off.OpenFoodAPIClient.addProductImage(user, image);
    if (result.error != null) {
      Log.w('OffApi.addProductImage error: ${result.toJson()}');
    }
    return result;
  }

  Future<off.OcrIngredientsResult> extractIngredients(
      off.User user, String barcode, off.OpenFoodFactsLanguage language) async {
    if (await _settings.fakeOffApi()) {
      return await _fakeOffApi.extractIngredients(user, barcode, language);
    }
    final result =
        await off.OpenFoodAPIClient.extractIngredients(user, barcode, language);
    if (result.status != 0) {
      Log.w('OffApi.extractIngredients error: ${result.toJson()}');
    }
    return result;
  }
}
