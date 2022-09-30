import 'package:fashion_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initeState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();

    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future<void> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);

    User? firebaseUser = authResult.user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        // insert the user to our collection
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoURL,
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString('username', firebaseUser.displayName!);
        await preferences.setString('photoUrl', firebaseUser.photoURL!);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString('username', documents[0]['username']);
        await preferences.setString('photoUrl', documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: 'Login was successful');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Login'),
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          Center(
            child: TextButton(
                onPressed: () => handleSignIn(),
                child: Text('Sign in / Sign up with Google')),
          ),
          Visibility(
              visible: loading ?? true,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ))
        ],
      ),
    );
  }
}
