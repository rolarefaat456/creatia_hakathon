import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class Api {
  Future PostApi ( Url, Object body ) async {
    Uri uri = Uri.parse(Url);
    var responseBody = null;
    var response = await http.post( uri, body: body );
    responseBody = jsonDecode(response.body);
    return responseBody;
  }
  Future postapi2 ( url , Object body, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.post(
      urlfinsh,
      headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body as Map,
    );
    print( jsonDecode(response.body));
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);
    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }
    return responsebody;
  }

  Future postapiimage ( url , Object body, XFile? imagefile ,String token) async
  {
    Uint8List bytes = await imagefile!.readAsBytes();
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    var request = http.MultipartRequest('POST', urlfinsh);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add( await http.MultipartFile.fromBytes('image', bytes, filename: imagefile.name ));
    (body as Map).forEach((key, value) {
    request.fields[key] = value;
  });
    var response = await request.send();

    if(response.statusCode == 200)
    {
      var responseb = await http.Response.fromStream(response);
      responsebody = await jsonDecode(responseb.body);
      return responsebody;
    }else{
      return {
      "status": false,
      "message": "Something went wrong",
      "code": response.statusCode,
      "response": responsebody
    };
    }
  }


  Future getapi2 ( url, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.get(
      urlfinsh,
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);

    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }else{
      responsebody = {
      "status": false,
      "message": "Error: ${response.statusCode}"
    };
    }
    return responsebody;
  }

  Future putapi ( url , Object body, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.put(
      urlfinsh,
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);
    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }
    return responsebody;
  }

  Future putapi2 ( url , Object body, XFile? imagefile, String token) async
  {
    Uint8List bytes = await imagefile!.readAsBytes();
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    var request = http.MultipartRequest('PUT', urlfinsh);
    request.headers['Authorization'] = 'Bearer $token';
    (body as Map).forEach((key, value){
      request.fields[key] = value.toString();
    });
    request.files.add( await http.MultipartFile.fromBytes('image', bytes, filename: imagefile.name ));

    var response = await request.send();

    if(response.statusCode == 200)
    {
      var responseb = await http.Response.fromStream(response);
      responsebody = await jsonDecode(responseb.body);
      return responsebody;
    }else{
      return {
      "status": false,
      "message": "Something went wrong",
      "code": response.statusCode,
      "response": responsebody
    };
    }
  }

}