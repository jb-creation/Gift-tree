import 'dart:async';

import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart' as model;
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_cubit.dart';

part 'notification_state.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarGrey(title: S.of(context).notifications , onBackTap: () => Navigator.of(context).pop(),),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.listNotification.length,
            itemBuilder: (context, index) => NotificationItemView(state.listNotification[index]),
          );
        },
      ),
    );
  }
}

class NotificationItemView extends StatelessWidget {
  final model.Notification _notification;

  const NotificationItemView(this._notification, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              switch (_notification.type) {
                case 1:
                  return RoundedSquareCachedImage(
                    imageUrl: _notification.to!.image,
                    size: 52,
                    radius: 12,
                  );
                case 2:
                  return RoundedSquareCachedImage(
                    imageUrl: _notification.from!.image,
                    size: 52,
                    radius: 12,
                  );
                case 3:
                  return const Card(
                    color: AppColor.primary,
                    child: SizedBox.square(
                      dimension: 52,
                      child: Center(child: SquareSvgImageFromAsset(AppImage.withdraw)),
                    ),
                  );
                case 4:
                  return const Card(
                    color: AppColor.primary,
                    child: SizedBox.square(
                      dimension: 52,
                      child: Center(child: SquareSvgImageFromAsset(AppImage.creditCard, color: AppColor.white)),
                    ),
                  );
                default:
                  return const Card(
                    color: AppColor.primary,
                    child: SizedBox.square(
                      dimension: 52,
                      child: Center(child: SquareSvgImageFromAsset(AppImage.money)),
                    ),
                  );
              }
            },
          ),
          const SizeBoxV(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText.medium(_notification.title, size: 16, color: AppColor.primary,),
                const SizeBoxH(),
                CommonText.medium(_notification.detail, size: 13, color: AppColor.textPrimaryLight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
