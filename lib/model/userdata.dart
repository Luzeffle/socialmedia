import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List<Userpost> UserList = [
    Userpost(
        userimg: 'assets/user1.jpg',
        username: 'Wilson',
        time: '3 hrs ago',
        postcontent: 'Tama',
        postimg: 'assets/post1.jpg',
        numcomments: '2',
        numshare: '10',
        isLiked: true,
    ),
    Userpost(
      userimg: 'assets/user2.jpg',
      username: 'Nathan',
      time: '6 hrs ago',
      postcontent: 'Goodbye Davao, Hello Manila',
      postimg: 'assets/post2.png',
      numcomments: '5',
      numshare: '2',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/user3.jpg',
      username: 'Mike',
      time: '20 mins ago',
      postcontent: 'Pauwi na',
      postimg: 'assets/post3.png',
      numcomments: '1',
      numshare: '0',
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/user4.jpg',
      username: 'Jeo',
      time: '2 hrs ago',
      postcontent: 'Cutie memeng',
      postimg: 'assets/post4.jpg',
      numcomments: '10',
      numshare: '5',
      isLiked: true,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/user1.jpg', name: 'Wilson'),
    Friend(img: 'assets/user2.jpg', name: 'Nathan'),
    Friend(img: 'assets/user3.jpg', name: 'Mike'),
    Friend(img: 'assets/user4.jpg', name: 'Jeo'),
    Friend(img: 'assets/user5.jpg', name: 'Jay'),
    Friend(img: 'assets/user6.jpg', name: 'Mark'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
        commenterImg: 'assets/user1.jpg',
        commenterName: 'Luigi',
        commentTime: '20 mins ago',
        commentContent: 'Bisaya',
    ),
    Usercomment(
        commenterImg: 'assets/user2.jpg',
        commenterName: 'Mario',
        commentTime: '5 mins ago',
        commentContent: 'Correct ka',
    ),
    Usercomment(
        commenterImg: 'assets/user3.jpg',
        commenterName: 'Peach',
        commentTime: '2 mins ago',
        commentContent: 'Jejemon',
    ),
  ];

  Account myUserAccount = Account(
      name: 'Angelo O. Lozano',
      email: 'a.lozano.547237@umindanao.edu.ph',
      img: 'assets/user1.jpg',
      numFollowers: '1 Million',
      numPosts: '67',
      numFollowing: '0',
      numFriends: '0',
  );
}