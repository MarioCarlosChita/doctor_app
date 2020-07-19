
import 'package:doctor_app/viewmodel/loginmodel.dart';
import 'package:doctor_app/service/api.dart';
import 'package:doctor_app/service/authentication_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(()=>Api());
  locator.registerLazySingleton(()=>LoginModel());
}