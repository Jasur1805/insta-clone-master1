

import '../database/users.dart';
import '../models/user.dart';
import '../services/io_service.dart';
import 'home_page.dart';
import 'state_widget.dart';

class SignInPage extends StateWidget {
  @override
  void build() {
    io.console("Sign In\n");

    io.console("Email: ");
    String email = io.text;

    io.console("Password: ");
    String password = io.text;

    try {
      for (User client in users) {
        if (client.password == password && client.email == email) {
          currentUser = client;
          break;
        }
      }

      if (currentUser == null) {
        print("Please check your password or email!");
        build();
        return;
      }

      print("\n\n\n\n");
      HomePage();
    } catch (e) {
      print(e);
      print("\n");
      build();
    }
  }
}
