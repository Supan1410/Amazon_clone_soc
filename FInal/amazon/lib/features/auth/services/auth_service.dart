// ignore_for_file: use_build_context_synchronously
import "dart:convert";
import "package:amazon/constants/utils.dart";
import "package:amazon/features/home/screens/home_screen.dart";
import "package:amazon/models/user.dart";
import "package:amazon/providers/user_provider.dart";
import "package:http/http.dart" as http;
import "package:amazon/constants/global_variables.dart";
import "package:amazon/constants/error_handling.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        name: name,
        password: password,
        address: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created successfully! Please login.');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          Provider.of<UserProvider>(
            context,
            listen: false,
          ).setUser(res.body);

          await prefs.setString(
            'x-auth-token',
            jsonDecode(res.body)['token'],
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );

          showSnackBar(context, 'Login successful!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
