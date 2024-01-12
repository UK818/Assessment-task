import 'package:get_it/get_it.dart';
import 'package:tezda_assessent_task/bloc/auth_cubit.dart';
import 'package:tezda_assessent_task/bloc/product_cubit.dart';
import 'package:tezda_assessent_task/services/api_service.dart';

class DiContainer {
  static final getIt = GetIt.instance;

  static setUpDi() {
    getIt
        .registerLazySingleton<ProductServiceInterface>(() => ProductService());

    getIt.registerFactory(() => ProductCubit(productService: getIt()));

    // getIt.registerFactory(() => AuthenticationCubit());
  }
}
