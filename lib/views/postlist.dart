import 'package:flutter/material.dart';
import 'profileview.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userData});

  final Userdata userData;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var nameTxtStyle = const TextStyle(fontSize: 16);

  void goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(BuildContext context, Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {setState(() {
                userPost.isLiked ? userPost.isLiked = false : userPost.isLiked = true;
              });},
              icon: const Icon(Icons.thumb_up, size: 20),
              label: Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.grey
              ),
              onPressed: () {
                goToPage(context, ProfileView(userPost: userPost));
              },
              icon: const Icon(Icons.chat_bubble_outline, size: 20),
              label: Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.grey
              ),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: Text('Share'),
            ),
          ],
        ),
      )
    ],
  );

  Widget postCount(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.numcomments} Comments'),
      const Text(''),
      const SizedBox(width: 20,),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage(Userpost userPost) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.fill,
            )
        ),
      )
  );

  Widget postHeader(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(userPost.userimg),
          )
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nameTxtStyle,),
          Row(
            children: [
              Text('${userPost.time} . '),
              const Icon(Icons.people, size: 18),
            ],
          )
        ],
      )
    ],
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [Text(userPost.postcontent, style: nameTxtStyle )],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(context, userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15,),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userData.UserList.map((userPost) {
        return InkWell(
          onTap: () {
            goToPage(context, ProfileView(userPost: userPost));
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}