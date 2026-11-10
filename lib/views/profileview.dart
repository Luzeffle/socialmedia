import 'package:flutter/material.dart';
import '../model/userpost.dart';
import '../model/userdata.dart';
import '../model/usercomment.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});

  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();

  final TextEditingController commentController = TextEditingController();

  late List<Usercomment> comments;

  @override
  void initState() {
    super.initState();

    comments = List.from(userData.commentList);
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void addComment() {
    if(commentController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      comments.add(
        Usercomment(
          commenterImg: userData.myUserAccount.img,
          commenterName: 'Angelo O. Lozano',
          commentTime: 'Just now',
          commentContent: commentController.text.trim(),
        ),
      );
      commentController.clear();
    });
  }

  final nameTxtStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  final boldTxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  final boldTxtStyle2 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  Widget commentBtn(Usercomment comment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(comment.commentTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDesc(Usercomment comment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(comment.commenterName, style: boldTxtStyle),
        const SizedBox(width: 5),
        Row(
            children: [
              Text(comment.commentContent)
            ]
        ),
      ],
    ),
  );

  Widget commentSpace(Usercomment comment) => Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: commentDesc(comment),
  );

  Widget commenterPic(Usercomment comment) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(comment.commenterImg),
    ),
  );

  Widget userCommenterLine(Usercomment comment) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commenterPic(comment),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commentSpace(comment),
            commentBtn(comment),
          ]
      )
    ],
  );

  Widget userPostDetails(Usercomment comment) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      userCommenterLine(comment),
    ],
  );

  Widget commenters(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
            children: [
              Text(userPost.numshare, style: boldTxtStyle),
            ]
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All Comments', style: boldTxtStyle2),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    ],
  );

  Widget buttons(Userpost userPost) => Row(
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
                foregroundColor: userPost.isLiked ? Colors.grey : Colors.blue,
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
              onPressed: () {},
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

  Widget userLine(Userpost userPost) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(userPost.userimg),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nameTxtStyle),
              const SizedBox(height: 5),
              Row(
                  children: [
                    Text(userPost.time),
                    const SizedBox(width: 5),
                    const Icon(Icons.group, size: 15, color: Colors.grey),

                  ]
              )
            ]
        )
      ]
  );

  Widget postImage(Userpost userPost) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(userPost.postcontent),
              ],
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(userPost.postimg, width: double.infinity, fit: BoxFit.cover,),
            ),
          ]
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: const Icon(Icons.arrow_back, color: Colors.grey)
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  userLine(widget.userPost),
                  postImage(widget.userPost),
                  buttons(widget.userPost),
                  commenters(widget.userPost),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: comments.map((userComment) => userPostDetails(userComment)).toList(),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) {
                          addComment();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Write a comment...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: addComment,
                      icon: const Icon(Icons.send),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}