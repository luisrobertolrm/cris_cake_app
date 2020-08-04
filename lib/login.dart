import 'package:cris_cake_app/common/AppScaffold.dart';
import 'package:cris_cake_app/common/userLoggedIn.dart';
import 'package:cris_cake_app/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  FirebaseUser user;

  Widget content;

  @override
  void initState() {
    try {
      this._auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  _LoginState() {
    this._auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        setState(() {
          if (user != null) UserLoggedIn.url = user.photoUrl;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Produtos(),
            ));
      }
    });

    this.content = Column(
      children: <Widget>[
        GestureDetector(
          onTap: _loginFacebook,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/facebook.jpeg',
                  height: 65,
                  width: 65,
                ),
                Text('Login com Facebook')
              ],
            ),
          ),
        ),
        Container(
          height: 15,
        ),
        GestureDetector(
          onTap: _signinGoogle,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/google.jpeg',
                  height: 60,
                  width: 60,
                ),
                Text('Login com Google')
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold('Login', this.content).build(context);
  }

  _signinGoogle() async {
    this.user = await _handleSignIn();
  }

  String _message = 'Log in/out by pressing the buttons below.';

  Future<FirebaseUser> _handleSignIn() async {
    FirebaseUser user;

    try {
      bool isSignedIn = await _googleSignIn.isSignedIn();

      var teste = this._auth.currentUser;

      if (isSignedIn) {
        // if so, return the current user
        user = await _auth.currentUser();
      } else {
        final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // get the credentials to (access / id token)
        // to sign in via Firebase Authentication
        final AuthCredential credential = GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        user = (await _auth.signInWithCredential(credential)).user;
      }
    } catch (error) {
      print(error);
    }

    return user;
  }

  Future<Null> _loginFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }
}
