import '../../database/users.dart';
import '../home_page.dart';
import '../state_widget.dart';
class LikePosts extends StateWidget {
  @override
  void build(){
    currentUser!.showLikedPosts();
    HomePage();
  }
}