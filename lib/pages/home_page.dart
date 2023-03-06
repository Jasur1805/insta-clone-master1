import '../services/io_service.dart';
import 'profile/profile_page.dart';
import 'search/search_page.dart';
import '../pages/post_creating_page.dart';
import '../pages/feeds/like.dart';
import 'state_widget.dart';
import '../pages/feeds/feeds_page.dart';
class HomePage extends StateWidget {
  @override
  void build() {
    print("Welcome to HomePage!");

    print("1. Feeds");
    print("2. Search(User)");
    print("3. Post(create)");
    print("4. Likes");
    print("5. Profile");
    int command = io.number;
    if (command < 1 || command > 5) {
      print("Iltimos To'g'ri buyruq kiriting");
      print("\n\n\n\n");
      HomePage();
      return;
    }
    switch (command) {
      case 1:
        {
          Feeds().build();
        }
        break;
      case 2:
        {
          SearchPage().build();
        }
        break;
      case 3:
        {
          CreatePost().build();
        }
        break;
      case 4:
        {
          LikePosts().build();
        }
        break;
      case 5:
        {
          ProfilePage().build();
        }
        break;
      default:
        {
          print("Iltimos to'g'ri buyruq kiriting");
          HomePage();
        }
    }
  }
}
