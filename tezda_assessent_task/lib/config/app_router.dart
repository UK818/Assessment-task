import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tezda_assessent_task/bloc/auth_cubit.dart';
import 'package:tezda_assessent_task/bloc/product_cubit.dart';
import 'package:tezda_assessent_task/di/di.dart';
import 'package:tezda_assessent_task/model/product_model.dart';
import 'package:tezda_assessent_task/presentation/favorites_screen.dart';
import 'package:tezda_assessent_task/presentation/login.dart';
import 'package:tezda_assessent_task/presentation/product_detail_screen.dart';
import 'package:tezda_assessent_task/presentation/product_listing_screen.dart';
import 'package:tezda_assessent_task/utils/utils.dart';

final router = GoRouter(navigatorKey: Utils.navigatorKey, routes: [
  GoRoute(
      path: Routes.index,
      builder: (context, state) {
        return LoginScreen();
      }),
  GoRoute(
      path: Routes.productListing,
      builder: (context, state) {
        return BlocProvider(
            create: (context) => DiContainer.getIt<ProductCubit>(),
            child: ProductListingScreen());
      }),
  GoRoute(
    path: Routes.productDetail,
    builder: (context, state) {
      var args = state.extra as Map<String?, Object?>?;
      final product = args?['product'] as Product;

      return BlocProvider(
          create: (context) => DiContainer.getIt<ProductCubit>(),
          child: ProductDetailScreen(product: product));
    },
  ),
  GoRoute(
    path: Routes.favorites,
    builder: (context, state) {
      return BlocProvider(
          create: (context) => DiContainer.getIt<ProductCubit>(),
          child: FavoriteProductsScreen());
    },
  ),
]);

class Routes {
  static const index = '/';
  static const String productListing = '/product_listing';
  static const String productDetail = '/product_detail';
  static const String favorites = '/favorites';
}
