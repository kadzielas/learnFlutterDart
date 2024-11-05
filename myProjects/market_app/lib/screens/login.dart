import 'package:auth0/auth0.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.auth0});
  final Auth0? auth0;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserProfile? _user;
  late Auth0 auth0;
  late Auth0Web auth0web;
  final Auth0Client client = Auth0Client(
      clientId: dotenv.env['AUTH0_CLIENT_ID']!,
      domain: dotenv.env['AUTH0_DOMAIN']!,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
      useLoggerInterceptor: true,
      accessToken: "abcdefg");

  @override
  void initState() {
    super.initState();
    auth0 = widget.auth0 ??
        Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    auth0web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    if (kIsWeb) {
      auth0web.onLoad().then((final credentials) => setState(() {
            _user = credentials?.user;
          }));
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }

      var credentials = await auth0
          .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
          // Use a Universal Link callback URL on iOS 17.4+ / macOS 14.4+
          // useHTTPS is ignored on Android
          .login(useHTTPS: true);

      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0web.logout();
      } else {
        await auth0
            .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
            // Use a Universal Link logout URL on iOS 17.4+ / macOS 14.4+
            // useHTTPS is ignored on Android
            .logout(useHTTPS: true);
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auth0 Flutter Example')),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: login,
                child: Text('Log in'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Access Token: $_user'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: logout,
                    child: Text('Log out'),
                  ),
                ],
              ),
      ),
    );
  }
}
