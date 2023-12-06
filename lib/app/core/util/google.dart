import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> authenticate({bool selectAccount = true}) async {
    if (selectAccount && _googleSignIn.currentUser != null) {
      try {
        if (kIsWeb) {
          await _googleSignIn.signOut();
        }

        if (Platform.isAndroid) {
          await _googleSignIn.signOut();
        } else {
          await _googleSignIn.disconnect();
        }
      } catch (e) {
        await _googleSignIn.disconnect();
      }
    }
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      throw Exception('google 로그인이 취소됨');
    }
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;

    log(googleAuth.idToken!);

    return googleAuth.idToken!;
  }
}
