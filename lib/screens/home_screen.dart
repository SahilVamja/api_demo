import 'package:api_demo/Model/albums_model.dart';
import 'package:api_demo/Model/user_model.dart';
import 'package:api_demo/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


   bool isLoading = false;
   late Future<UserResponse> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AlbumsResponse>>(
        future: getAlbums(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.map((user) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(user.id.toString()),
                  Text(user.title.toString()),
                ],
              ),
            )).toList(),
          );
        },
      ),
    );
    // return Scaffold(
    //   body:FutureBuilder<UserResponse>(
    //     future: futureAlbum,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Center(child: Text(snapshot.data!.title.toString()));
    //       } else if (snapshot.hasError) {
    //         return Center(child: Text('${snapshot.error}'));
    //       }
    //
    //       // By default, show a loading spinner.
    //       return const CircularProgressIndicator();
    //     },
    //   )
    // );
  }
}
