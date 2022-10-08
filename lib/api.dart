import 'dart:convert';
import 'dart:math';
import 'package:api_demo/Model/albums_model.dart';
import 'package:api_demo/Model/data_model.dart';
import 'package:api_demo/Model/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<AlbumsResponse>> getAlbums() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  if (response.statusCode == 200) {
    final jsonItems = json.decode(response.body).cast<Map<String, dynamic>>();
    List<AlbumsResponse> albums = jsonItems.map<AlbumsResponse>((json) {
      return AlbumsResponse.fromJson(json);
    }).toList();
    return albums;
  } else {
    throw Exception("Fail To Load Data");
  }
}

Future<UserResponse> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<DataResponse> listOfList() async {
  final response = await http.get(
      Uri.parse('https://api.commonstandardsproject.com/api/v1/jurisdictions'));

  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body.toString()));
  } else {
    throw Exception('Failed to load album');
  }
}
