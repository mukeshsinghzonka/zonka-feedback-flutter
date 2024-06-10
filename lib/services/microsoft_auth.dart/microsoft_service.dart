import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class MicroSoftService {
  

  static final Config config = Config(
    tenant: "consumers",
    clientId: "6a5b28f0-8b5f-4043-a12e-67fae2b7e0ed",
    scope: "openid profile offline_access",
    isB2C: false,
  
    // // redirectUri is Optional as a default is calculated based on app type/web location
    redirectUri: "msauth://com.zonka.feedback.zonka_feedback/2jmj7l5rSw0yVb%2FvlWAYkK%2FYBwk%3D",
    navigatorKey:  NavigationService.navigatorKey,
      loader: const Center(child: CircularProgressIndicator()),
    webUseRedirect:
        true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    // postLogoutRedirectUri: 'http://your_base_url/logout', //optional
  );

  final AadOAuth oauth = AadOAuth(config);

  Future<Token?> login() async {
    try {
      final result = await oauth.login();
      if (result.isRight()) {
        return result.getOrElse(() => Token());
      }
      return null;
    } catch (e) {
      throw NetworkExceptions.defaultError("Error in login : $e");
    }
  }

  Future<void> logout() async {
    try {
      await oauth.logout();
    } catch (e) {
      throw NetworkExceptions.defaultError("Error in logout : $e");
    }
  }

  Future<String?> getAccessToken() async {
    try {
      return await oauth.getAccessToken();
    } catch (e) {
      throw NetworkExceptions.defaultError("Error in getAccessToken: $e");
    }
  }
}
