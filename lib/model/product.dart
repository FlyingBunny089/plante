import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:plante/base/build_value_helper.dart';
import 'package:plante/model/ingredient.dart';
import 'package:plante/model/lang_code.dart';
import 'package:plante/model/moderator_choice_reason.dart';
import 'package:plante/model/veg_status.dart';
import 'package:plante/model/veg_status_source.dart';

part 'product.g.dart';

enum ProductImageType {
  FRONT,
  FRONT_THUMB,
  INGREDIENTS,
}

abstract class Product implements Built<Product, ProductBuilder> {
  static final Product empty = Product((e) => e.barcode = '');

  String get barcode;
  VegStatus? get vegetarianStatus;
  VegStatusSource? get vegetarianStatusSource;
  VegStatus? get veganStatus;
  VegStatusSource? get veganStatusSource;

  int? get moderatorVegetarianChoiceReasonId;
  String? get moderatorVegetarianSourcesText;
  int? get moderatorVeganChoiceReasonId;
  String? get moderatorVeganSourcesText;

  /// Service field to implement single-lang getters
  /// (in [ProductLangsMechanicsExtension]).
  BuiltList<LangCode> get langsPrioritized;

  LangCode get mainLang => langsPrioritized.first;

  /// We consider brands to be not translatable.
  BuiltList<String>? get brands;
  BuiltMap<LangCode, String> get nameLangs;
  BuiltMap<LangCode, String> get ingredientsTextLangs;

  /// NOTE: the field is NOT send to any backend, only obtained from them.
  BuiltMap<LangCode, BuiltList<Ingredient>> get ingredientsAnalyzedLangs;

  BuiltMap<LangCode, Uri> get imageFrontLangs;
  BuiltMap<LangCode, Uri> get imageFrontThumbLangs;
  BuiltMap<LangCode, Uri> get imageIngredientsLangs;

  static Product? fromJson(Map<dynamic, dynamic> json) {
    return BuildValueHelper.jsonSerializers.deserializeWith(serializer, json);
  }

  Map<String, dynamic> toJson() {
    return BuildValueHelper.jsonSerializers.serializeWith(serializer, this)!
        as Map<String, dynamic>;
  }

  factory Product([void Function(ProductBuilder) updates]) = _$Product;
  Product._();
  static Serializer<Product> get serializer => _$productSerializer;
}

extension ProductLangsMechanicsExtension on Product {
  String? get name => _getPrioritized(nameLangs);
  String? get ingredientsText => _getPrioritized(ingredientsTextLangs);
  BuiltList<Ingredient>? get ingredientsAnalyzed =>
      _getPrioritized(ingredientsAnalyzedLangs);
  Uri? get imageFront => _getPrioritized(imageFrontLangs);
  Uri? get imageFrontThumb => _getPrioritized(imageFrontThumbLangs);
  Uri? get imageIngredients => _getPrioritized(imageIngredientsLangs);

  T? _getPrioritized<T>(BuiltMap<LangCode, T> map) {
    for (final lang in langsPrioritized) {
      final value = map[lang];
      if (value != null) {
        return value;
      }
    }
    return null;
  }
}

extension ProductModeratorChoiceExtension on Product {
  ModeratorChoiceReason? get moderatorVegetarianChoiceReason {
    return moderatorChoiceReasonFromPersistentId(
        moderatorVegetarianChoiceReasonId ?? -1);
  }

  ModeratorChoiceReason? get moderatorVeganChoiceReason {
    return moderatorChoiceReasonFromPersistentId(
        moderatorVeganChoiceReasonId ?? -1);
  }
}

extension ProductVegAnalysisExtensions on Product {
  VegStatus? get vegetarianStatusAnalysis {
    final ingredientsAnalyzed = this.ingredientsAnalyzed;
    if (ingredientsAnalyzed == null || ingredientsAnalyzed.isEmpty) {
      return null;
    }
    if (ingredientsAnalyzed
        .where((v) => v.vegetarianStatus == VegStatus.negative)
        .isNotEmpty) {
      return VegStatus.negative;
    }
    if (ingredientsAnalyzed
        .where((v) => v.vegetarianStatus == VegStatus.unknown)
        .isNotEmpty) {
      return VegStatus.unknown;
    }
    if (ingredientsAnalyzed
        .where((v) => v.vegetarianStatus == VegStatus.possible)
        .isNotEmpty) {
      return VegStatus.possible;
    }
    // NOTE: a veg status of an ingredient can also be null, that means that
    // the status of the ingredient shoud be ignored
    return VegStatus.positive;
  }

  VegStatus? get veganStatusAnalysis {
    final ingredientsAnalyzed = this.ingredientsAnalyzed;
    if (ingredientsAnalyzed == null || ingredientsAnalyzed.isEmpty) {
      return null;
    }
    if (ingredientsAnalyzed
        .where((v) => v.veganStatus == VegStatus.negative)
        .isNotEmpty) {
      return VegStatus.negative;
    }
    if (ingredientsAnalyzed
        .where((v) => v.veganStatus == VegStatus.unknown)
        .isNotEmpty) {
      return VegStatus.unknown;
    }
    if (ingredientsAnalyzed
        .where((v) => v.veganStatus == VegStatus.possible)
        .isNotEmpty) {
      return VegStatus.possible;
    }
    // NOTE: a veg status of an ingredient can also be null, that means that
    // the status of the ingredient shoud be ignored
    return VegStatus.positive;
  }
}

extension ProductImageExtensions on Product {
  bool isFrontImageFile(LangCode lang) =>
      isImageFile(ProductImageType.FRONT, lang);
  bool isFrontImageRemote(LangCode lang) =>
      isImageRemote(ProductImageType.FRONT, lang);
  bool isFrontThumbImageFile(LangCode lang) =>
      isImageFile(ProductImageType.FRONT_THUMB, lang);
  bool isFrontThumbImageRemote(LangCode lang) =>
      isImageRemote(ProductImageType.FRONT_THUMB, lang);
  bool isIngredientsImageFile(LangCode lang) =>
      isImageFile(ProductImageType.INGREDIENTS, lang);
  bool isIngredientsImageRemote(LangCode lang) =>
      isImageRemote(ProductImageType.INGREDIENTS, lang);

  bool isImageFile(ProductImageType imageType, LangCode lang) =>
      _isImageFile(imageUri(imageType, lang));
  bool isImageRemote(ProductImageType imageType, LangCode lang) =>
      _isImageRemote(imageUri(imageType, lang));

  Uri? imageUri(ProductImageType imageType, LangCode lang) {
    switch (imageType) {
      case ProductImageType.FRONT:
        return imageFrontLangs[lang];
      case ProductImageType.INGREDIENTS:
        return imageIngredientsLangs[lang];
      case ProductImageType.FRONT_THUMB:
        return imageFrontThumbLangs[lang];
      default:
        throw Exception('Unhandled item: $imageType');
    }
  }

  /// First image among images for all langs
  Uri? firstImageUri(ProductImageType imageType) {
    for (final lang in langsPrioritized) {
      final uri = imageUri(imageType, lang);
      if (uri != null) {
        return uri;
      }
    }
    return null;
  }

  /// First image among images for all langs
  bool isFirstImageFile(ProductImageType imageType) =>
      _isImageFile(firstImageUri(imageType));

  /// First image among images for all langs
  bool isFirstImageRemote(ProductImageType imageType) =>
      _isImageRemote(firstImageUri(imageType));

  bool _isImageFile(Uri? uri) {
    if (uri == null) {
      return false;
    }
    return uri.isScheme('FILE');
  }

  bool _isImageRemote(Uri? uri) {
    if (uri == null) {
      return false;
    }
    return !_isImageFile(uri);
  }

  Product rebuildWithImage(
      ProductImageType imageType, Uri? uri, LangCode lang) {
    switch (imageType) {
      case ProductImageType.FRONT:
        if (uri != null) {
          return rebuild((v) => v.imageFrontLangs[lang] = uri);
        } else {
          return rebuild((v) => v.imageFrontLangs.remove(lang));
        }
      case ProductImageType.INGREDIENTS:
        if (uri != null) {
          return rebuild((v) => v.imageIngredientsLangs[lang] = uri);
        } else {
          return rebuild((v) => v.imageIngredientsLangs.remove(lang));
        }
      case ProductImageType.FRONT_THUMB:
        if (uri != null) {
          return rebuild((v) => v.imageFrontThumbLangs[lang] = uri);
        } else {
          return rebuild((v) => v.imageFrontThumbLangs.remove(lang));
        }
      default:
        throw Exception('Unhandled item: $imageType');
    }
  }
}
