import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/auth/reset_password_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class PinVarificationScreen extends StatefulWidget {
  const PinVarificationScreen({super.key});

  @override
  State<PinVarificationScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<PinVarificationScreen> {
  final PinInputController _pinTEControllar = PinInputController();

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
                  'PIN varification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 digit verification pin has been send to your email address",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),

                Center(
                  child: MaterialPinField(
                    pinController: _pinTEControllar,
                    length: 6,
                    onCompleted: (pin) => print('PIN: $pin'),
                    onChanged: (value) => print('Changed: $value'),
                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.outlined,
                      cellSize: Size(45, 55),
                      borderRadius: BorderRadius.circular(12),
                      fillColor: Colors.white,
                      borderColor: Colors.transparent,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapVarifyOtpButton,
                  child: Text("Verify"),
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

  // On Tap sign up button
  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false,
    );
  }

  //OTP varify button
  void _onTapVarifyOtpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pinTEControllar.dispose();

    super.dispose();
  }
}
