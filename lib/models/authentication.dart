import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:homestay/models/http_execption.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password, String? authData) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDfYfbAT_RcwcJxW3hvXj8Rnd9gCUi05ok';

    try {
      final response = await http.post(
          Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDfYfbAT_RcwcJxW3hvXj8Rnd9gCUi05ok'),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> logIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDfYfbAT_RcwcJxW3hvXj8Rnd9gCUi05ok';

    try {
      final response = await http.post(
          Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDfYfbAT_RcwcJxW3hvXj8Rnd9gCUi05ok'),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
