import '../../database/users.dart';
import '../../services/io_service.dart';
import '../home_page.dart';

class SearchPage {
  void searchUser() {
    io.console('Please entry user name for searching \n');
    String fullName =io.text;
    users.forEach((element) {
      if (element.fullname == fullName) {


        if (currentUser!.followersList.contains(element)) {

          io.console(
              '${element.fullname} : Following : ${element.posts.length} \n');
          io.console('1.unfollow \n2.posts \n3.home\n');
          int number = io.number;

          if(number ==1){
            print('unfollowing!');
            currentUser!.unFollow(element);
            searchUser();
          }else if(number==2){
            element.posts.forEach((element) {print(element);});
            searchUser();
          } else if(number==3){
            HomePage();
            return;
          }else{
            print('entry valid command');
            searchUser();
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
            searchUser();
          }else if(number==2){
            element.posts.forEach((element) {print(element);});
            searchUser();
          } else if(number==3){
            HomePage();
            return;
          }else{
            print('entry valid command');
            searchUser();
          }

        }
      }else {
        searchUser();
      }
    });
  }
}
