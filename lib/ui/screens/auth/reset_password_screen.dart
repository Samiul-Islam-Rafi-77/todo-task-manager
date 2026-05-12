import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEControllar = TextEditingController();
  final TextEditingController _confirmPasswordTEControllar =
      TextEditingController();

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
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Minimum length password 8 character with Latter and Number combination",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordTEControllar,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordTEControllar,
                  decoration: InputDecoration(hintText: 'Confarm Password'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _ontabConfirmButtom,
                  child: Text("confirm"),
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false,
    );
  }

  // confirm button
  void _ontabConfirmButtom() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTEControllar.dispose();
    _confirmPasswordTEControllar.dispose();
    super.dispose();
  }
}
