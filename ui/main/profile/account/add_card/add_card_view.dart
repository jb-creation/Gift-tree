import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/constants/unicode_values.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/utils/input_formatters.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/common_dialog.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'add_card_cubit.dart';

part 'add_card_state.dart';

part 'add_card_service.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({Key? key}) : super(key: key);

  @override
  _AddCardViewState createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  @override
  Widget build(BuildContext context) {
    final initialState = BlocProvider.of<AddCardCubit>(context).state;
    return Scaffold(
      appBar: CommonAppBarBlack(
        title: BlocProvider.of<AddCardCubit>(context).title,
        leadingIcon: AppImage.close,
        onBackTap: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Form(
                key: initialState.formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(24),
                  children: [
                    CommonTextField(
                      controller: initialState.numberController,
                      labelText: S.of(context).cardNumber,
                      hintText: S.of(context).enterCardNumber,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.number,
                      textColor: AppColor.primary,
                      cursorColor: AppColor.primary,
                      focus: initialState.numberFocus,
                      validator: validateCardNumber,
                      inputFormatters: [CardNumberInputFormatter()],
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<AddCardCubit, AddCardState>(
                          buildWhen: (previous, current) =>
                              previous.isNumberFocused !=
                              current.isNumberFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.creditCard,
                              size: 20,
                              color: state.isNumberFocused
                                  ? AppColor.primaryDark
                                  : AppColor.grey,
                            );
                          },
                        ),
                      ),
                    ),
                    /*const SizeBoxH(16),
                    CommonTextField(
                      controller: initialState.nameController,
                      labelText: S.of(context).cardHolderName,
                      hintText: S.of(context).enterCardHolderName,
                      fillColor: AppColor.white,
                      textColor: AppColor.primary,
                      cursorColor: AppColor.primary,
                      keyboardType: TextInputType.name,
                      focus: initialState.nameFocus,
                      validator: validateCardHolderName,
                      inputFormatters: [UsernameInputFormatter()],
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<AddCardCubit, AddCardState>(
                          buildWhen: (previous, current) =>
                              previous.isNameFocused != current.isNameFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.name,
                              size: 20,
                              color: state.isNameFocused
                                  ? AppColor.primaryDark
                                  : AppColor.grey,
                            );
                          },
                        ),
                      ),
                    ),*/
                    const SizeBoxH(16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CommonTextField(
                            controller: initialState.expiryDateController,
                            labelText: S.of(context).expirationDate,
                            hintText: "12/2022",
                            keyboardType: TextInputType.number,
                            focus: initialState.expiryDateFocus,
                            textColor: AppColor.primary,
                            cursorColor: AppColor.primary,
                            fillColor: AppColor.white,
                            validator: validateCardMonth,
                            inputFormatters: [CardMonthInputFormatter()],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(16),
                              child: BlocBuilder<AddCardCubit, AddCardState>(
                                buildWhen: (previous, current) =>
                                    previous.isExpiryDateFocused !=
                                    current.isExpiryDateFocused,
                                builder: (context, state) {
                                  return SquareSvgImageFromAsset(
                                    AppImage.date,
                                    size: 20,
                                    color: state.isExpiryDateFocused
                                        ? AppColor.primaryDark
                                        : AppColor.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizeBoxV(12),
                        Expanded(
                          child: CommonTextField(
                            controller: initialState.cvvController,
                            labelText: S.of(context).cvv,
                            hintText: S.of(context).enterCvv,
                            textColor: AppColor.primary,
                            cursorColor: AppColor.primary,
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                            validator: validateCvv,
                            inputFormatters: [NumberInputFormatter(length: 4)],
                          ),
                        ),
                      ],
                    ),
                    const SizeBoxH(16),
                    CommonTextField(
                      controller: initialState.streetAddressController,
                      labelText: S.of(context).streetAddress,
                      hintText: S.of(context).enterStreetAddress,
                      fillColor: AppColor.white,
                      textColor: AppColor.primary,
                      cursorColor: AppColor.primary,
                      keyboardType: TextInputType.streetAddress,
                      focus: initialState.streetAddressFocus,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<AddCardCubit, AddCardState>(
                          buildWhen: (previous, current) =>
                              previous.isStreetFocused !=
                              current.isStreetFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.address,
                              size: 20,
                              color: state.isStreetFocused
                                  ? AppColor.primaryDark
                                  : AppColor.grey,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizeBoxH(16),
                    BlocBuilder<AddCardCubit, AddCardState>(
                      buildWhen: (previous, current) =>
                          previous.selectedState != current.selectedState,
                      builder: (context, state) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CommonDropDownField<String>(
                                isExpanded: true,
                                // to avoid overflow
                                labelText: "State",
                                items: state.listState
                                    .map(
                                        (e) => DropDownItem(label: e, value: e))
                                    .toList(),
                                value: state.selectedState,
                                onChanged: (name) =>
                                    BlocProvider.of<AddCardCubit>(context)
                                        .onChangeState(name!),
                              ),
                            ),
                            const SizeBoxV(12),
                            Expanded(
                              child: CommonDropDownField<String>(
                                isExpanded: true,
                                // to avoid overflow
                                labelText: "City",
                                items: state.listCity
                                    .map(
                                        (e) => DropDownItem(label: e, value: e))
                                    .toList(),
                                value: state.selectedCity,
                                onChanged: (name) =>
                                    BlocProvider.of<AddCardCubit>(context)
                                        .onChangeCity(name!),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizeBoxH(16),
                    CommonTextField(
                      controller: initialState.zipCodeController,
                      labelText: S.of(context).zipCode,
                      hintText: S.of(context).enterZipCode,
                      textColor: AppColor.primary,
                      cursorColor: AppColor.primary,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.streetAddress,
                      focus: initialState.zipFocus,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<AddCardCubit, AddCardState>(
                          buildWhen: (previous, current) =>
                              previous.isZipFocused != current.isZipFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.address,
                              size: 20,
                              color: state.isZipFocused
                                  ? AppColor.primaryDark
                                  : AppColor.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.white,
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16 + context.bottomInset),
            child: CommonButton(
              bgColor: AppColor.commonButton,
              onPressed: BlocProvider.of<AddCardCubit>(context).onAddCardTap,
              label: S.of(context).continue_,
            ),
          ),
        ),
      ),
    );
  }
}
