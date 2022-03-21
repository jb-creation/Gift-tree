import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pessa_flow/extensions/extension.dart';

class RegistrationHeaderView extends StatelessWidget {
  final String title;
  final String subTitle;

  const RegistrationHeaderView({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeBoxH(32 + context.topPadding),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.0,0.0,12.0,0.0),
                  child: CircleImageFromAsset(AppImage.back, size: 48,),
                ),
              ),
            ),
            CommonText.bold(title, size: 28,
                color: AppColor.primary,
                textAlign: TextAlign.center,
                fontFamily: kFontFamily),
            const SizeBoxH(8),
            CommonText.medium(
              subTitle,
              size: 16,
              color: AppColor.primary,
              textAlign: TextAlign.center,
            ),
            const SizeBoxH(56),
          ],
        )
      ],
    );
  }
}
