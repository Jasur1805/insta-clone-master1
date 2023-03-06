import '../../database/users.dart';
import '../../services/io_service.dart';
import '../home_page.dart';
import '../state_widget.dart';
class SearchPage extends StateWidget{
  @override
  void build() {
    io.console('Please entry user name for searching \n');
    String fullName =io.text;
    users.forEach((element) {
      if (element.fullname == fullName) {
        if (currentUser!.searchFollower(element)) {

          io.console(
              '${element.fullname} : Following : ${element.posts.length} \n');
          io.console('1.unfollow \n2.posts \n3.home\n');
          int number = io.number;

          if(number ==1){
            print('unfollowing!');
            currentUser!.unFollow(element);
            SearchPage();
            return;
          }else if(number==2){
            element.posts.forEach((element) {print(element);});
            SearchPage();
            return;
          } else if(number==3){
            HomePage();
          }else{
            print('entry valid command');
            SearchPage();
            return;
          }
        }
        else {
          io.console(
              'Name : ${element.fullname} , Follow , Posts : ${element.posts.length} \n');
          io.console('1.follow \n2.posts \n3.home\n');
          int number = io.number;
          if(number ==1){
            print('following!');
            currentUser!.addFollower(element);
            SearchPage();
            return;
          }else if(number==2){
            element.posts.forEach((element) {print(element);});
            SearchPage();
            return;
          } else if(number==3){
            HomePage();
          }else{
            print('entry valid command');
            SearchPage();
            return;
          }

        }
      }else {
        SearchPage();
      }
    });
  }
}
