import '../services/io_service.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'state_widget.dart';

class IntroPage extends StateWidget {
  @override
  void build() {
    print("Welcome to InstaClone");
    print("I. Sign In");
    print("II. Sign Up");
    String text = io.text;
    if (text == "I") {
      SignInPage();
    } else if (text == 'II') {
      SignUpPage();
    } else {
      build();
      return;
    }
  }
}
