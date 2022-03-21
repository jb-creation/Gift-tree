import 'dart:async';
import 'dart:math';

import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/constants/unicode_values.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/transaction_item_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import '../main_view.dart';

part 'home_cubit.dart';

part 'home_state.dart';

part 'home_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<HomeCubit>(context).state;
    return Container(
      color: const Color(0xFFF9FCFF),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        controller: BlocProvider.of<MainCubit>(context).state.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Color(0xFFF9FCFF)),
                  height: 72,
                  padding: const EdgeInsets.fromLTRB(20, 8, 4, 8),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const SizeBoxV(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonText.bold(
                                    S.of(context).hello,
                                    size: 18,
                                    color: AppColor.primary,
                                  ),
                                  BlocBuilder<MainCubit, MainState>(
                                    buildWhen: (previous, current) =>
                                        previous.hasNotification !=
                                        current.hasNotification,
                                    builder: (context, state) =>
                                        CommonText.semiBold(
                                            state.user.FirstName,
                                            size: 14,
                                            color: AppColor.textPrimaryLight),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) =>
                            previous.selected?.key != current.selected?.key,
                        builder: (context, state) {
                          print(
                              "MAPPP ${countryFlags.entries.toList().map((e) => e).toList()}  ${state.selected}");
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: false,
                              underline: Container(),
                              icon: const Icon(
                                Icons.space_dashboard,
                                size: 0,
                              ),
                              // to avoid overflow
                              items: countryFlags.entries
                                  .toList()
                                  .map((e) => DropdownMenuItem<String>(
                                      value: e.key,
                                      child: Row(
                                        children: [
                                          CommonText.semiBold(
                                            countryNames.entries
                                                .firstWhere((element) =>
                                                    element.key == e.key)
                                                .value,
                                            size: 20,
                                            color: AppColor.black,
                                          ),
                                          const SizeBoxV(8),
                                          SquareImageFromAsset(
                                            e.value,
                                            size: 20,
                                          )
                                        ],
                                      )))
                                  .toList(),
                              value: state.selected?.key ?? "",
                              onChanged: (label) =>
                                  BlocProvider.of<HomeCubit>(context)
                                      .onFlagChange(label!),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 380,
                  margin: const EdgeInsets.all(12.0),
                  child: Material(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(24.0),
                    elevation: 4,
                    shadowColor: AppColor.greyLight.withOpacity(0.3),
                    child: Column(
                      children: [
                        const SizeBoxH(8),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          alignment: AlignmentDirectional.centerStart,
                          child: CommonText.semiBold(
                            S.of(context).sendMoney,
                            size: 20,
                            color: AppColor.black,
                          ),
                        ),
                        BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.contact != current.contact ||
                              previous.selected?.key != current.selected?.key,
                          builder: (context, state) {
                            return InkWell(
                              onTap: BlocProvider.of<HomeCubit>(context)
                                  .onRecipientTap,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 0),
                                child: state.contact == null
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: AppColor.greyLight,
                                              width: 1),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 20, 8),
                                                child: CommonText.medium(
                                                    S.of(context).recipientName,
                                                    size: 14,
                                                    color: AppColor.primary),
                                              ),
                                            ),
                                            SquareImageFromAsset(
                                              BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .rateFlag(),
                                              size: 20,
                                            )
                                          ],
                                        ))
                                    : Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: AppColor.greyLight,
                                              width: 1),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonText.semiBold(
                                                      state.contact!.name,
                                                      size: 14,
                                                      color: AppColor.primary),
                                                  CommonText.semiBold(
                                                      state.contact!.number,
                                                      size: 14,
                                                      color: AppColor.primary)
                                                ],
                                              ),
                                            ),
                                            SquareImageFromAsset(
                                              BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .rateFlag(),
                                              size: 20,
                                            )
                                          ],
                                        )),
                              ),
                            );
                          },
                        ),
                        const SizeBoxH(4),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: AppColor.greyLight, width: 1),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 8, 20, 0),
                                      child: CommonTextFieldEmpty(
                                        controller: initialState.sendController,
                                        labelText: S.of(context).send,
                                        hintText: "\$0.00",
                                        keyboardType: TextInputType.number,
                                        focus: initialState.sendFocus,
                                        onChanged: (value) =>
                                            BlocProvider.of<HomeCubit>(context)
                                                .onSendChange(value),
                                        inputAction: TextInputAction.done,
                                        fillColor: AppColor.white,
                                        cursorColor: AppColor.primary,
                                        textColor: AppColor.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(8, 8, 20, 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: AppColor.greyLight, width: 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BlocBuilder<HomeCubit, HomeState>(
                                          buildWhen: (previous, current) =>
                                              previous.contact !=
                                                  current.contact ||
                                              previous.listRates !=
                                                  current.listRates ||
                                              previous.amount != current.amount,
                                          builder: (context, state) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 20, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CommonText.bold(
                                                      S.of(context).receive,
                                                      size: 14,
                                                      color: AppColor.primary),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 16, 0, 16),
                                                    child: CommonText.medium(
                                                        BlocProvider.of<
                                                                    HomeCubit>(
                                                                context)
                                                            .rateReceive(),
                                                        size: 14,
                                                        color:
                                                            AppColor.primary),
                                                  )
                                                ],
                                              ),
                                            );
                                          })
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        const SizeBoxH(4),
                        BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.contact != current.contact ||
                              previous.listRates != current.listRates,
                          builder: (context, state) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              alignment: AlignmentDirectional.centerStart,
                              child: CommonText.medium(
                                BlocProvider.of<HomeCubit>(context).rate(),
                                size: 14,
                                color: AppColor.textPrimaryMedium,
                              ),
                            );
                          },
                        ),
                        const SizeBoxH(4),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: CommonButton(
                            onPressed:
                                BlocProvider.of<HomeCubit>(context).onSendTap,
                            label: S.of(context).send,
                            bgColor: AppColor.commonButton,
                          ),
                        ),
                        const SizeBoxH(8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Material(
            color: AppColor.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            elevation: 4,
            child: Column(children: [
              const SizeBoxH(8),
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                    color: AppColor.greyLight,
                    borderRadius: BorderRadius.circular(2)),
              ),
              const SizeBoxH(8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      alignment: AlignmentDirectional.centerStart,
                      child: CommonText.bold(
                        S.of(context).recentTransactions,
                        size: 18,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        BlocProvider.of<MainCubit>(context).changeIndex(1),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      alignment: AlignmentDirectional.centerStart,
                      child: CommonText.bold(
                        S.of(context).seeAll,
                        size: 14,
                        color: AppColor.commonButton,
                      ),
                    ),
                  ),
                ],
              ),
              const SizeBoxH(16),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.listTransaction != current.listTransaction,
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.listTransaction.length > 5
                        ? 5
                        : state.listTransaction.length,
                    separatorBuilder: (context, index) =>
                        const Divider(indent: 84),
                    itemBuilder: (context, index) =>
                        TransactionItemView(state.listTransaction[index]),
                  );
                },
              ),
            ]),
          ))
        ],
      ),
    );
  }
}
