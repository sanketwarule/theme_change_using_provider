//import 'dart:convert';
//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:http/io_client.dart';
//import 'package:sales_infusion/network/network_listener.dart';
//import 'package:theme_change_using_provider/network_call/network_listener.dart';
//
//class NetworkHandler {
//  String base_url = "http://salesinfusion.com/Services/";
//  NetworkListener responseListener;
//  BuildContext prevContext;
//  HttpClient _httpClient;
//
//  execute(url, body) async {
//    try {
//      bool trustSelfSigned = true;
//      _httpClient = new HttpClient()
//        ..badCertificateCallback =
//        ((X509Certificate cert, String host, int port) => trustSelfSigned);
//      IOClient ioClient = new IOClient(_httpClient);
//
//      //Encoding the Body to JSON.....
//      var _body = jsonEncode(body);
//      print("body = ${_body}");
////    _body = getBase64EncodedParams(_body);
//
//      Map<String, Object> params = new Map<String, Object>();
//      params['KeyStr'] = _body;
//      print("_body = ${_body}");
//
////    Map<String, String> headers = {
////      "Accept": "application/json",
////      "Content-Type": "application/json",
////    };
//
//      Map<String, String> headers = {"Accept": "application/json"};
//
//      await ioClient
//          .post(base_url + url, headers: headers, body: jsonEncode(params))
//          .then(
//            (response) {
//          print("Response status: ${response.statusCode}");
//          print("Request Url : ${response.request.url}");
//          print("params :: ${params}");
//          print("Response body: ${response.body}");
////      String responseRaw = getBase64DecodedParams(response.body);
////          Navigator.of(context).pop(result);
////          Navigator.pop(context);//
//
//          if(Navigator.canPop(prevContext)){
////            Navigator.of(prevContext).pop();
//          }
//
////          NavigatorStateFromKeyOrContext.of(prevContext).pop();
//
//
//          if (response.statusCode == 200) {
//            responseListener.onSuccess(response.body);
//
//          } else {
////    responseListener.onFailure();
//            print("error");
//          }
//        },
//      );
//    } catch (exception) {
//      print("inside catch ${exception}");
//      responseListener.onFailure(exception);
////      Navigator.pop(context);
//      if(Navigator.canPop(prevContext)){
////            Navigator.of(prevContext).pop();
//      }
////      NavigatorStateFromKeyOrContext.of(prevContext).pop();
//
//
//    }
//
//  }
//
//  setResponseListener(NetworkListener responseListener, BuildContext context) {
//    this.responseListener = responseListener;
//    this.prevContext = context;
////    _onLoading();
//  } //setResponseListener closes here.....
//
//  close(){
//    this._httpClient?.close(force: true);
//  }
//
//  getBase64EncodedParams(body) {
//    var base64Params = base64.encode(utf8.encode(body));
//
//    //We will add this base64 in JSON & return the JSON....
//    Map<String, Object> params = new Map<String, Object>();
//    params['KeyStr'] = base64Params;
//
//    return json.encode(params);
//  } //getBase64EncodedParams closes here....
//
//  getBase64DecodedParams(String encodedString) {
////    Uint8List decodedString = base64.decode(encodedString);
//
//    encodedString = encodedString.replaceAll("\"", "");
//    var uint8List = base64.decode(encodedString);
//    String decodedString = new String.fromCharCodes(uint8List);
//    print("Decoded String = ${decodedString}");
//    return decodedString;
//  }
//
//  void _onLoading() {
//    showDialog(
//      context: prevContext,//NavigatorStateFromKeyOrContext.of(prevContext).context,
//      barrierDismissible: false,
//      builder: (contextV2) => new Dialog(
//          child: Padding(
//            padding: EdgeInsets.all(25.0),
//            child: new Column(
//              mainAxisSize: MainAxisSize.min,
//              children: [
//                new CircularProgressIndicator(
//
//                ),
//                Padding(
//                  padding: EdgeInsets.all(10),
//                ),
//                new Text("Loading...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
//              ],
//            ),
//          )),
//    );
//
//
//  }
//
//}
