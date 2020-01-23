import 'package:marvel_app/Locator_service.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'package:marvel_app/services/ApiService.dart';
import 'package:scoped_model/scoped_model.dart';
class Charcterscopmodel extends Model
{
  ApiService apiService = Locatorgetit<ApiService>();
 Future<List<CharcterModel>>DataList ;
Future<void> Fecthcdata()async
{
  DataList =  apiService.FechtDataCharacter();
  notifyListeners();
}


}