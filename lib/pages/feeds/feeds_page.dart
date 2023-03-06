import '../../services/io_service.dart';
import '../../database/users.dart';
import '../../database/posts.dart';
import '../../pages/home_page.dart';
import '../state_widget.dart';
class Feeds extends StateWidget {
  @override
  void build(){

    print('1.Following and posts\n2.Like post \n3.Delete post\n4.home\n');
    int number = io.number;

    if(number<0||number>4) {
      print('please entry valid command');
      Feeds();
      return;
    }

    switch (number){
      case 1:{
        currentUser!.showFolloing();
        currentUser!.showPosts();
        Feeds();
        return;
      }
      case 2:{
        posts.forEach((element) {print(element);});
        print('entry title of post');
        String title = io.text;
        if(title.isEmpty){
          print('title can not be empty');
          Feeds();
          return;
        }
        posts.forEach((element) {
          if(element.title==title){
            currentUser!.likePost(element);
            Feeds();
            return;
          }
        });

      };break;
      case 3:{

      };break;
      case 4:{
        HomePage();
      };break;
    }

  }
}