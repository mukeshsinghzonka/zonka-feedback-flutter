import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class MicroSoftService {
  static final GlobalKey<NavigatorState> navigatorKeyVal =
      GlobalKey<NavigatorState>();

  static final Config config = Config(
    tenant: "YOUR_TENANT_ID",
    clientId: "YOUR_CLIENT_ID",
    scope: "openid profile offline_access",
    // // redirectUri is Optional as a default is calculated based on app type/web location
    // redirectUri: "your redirect url available in azure portal",
    navigatorKey: navigatorKeyVal,
    webUseRedirect:
        true, // default is false - on web only, forces a redirect flow instead of popup auth
    //Optional parameter: Centered CircularProgressIndicator while rendering web page in WebView
    // postLogoutRedirectUri: 'http://your_base_url/logout', //optional
  );

  final AadOAuth oauth = AadOAuth(config);

  Future<bool> login() async {
    try {
      final result = await oauth.login();
      if (result.isRight()) {
        return true;
      }
      return false;
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
