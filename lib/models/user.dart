import '../services/password.dart';
import '../database/posts.dart';
import 'gender.dart';
import 'post.dart';

enum SortType { name, phone, email, age }

// TODO: update
class User implements Comparable<User> {
  int id;
  String fullname;
  String _phone;
  String _email;
  Gender gender;
  String password;
  List<Post> _posts = [post1];
  int _age;
  List<User> followersList = [];

  static int _userCount = 0;
  static SortType sortType = SortType.name;
  

  User._(this.id, this.fullname, this._phone, this._email, this.gender,
      this._age, this.password);

  factory User(String fullname, String phone, String email, Gender gender,
      int age, String password) {
    if (fullname.isEmpty) {
      throw Exception("Please fullname can't be empty!");
    }

    if (!RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      throw Exception("Please enter given form: +998#########");
    }

    if (!RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      throw Exception("Please enter valid email");
    }

    if (0 > age || age > 200) {
      throw Exception("Please enter valid age");
    }

    return User._(++_userCount, fullname, phone, email, gender, age, password);
  }

  String get phone => _phone;
  set phone(String phone) {
    if (RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      _phone = phone;
    } else {
      throw Exception("Please enter given form: +998#########");
    }
  }

  String get email => _email;
  set email(String email) {
    if (RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      _email = email;
    } else {
      throw Exception("Please enter valid email adress");
    }
  }

  int get age => _age;
  List<Post> get posts => _posts;
  set age(int age) {
    if (0 <= age && age <= 200) {
      _age = age;
    }
  }

  @override
  int compareTo(User user) {
    switch (sortType) {
      case SortType.name:
        int name = fullname.compareTo(user.fullname);
        return name;
      case SortType.phone:
        int phoneNumber = phone.compareTo(user.phone);
        return phoneNumber;
      case SortType.email:
        int emailAddress = email.compareTo(user.email);
        return emailAddress;
      case SortType.age:
        int ageComp = age.compareTo(user.age);
        return ageComp;
    }
  }

  @override
  noSuchMethod(Invocation invocation) {
    return "Please write correct method!";
  }

  @override
  int get hashCode => Object.hash(id, fullname, gender);

  @override
  bool operator ==(Object other) {
    return other is User &&
        id == other.id &&
        fullname == other.fullname &&
        gender == other.gender;
  }

  @override
  String toString() {
    return "\nname: $fullname \nemail: $email \ngender: ${gender.name} \nage: $age \nphone: $phone\nPassword: ${passwordManager.currentPassword}";
  }

  User copyWith(
      [String? name, String? email, String? phone, String? password]) {
    return User(name ?? fullname, phone ?? _phone, email ?? _email, gender, age,
        password ?? this.password);
  }

  void writePost(Post post) {
    _posts.add(post);
  }

  bool removePost(Post post) {
    return _posts.remove(post);
  }

  void addFollower(User user) {
    followersList.add(user);
  }

  bool unFollow(User user) {
    return followersList.remove(user);
  }
}
