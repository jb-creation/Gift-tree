import 'dart:async';

import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/transaction_item_view.dart';
import 'package:pessa_flow/ui/main/main_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_pass_cubit.dart';

part 'change_pass_state.dart';

class ChangePassView extends StatefulWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  _ChangePassViewState createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<ChangePassCubit>(context).state;
    return Scaffold(
      appBar: CommonAppBarBlack(
        title: S.of(context).changePass,
        onBackTap: () => Navigator.of(context).pop(),
      ),
      body: Form(
        key: initialState.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: CommonTextField(
                controller: initialState.currentController,
                labelText: S.of(context).currentPass,
                hintText: S.of(context).enterCurrentPass,
                validator: validatePassword,
                keyboardType: TextInputType.visiblePassword,
                focus: initialState.currentFocus,
                fillColor: AppColor.white,
                textColor: AppColor.primary,
                cursorColor: AppColor.primary,
                borderColor: AppColor.greyLight,
              ),
            ),
            const SizeBoxH(8),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: CommonTextField(
                controller: initialState.newController,
                labelText: S.of(context).newPass,
                hintText: S.of(context).enterNewPass,
                keyboardType: TextInputType.visiblePassword,
                validator: validatePassword,
                focus: initialState.newFocus,
                fillColor: AppColor.white,
                textColor: AppColor.primary,
                cursorColor: AppColor.primary,
                borderColor: AppColor.greyLight,
              ),
            ),
            const SizeBoxH(8),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: CommonTextField(
                controller: initialState.confirmController,
                labelText: S.of(context).confirmPassword,
                hintText: S.of(context).enterConfirmPassword,
                validator: (value) => validateConfirmPassword(value, initialState.newController.text),
                keyboardType: TextInputType.visiblePassword,
                focus: initialState.confirmFocus,
                fillColor: AppColor.white,
                textColor: AppColor.primary,
                cursorColor: AppColor.primary,
                borderColor: AppColor.greyLight,
              ),
            ),
            const SizeBoxH(8),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: CommonButton(
                onPressed: BlocProvider.of<ChangePassCubit>(context).onSubmitTap,
                label: S.of(context).send,
                bgColor: AppColor.commonButton,
              ),
            ),
            const SizeBoxH(8),
          ],
        ),
      ),
    );
  }
}
