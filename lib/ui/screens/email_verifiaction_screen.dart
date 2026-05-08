import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/pin_varification_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class EmailVerifiactionScreen extends StatefulWidget {
  const EmailVerifiactionScreen({super.key});

  @override
  State<EmailVerifiactionScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<EmailVerifiactionScreen> {
  final TextEditingController _emailTEControllar = TextEditingController();

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
                  'Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 digit verification pin will send to your email address",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEControllar,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapConfirmButton,

                  child: Icon(Icons.arrow_circle_right_outlined, size: 24),
                ),
                const SizedBox(height: 36),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                      text: "Have an account?",
                      children: [
                        TextSpan(
                          text: 'SIgn in',
                          style: TextStyle(color: AppColors.themeColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _onTapSignInButton();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Oon Tap sign up button
  void _onTapSignInButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  void _onTapConfirmButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PinVarificationScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEControllar.dispose();

    super.dispose();
  }
}
