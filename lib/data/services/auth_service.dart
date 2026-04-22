import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user!.sendEmailVerification();
  }

  Future<String> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;

    if (!user.emailVerified) {
      await _auth.signOut();
      throw Exception("Email belum diverifikasi");
    }

    final token = _generateAccessToken(user);
    return token;
  }

  Future<User?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final result = await _auth.signInWithCredential(credential);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String _generateAccessToken(User user) {
    final header = {"alg": "HS256", "typ": "JWT"};

    final payload = {
      "sub": user.uid,
      "email": user.email,
      "iss": "evan-machine-store",
      "iat": DateTime.now().millisecondsSinceEpoch ~/ 1000,
      "exp":
          DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000,
    };

    final encodedHeader = base64UrlEncode(utf8.encode(jsonEncode(header)));
    final encodedPayload = base64UrlEncode(utf8.encode(jsonEncode(payload)));

    final data = "$encodedHeader.$encodedPayload";

    const secretKey = "secret_key";

    final hmac = Hmac(sha256, utf8.encode(secretKey));
    final digest = hmac.convert(utf8.encode(data));

    final signature = base64UrlEncode(digest.bytes);

    return "$data.$signature";
  }
}
