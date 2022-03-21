import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/transaction_item_view.dart';
import 'package:pessa_flow/ui/main/main_view.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/widgets/load_more_list.dart';
import 'package:pessa_flow/widgets/src/shimmer_item.dart';
import 'package:pessa_flow/widgets/widgets.dart';

part 'cards_cubit.dart';

part 'cards_service.dart';

part 'cards_state.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit, CardsState>(
      buildWhen: (previous, current) =>
          previous.listTransaction != current.listTransaction,
      builder: (context, state) {
        return ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.listTransaction.length,
              separatorBuilder: (context, pos) => Container(),
              itemBuilder: (context, pos) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                color: AppColor.transparent,
                child: AspectRatio(
                  aspectRatio: 5 / 3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                          pos % 2 == 0 && state.listTransaction[pos].CardType != 3
                              ? AppImage.bgCardBlue
                              : AppImage.bgCardBlack,
                          fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                OutlinedButton.icon(
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () =>
                                        BlocProvider.of<CardsCubit>(context)
                                            .onEditTap(pos),
                                    label: const CommonText.semiBold(
                                      "Edit",
                                      size: 16,
                                      color: AppColor.primary,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColor.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)))),
                              ],
                            ),
                            const Spacer(),
                            const SizeBoxH(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: CommonText.bold(
                                        getFormattedCardNumber(state
                                            .listTransaction[pos].CardNumber),
                                        color: AppColor.white,
                                        textAlign: TextAlign.start,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizeBoxV(24),
                                SquareImageFromAsset(
                                  BlocProvider.of<CardsCubit>(context).getCardImage(state
                                      .listTransaction[pos].CardType),
                                  size: 60,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: CommonButton(
                onPressed: BlocProvider.of<CardsCubit>(context).onAddCardTap,
                label: "+ " + S.of(context).addNewCard,
                bgColor: AppColor.greyCard,
              ),
            ),
          ],
        );
      },
    );
  }
}
