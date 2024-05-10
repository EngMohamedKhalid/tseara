import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tseara/features/auth_feature/domain/use_cases/auth_usecases/login_use_case.dart';
import '../../features/auth_feature/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_feature/data/repo_impl/auth_repo_impl.dart';
import '../../features/auth_feature/domain/repo/auth_repo.dart';
import '../../features/auth_feature/domain/use_cases/auth_usecases/register_use_case.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<PaymentRemoteDataSource>(() => PaymentRemoteDataSourceImpl());

  //* Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepoImpl(paymentRemoteDataSource: getIt(), networkInfo: getIt()),);

  //* Use cases
  _authUseCases();
  _paymentUseCase();
  _cartUseCases();
  _favouriteUseCases();


  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  // getIt.registerLazySingleton<FirebaseNotificationService>(() => FirebaseNotificationService(),);
  // getIt.registerLazySingleton<FlutterLocalNotificationService>(() => FlutterLocalNotificationService(),);
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerSingleton<CacheService>(CacheService());
}
void _paymentUseCase() {
  // getIt.registerLazySingleton<EphemeralKeyUseCase>(() => EphemeralKeyUseCase(paymentRepo: getIt()));
  // getIt.registerLazySingleton<CreateCustomerUseCase>(() => CreateCustomerUseCase(paymentRepo: getIt()));
  // getIt.registerLazySingleton<CreatePaymentIntentUseCase>(() => CreatePaymentIntentUseCase(paymentRepo: getIt()));
}

void _authUseCases() {
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(repository: getIt(),));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: getIt(),));
}
void _cartUseCases() {
  //registerLazySingleton<PlaceOrderUseCase>(() => PlaceOrderUseCase(repository: getIt()));
}
void _favouriteUseCases() {
  // getIt.registerLazySingleton<UpdateFavouriteQuantityUseCase>(() => UpdateFavouriteQuantityUseCase(repository: getIt()));
}