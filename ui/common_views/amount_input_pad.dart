import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AmountInputPad extends StatelessWidget {
  final ValueSetter<String> onNumberTap;
  final VoidCallback onBackspaceTap;

  AmountInputPad({Key? key,required this.onNumberTap,required this.onBackspaceTap}) : super(key: key);

  final List<String> listButtons = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: MediaQuery(
        data: context.mediaQuery.copyWith(textScaleFactor: 1),
        child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
            style: ElevatedButtonTheme.of(context).style?.copyWith(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return AppColor.primary;
                    }
                    return AppColor.greyMedium;
                  }),
                ),
          ),
          child: GridView(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            children: listButtons
                .map<Widget>(
                  (element) => CommonButton(
                    onPressed: () => onNumberTap(element),
                    child: Center(child: CommonText.bold(element, size: 24, color: AppColor.textPrimary)),
                  ),
                )
                .toList()
              ..add(CommonButton(
                onPressed: onBackspaceTap,
                child: const Center(child: SquareSvgImageFromAsset(AppImage.backspace)),
              )),
          ),
        ),
      ),
    );
  }
}
