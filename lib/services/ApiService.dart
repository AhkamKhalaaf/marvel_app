import 'package:marvel_app/main.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:marvel_app/BaseUri.dart';
import 'package:marvel_app/models/Charctermodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'as httprequest;
class ApiService
{
  Future<List<CharcterModel>> FechtDataCharacter()async
  {
    try{
      final response =await httprequest.get(Basuri);
      if(response.statusCode==200)
      {
        List Responselist = json.decode(response.body)['data']['results'];
        print(Responselist.length);
        return Responselist.map((maap)=>CharcterModel.fromJson(maap)).toList();


      }
    }
    catch(exception)
    {
      print('${exception}');
    }
  }
}