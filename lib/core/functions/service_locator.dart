
import 'package:dio/dio.dart';
import 'package:educational_app/core/services/api_services.dart';
import 'package:educational_app/features/home_screen/data/home_repo_impl.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

void setUp(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        getIt.get<ApiService>(),
    ),
  );
}