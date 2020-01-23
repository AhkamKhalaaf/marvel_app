import 'package:get_it/get_it.dart';
import 'package:marvel_app/scopedmodels/CharcterScopedmodel.dart';
import 'package:marvel_app/services/ApiService.dart';

GetIt Locatorgetit = GetIt();
void SetupLoctor()
{
  Locatorgetit.registerFactory<Charcterscopmodel>(()=>Charcterscopmodel());
  Locatorgetit.registerLazySingleton<ApiService>(()=>ApiService());

}