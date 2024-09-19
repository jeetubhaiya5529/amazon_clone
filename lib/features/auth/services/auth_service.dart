import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign up user
  void signupUser({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      User user = User(
          id: '',
          username: username,
          email: email,
          password: password,
          address: '',
          token: '');

      http.Response res = await http
          .post(Uri.parse("$uri/api/signup"), body: user.toJson(), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(res.statusCode);
    } catch (e) {}
  }
}
