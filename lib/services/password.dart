
import '../database/users.dart';
import 'io_service.dart';

var passwordManager = Password();

class Password {
  String get currentPassword => "*" * currentUser!.password.length;

  String confirmPassWord(Function errorCase) {
    io.console("Password: ");
    String password = io.text;

    io.console("Confirm password: ");
    String confirmPassword = io.text;
    if (password != confirmPassword) {
      errorCase();
      return "";
    }
    return password;
  }

  void changePassWord(Function errorCase) {
    io.console("Old Password: ");
    String password = io.text;

    if (password != currentUser!.password) {
      print("Incorrect password");
      changePassWord(errorCase);
      return;
    }
    io.console("New Password: ");
    password = io.text;
    io.console("Confirm password: ");
    String confirmPassword = io.text;
    if (password != confirmPassword) {
      errorCase();
      return;
    }
    currentUser!.password = password;
  }
}
