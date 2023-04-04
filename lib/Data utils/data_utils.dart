import 'package:flutter/material.dart';
import 'package:getapi_call/Model/user_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataUtils{
  Future<List<UserModel>>getData () async{
    List<UserModel> userData=[];
    try{
      var request=http.Request(
          "GET",Uri.parse("https://jsonplaceholder.typicode.com/users"));
      http.StreamedResponse response = await request.send();
      if(response.statusCode==200){
        var rawData=await response.stream.bytesToString();
        List<dynamic>data=jsonDecode(rawData);
      }

    }catch(e){

    }
  }
}