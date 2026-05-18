import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/email_verifiaction_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screens/main_buttom_nav_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEControllar = TextEditingController();
  final TextEditingController _passwordTEControllar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEControllar,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEControllar,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                //nex page buttom
                ElevatedButton(
                  onPressed: _onTapNextButtom,
                  child: Icon(Icons.arrow_circle_right_outlined, size: 24),
                ),
                const SizedBox(height: 36),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: _onTapForgotPasswordButton,
                        child: Text('Forgot Password?'),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: "Don't have an account?",
                          children: [
                            TextSpan(
                              text: 'SIgn up',
                              style: TextStyle(color: AppColors.themeColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _onTapSignupButton();
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // On Tap sign up button
  void _onTapSignupButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  // on Tap signin confarm
  void _onTapNextButtom() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainButtomNavScreen()),
    );
  }

  //On Tap Forgot Password
  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmailVerifiactionScreen()),
    );
  }

  @override
  void dispose() {
    _emailTEControllar.dispose();
    _passwordTEControllar.dispose();
    super.dispose();
  }
}
