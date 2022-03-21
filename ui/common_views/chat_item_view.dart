import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatItemView extends StatelessWidget {
  final ChatData _chat;

  const ChatItemView(this._chat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.chatScreen, arguments: {"chatData": _chat.toJson()});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Builder(
              builder: (context) {
                return Stack(
                  children: [
                    RoundedSquareCachedImage(
                      imageUrl: _chat.image,
                      size: 52,
                      radius: 12,
                    ),
                    Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary,
                            border: Border.all(color: AppColor.white, width: 1.0, style: BorderStyle.solid),
                          ),
                        ))
                  ],
                );
              },
            ),
            const SizeBoxV(12),
            Expanded(
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText.medium(_chat.name, size: 16),
                      const SizeBoxH(),
                      CommonText.light(_chat.message, size: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
