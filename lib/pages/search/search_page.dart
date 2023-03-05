import '../../database/users.dart';
import '../../services/io_service.dart';
import '../home_page.dart';

class SearchPage {
  void searchUser() {
    io.console('Please entry user name for searching \n');
    users.forEach((element) {
      if (element.fullname == io.text) {
        if (currentUser!.followersList.contains(element)) {
          io.console(
              '${element.fullname} : Following : ${element.posts.length} \n');
          io.console('1.unfollow \n2.posts');
          if (io.number == 1) {
            currentUser!.unFollow(element);
          } else if (io.number == 2) {
            element.posts.forEach((element) {
              print('$element\n');
            });
          } else {
            HomePage();
          }
        } else {
          io.console(
              'Name : ${element.fullname} , Follow , Posts : ${element.posts.length} \n');
          io.console('1.follow \n2.posts \n');
          if (io.number == 1) {
            currentUser!.addFollower(element);
            io.console('following!');
          } else if (io.number == 2) {
            element.posts.forEach((element) {
              print('$element\n');
            });
          } else {
            HomePage();
            return;
          }
        }
      }
    });
    HomePage();
    return;
  }
}
