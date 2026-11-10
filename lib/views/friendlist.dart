import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/friend.dart';
import '../model/userdata.dart';

class Friendlist extends StatelessWidget {
  Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    child: Column(
      children: [
        Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                  friend.img,
                  width: double.infinity,
                  fit: BoxFit.cover
              ),
            ),
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(friend.name)),
      ],
    ),
  );

  Widget friendsListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 180,
    ),

    itemCount: userdata.friendList.length,
    itemBuilder: (BuildContext ctx, index) {
      return friend(userdata.friendList[index]);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('Friends', style: followTxtStyle)]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('${userdata.friendList.length} Friends')]),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 380, child: friendsListGrid()),
        SizedBox(height: 10, child: Container(color: Colors.grey)),
      ],
    );
  }
}