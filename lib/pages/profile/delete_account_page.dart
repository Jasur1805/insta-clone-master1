

import '../../database/users.dart';
import '../../services/io_service.dart';
import '../intro_page.dart';
import '../state_widget.dart';
import 'profile_page.dart';

class DeleteAccountPage extends StateWidget {
  @override
  void build() {
    io.console("Are you sure you want to leave us ? (y - yes,n - no)");
    switch(io.text) {
      case "y":{
        users.remove(currentUser);
        currentUser = null;
        print("Your account succesfully deleted,We hope you will return soon !!!");
        IntroPage();
        return;
      }
      default: {
        print("We are happy that you stayed with us");
        ProfilePage();
        return;
      }
    }

  }
}