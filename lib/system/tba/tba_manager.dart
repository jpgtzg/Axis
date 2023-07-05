/// Written by Juan Pablo Gutiérrrez
/// Manages TheBlueAlliance API calls

import 'dart:convert';

import 'package:http/http.dart' as http;

//TODO finish
enum ApiActions {
  as,
  teamData,
}

/// Gets JSON data from specific url
/// 
/// @param {String} url Url at which to retrieve information
/// 
/// @return A List with parsed JSON data
Future<List<dynamic>?> getData(String url) async {
  final response = await getResponse(url);

  return getAsList(response);
}

/// Gets a response from http uri
///
/// @param {String} uri Uri at which retrieve ifnromation
///
/// @return A response object
Future<http.Response> getResponse(String uri) async {
  final url = Uri.parse(uri);

  final response = await http.get(url);

  return response;
}

/// Processes a response
///
/// @param {Response} response Response to be processed
///
/// @returns Null if status code is not 200, response body as a string if true
String? processResponse(http.Response response) {
  if (response.statusCode != 200) {
    print("Could not retrieve information: ${response.statusCode}");
    return null;
  }
  return response.body;
}

/// Gets a Response as a list
///
/// @param {Response} response Response to be casted as a List
///
/// @returns Null if response is null, List if true
List? getAsList(http.Response response) {
  final content = processResponse(response);

  final List contentJson;

  try {
    contentJson = json.decode(content!) as List<dynamic>;
  } catch (e) {
    return null;
  }

  return contentJson;
}