import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/utility/app_constants.dart';
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
  //from key
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _fromkey,
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

                    // Email validation
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (AppConstants.emailRegExp.hasMatch(value!) == false) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  //Firstname field
                  TextFormField(
                    controller: _firstNameTEControllar,
                    decoration: InputDecoration(hintText: 'First Name'),

                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  // last name field
                  TextFormField(
                    controller: _lastNameTEControllar,
                    decoration: InputDecoration(hintText: 'Last Name'),

                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  //mobile field
                  TextFormField(
                    controller: _mobileTEControllar,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your phone Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  //password field
                  TextFormField(
                    obscureText: _showPassword == false,
                    controller: _passwordTEControllar,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _showPassword = !_showPassword;
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        icon: Icon(
                          _showPassword
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your valid password';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_fromkey.currentState!.validate()) {
                        // Todo : call registraton api
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 24),
                  ),
                  const SizedBox(height: 36),
                  _buildBackToSignInSection(),
                ],
              ),
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
    Navigator.pop(context);
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
