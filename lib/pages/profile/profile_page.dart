

import '../../services/io_service.dart';
import '../home_page.dart';
import '../state_widget.dart';
import 'delete_account_page.dart';
import 'edit_account_page.dart';
import 'log_out_page.dart';
import 'my_post_page.dart';

class ProfilePage implements StateWidget {
  @override
  void build() {
    print("\t\tWelcome to Post Page");
    print("1. MyPost");
    print("2. Edit Account");
    print("3. LogOut");
    print("4. DeleteAccount");
    print("5. Home Page");
    int command = io.number;
    if (command < 1 || command > 5) {
      print("Iltimos To'g'ri buyruq kiriting");
      print("\n\n\n\n");
      ProfilePage();
      return;
    }
    switch (command) {
      case 1:
        {
          MyPostPage();
        }
        break;
      case 2:
        {
          EditAccountPage();
        }
        break;
      case 3:
        {
          LogOutPage();
        }
        break;
      case 4:
        {
          DeleteAccountPage();
        }
        break;
      case 5: {
        HomePage();
      }
      break;
      default:
        {
          print("Iltimos to'g'ri buyruq kiriting");
          ProfilePage().build();
        }
    }
  }
}
