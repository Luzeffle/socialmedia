import 'package:flutter/material.dart';
import '../model/userdata.dart';
import '../views/friendlist.dart';
import '../views/infoheader.dart';
import '../views/mainheader.dart';
import '../views/postlist.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  Userdata userData = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            )
        ),
        body: ListView(
            shrinkWrap: true,
            children: [
              Mainheader(userdata: userData),
              Infoheader(userdata: userData),
              Friendlist(userdata: userData),
              const SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(children: [Text('Posts', style: followTxtStyle,)],)
              ),
              const SizedBox(height: 20,),
              PostList(userData: userData),
            ]
        )
    );
  }
}