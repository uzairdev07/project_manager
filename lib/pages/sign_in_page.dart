import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:khata_app/pages/my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static Future<bool> isUserAuthenticated() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (error) {
      print('Error checking user authentication: $error');
      return false;
    }
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;
  void _showPassword() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) return;
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', finalResult.user?.displayName ?? '');
      prefs.setString('userEmail', finalResult.user?.email ?? '');
      prefs.setString('userProfilePic', finalResult.user?.photoURL ?? '');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.diagramProject,
                size: 64.0,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Welcome to Project Management',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                'Keep your projects maintained',
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
              const Expanded(child: SizedBox()),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.alternate_email_outlined,
                          color: Colors.grey,
                        ),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: _showPassword,
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        labelText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print('');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Signin',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton.icon(
                onPressed: googleLogin,
                icon: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                ),
                label: const Text(
                  'Sign in with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
