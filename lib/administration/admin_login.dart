import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool _showPassword = true;
  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('ログインページ'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    hintText: 'Email',
                  ),
                  controller: emailTextController,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    suffixIcon: IconButton(
                      icon: _showPassword
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    hintText: 'Password',
                  ),
                  obscureText: _showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordTextController,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  child: Text(
                    "メールアドレスでログインする",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.redAccent,
                  shape: StadiumBorder(),
                  onPressed: () {
                    _signInEmail(AuthType.signIn);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  "メールアドレスで新規登録する",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                shape: StadiumBorder(),
                onPressed: () {
                  _signInEmail(AuthType.signUp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signInEmail(AuthType type) async {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    AuthResult result;
    try {
      if (type == AuthType.signIn) {
        // 成功したらresultにユーザー情報が入る
        result = await _signIn(email, password);
      } else if (type == AuthType.signUp) {
        // 成功したらresultにユーザー情報が入る
        result = await _signUp(email, password);
      }
      // 成功したら画面遷移する
      Navigator.of(context).pushNamed('/adminHome');
//      Navigator.pushNamed(context, 'routeName');
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<AuthResult> _signIn(String email, String password) async {
    return _fireBaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<AuthResult> _signUp(String email, String password) async {
    return _fireBaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}

enum AuthType {
  signIn,
  signUp,
}
