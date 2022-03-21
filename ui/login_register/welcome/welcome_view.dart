import 'package:flutter/gestures.dart';
import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.splashGradient),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImage.bgSplash, fit: BoxFit.fill),
            const Center(
              child: SquareImageFromAsset(
                AppImage.logoSplash,
                size: 160,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Material(
          color: AppColor.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizeBoxH(24),
                  CommonText.medium(S.of(context).giftMadeEasy, size: 26, fontFamily: kFontFamily),
                  const SizeBoxH(24),
                  CommonButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoute.registerScreen),
                    label: S.of(context).createNewAccount,
                  ),
                  const SizeBoxH(18),
                  Row(
                    children: [
                      const Expanded(child: Divider(indent: 8, color: AppColor.white, endIndent: 8)),
                      CommonText.medium(S.of(context).or.toUpperCase(),size: 16),
                      const Expanded(child: Divider(endIndent: 8, color: AppColor.white, indent: 8)),
                    ],
                  ),
                  const SizeBoxH(18),
                  CommonButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoute.loginScreen),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text.rich(
                        TextSpan(
                          text: S.of(context).existingUsers + " ",
                          style: const TextStyle(color: AppColor.textPrimary,  fontSize: 18, fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: S.of(context).loginIn,
                              style: const TextStyle(color: AppColor.primary, fontSize: 18, fontWeight: FontWeight.w700 , decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(AppRoute.loginScreen);
                                },
                            ),
                            TextSpan(
                              text: S.of(context).here,
                              style: const TextStyle(color: AppColor.textPrimary, fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    bgColor: AppColor.white,
                  ),
                  const SizeBoxH(18),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0,18.0,32.0,18.0),
                    child: CommonText.light(S.of(context).accountTerms, size: 14, fontFamily: kFontFamily, textAlign: TextAlign.center,),
                  ),
                  const SizeBoxH(18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
