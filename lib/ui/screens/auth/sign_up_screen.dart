import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEControllar = TextEditingController();
  final TextEditingController _passwordTEControllar = TextEditingController();
  final TextEditingController _firstNameTEControllar = TextEditingController();
  final TextEditingController _lastNameTEControllar = TextEditingController();
  final TextEditingController _mobileTEControllar = TextEditingController();

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
                const SizedBox(height: 60),
                // Nav text
                Text(
                  'Join with us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                //Email field
                TextFormField(
                  controller: _emailTEControllar,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 8),
                //Firstname field
                TextFormField(
                  controller: _firstNameTEControllar,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                const SizedBox(height: 8),
                // last name field
                TextFormField(
                  controller: _lastNameTEControllar,
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                const SizedBox(height: 8),
                //mobile field
                TextFormField(
                  controller: _mobileTEControllar,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                const SizedBox(height: 8),
                //password field
                TextFormField(
                  controller: _passwordTEControllar,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_right_outlined, size: 24),
                ),
                const SizedBox(height: 36),
                _buildBackToSignInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackToSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
          text: 'Have account?',
          children: [
            TextSpan(
              text: ' Sign in',
              style: const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _onTabSignInButton();
                },
            ),
          ],
        ),
      ),
    );
  }

  void _onTabSignInButton() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEControllar.dispose();
    _firstNameTEControllar.dispose();
    _lastNameTEControllar.dispose();
    _mobileTEControllar.dispose();
    _passwordTEControllar.dispose();

    super.dispose();
  }
}
