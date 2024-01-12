import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda_assessent_task/model/product_model.dart';
import 'package:tezda_assessent_task/services/api_service.dart';
import 'package:tezda_assessent_task/utils/constants.dart';
import 'dart:convert';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductServiceInterface productService;
  final _productController = StreamController<List<Product>>();
  Stream<List<Product>> get productsList => _productController.stream;
  List<Product>? favorites;

  ProductCubit({required this.productService}) : super(ProductInitial()) {
    loadFavorites();
  }

  void fetchProducts() async {
    try {
      final List<Product> products = await productService.getProducts();
      _productController.add(products);
      emit(ProductLoadSuccess(products));
    } catch (e) {
      emit(ProductLoadFailure(e.toString()));
    }
  }

  Future<void> loadFavorites() async {
    final preferences = await SharedPreferences.getInstance();
    final favoritesJson = preferences.getString(Constants.favoritesKey);
    if (favoritesJson != null) {
      favorites = (json.decode(favoritesJson) as List<dynamic>)
          .map((item) => Product.fromJson(item))
          .toList();
      emit(ProductLoadSuccess(favorites ?? []));
    }
  }

  Future<void> saveFavorites() async {
    final preferences = await SharedPreferences.getInstance();
    final favoritesJson =
        json.encode(favorites?.map((product) => product.toJson()).toList());
    preferences.setString(Constants.favoritesKey, favoritesJson);
  }

  isProductInFavorites(Product product) async {
    await loadFavorites();

    bool? result = favorites?.contains(product);
    emit(ProductIsFavorite(result ?? false));
  }

  void addProductToFavorites(Product product) {
    favorites?.add(product);
    saveFavorites();
  }

  void removeProductFromFavorites(Product product) {
    favorites?.remove(product);
    saveFavorites();
  }
}
