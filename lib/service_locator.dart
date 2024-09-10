import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_dio_get_it_shared_preferences/remote_data_source.dart';
import 'package:riverpod_dio_get_it_shared_preferences/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Registrar Dio
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com', // Cambia esto según tu API
  )));

  // Registrar SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Registrar RemoteDataSource
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl(getIt<Dio>()));

  // Registrar Repository
  getIt
      .registerSingleton<Repository>(RepositoryImpl(getIt<RemoteDataSource>()));
}
