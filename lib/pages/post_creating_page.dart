import '../services/io_service.dart';
import '../models/post.dart';
import '../pages/home_page.dart';
import '../pages/state_widget.dart';
import '../database/users.dart';
import '../database/posts.dart';
class CreatePost extends StateWidget {
  @override
  void build() {
    print("\t\t\tWelcome to Post creating page");
    print("""\t\tFirst of all to create post 3 ingredients required: 
title => short meaning of content, it should be at least 10 characters
content => body itself
media link => video or image url => https://""");
    print("\n");
    io.console("Title: ");
    String title = io.text;
    if (title.trim().length < 10) {
      print("Title should be at least 10 characters");
      CreatePost();
      return;
    }
    io.console("Content: ");
    String content = io.text;
    if (content.trim() == "") {
      print("Content can't empty or space");
      CreatePost();
      return;
    }
    io.console("Media url: ");
    String url = io.text;
    var validUrl = RegExp(r"^https://\S+$");
    if (content.trim() == "" || !validUrl.hasMatch(url)) {
      print("Url can't empty or space and url should start from 'https://'");
      CreatePost();
      return;
    }
    currentUser!.writePost(Post(title: title, content: content, mediaUrl: url));
    posts.add(Post(title: title, content: content, mediaUrl: url));
    print("Your post succesfully added");
    print(currentUser!.posts.last);
    io.console("If you want to return to home page input 2 or press Enter to create new post again");
    io.number == 2 ? HomePage() : CreatePost();
  }
}