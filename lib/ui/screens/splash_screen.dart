import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/utility/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AssetPaths.backgroundSvg,
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(AssetPaths.appLogoSvg, width: 140),
          ],
        ),
      ),
    );
  }
}
