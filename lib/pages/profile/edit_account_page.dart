

import '../../database/users.dart';
import '../../services/io_service.dart';
import '../../services/password.dart';
import '../home_page.dart';
import '../state_widget.dart';

class EditAccountPage extends StateWidget {
  @override
  void build() {
    print("Welcome to Edit Account Page");
    print("This is your current profile informations");
    print(currentUser);
    print("Which properies do you want to change");
    print("1.Name");
    print("2.Email");
    print("3.Phone");
    print("4.password");

    int command = io.number;
    if (command < 1 || command > 4) {
      print("Choose correct option.");
      EditAccountPage();
      return;
    }
    switch (command) {
      case 1:
        {
          changeName();
        }
        break;
      case 2:
        {
          changeEmail();
        }
        break;
      case 3:
        {
          changePhone();
        }
        break;
      case 4:
        {
          changePassword();
        }
        break;
    }
  }

  void changePhone() {
    io.console("Please enter your phone");
    String newPhone = io.text;
    try {
      currentUser!.phone = newPhone;
    } on Exception catch (e) {
      print(e);
      changePhone();
      return;
    }
    io.console("If you want to return to HomePage please enter 2: ");
    int command = io.number;
    command == 2 ? HomePage() : EditAccountPage();
  }

  void changePassword() {
    passwordManager.changePassWord(build);
    print("Your password succesfully changed.");
    print(currentUser);
    io.console("If you want to return to HomePage please enter 2: ");
    int command = io.number;
    command == 2 ? HomePage() : EditAccountPage();
  }

  void changeEmail() {
    io.console("Please enter your new email");
    String newEmail = io.text;
    try {
      currentUser!.email = newEmail;
    } on Exception catch (e) {
      print(e);
      changeEmail();
      return;
    }
    io.console("If you want to return to HomePage please enter 2: ");
    int command = io.number;
    command == 2 ? HomePage() : EditAccountPage();
  }

  void changeName() {
    io.console("Please enter your new Name");
    String newUserName = io.text;
    try {
      if (newUserName.trim() == "") {
        throw Exception("username cannot be an empty string");
      }
      currentUser!.fullname = newUserName;
    } on Exception catch (e) {
      print(e);
      changeName();
      return;
    }
    io.console("If you want to return to HomePage please enter 2: ");
    int command = io.number;
    command == 2 ? HomePage() : EditAccountPage();
  }
}
