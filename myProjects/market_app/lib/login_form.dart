import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  final Auth0? auth0;
  const LoginForm({this.auth0, final Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<LoginForm> {
  UserProfile? _user;
  Credentials? _credentials;
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
  }

  Future<void> login() async {
    print('tried to login xd');

    final credentials = await auth0.webAuthentication().login();
    Fluttertoast.showToast(msg: "Show");

    setState(() {
      _credentials = credentials;
    });
  }

  Future<void> logout() async {
    try {
      await auth0.webAuthentication().logout();

      setState(() {
        _credentials = null;
      });
    } on WebAuthenticationException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ElevatedButton(onPressed: login, child: Text('Login'))));
  }
}
