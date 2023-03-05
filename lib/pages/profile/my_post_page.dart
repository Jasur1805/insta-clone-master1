

import '../../database/users.dart';
import '../../models/post.dart';
import '../../services/io_service.dart';
import '../state_widget.dart';
import 'profile_page.dart';

class MyPostPage extends StateWidget {
  @override
  void build() {
    print("Welcome to your posts");
    print("Please choose right sorting argument for your posts");
    print("1.title");
    print("2.date");
    io.console("Choose right one(by default is by likes): ");
    int command = io.number;
    switch (command) {
      case 1:
        {
          Post.sortType = PostSort.title;
        }
        break;
      case 2:
        {
          Post.sortType = PostSort.date;
        }
        break;
    }
    print("\n\nHere is your posts");
    for (Post post in currentUser!.posts) {
      print(post);
    }
    io.text;
    print("\n\n\n\n");
    ProfilePage().build();
  }
}
