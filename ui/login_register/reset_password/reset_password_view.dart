import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/registration_header_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_cubit.dart';

part 'reset_password_state.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<ResetPasswordCubit>(context).state;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: initialState.formKey,
          child: Column(
            children: [
              RegistrationHeaderView(
                title: S.of(context).resetPasswordTitle,
                subTitle: S.of(context).resetPasswordSubTitle,
              ),
              CommonTextField(
                controller: initialState.passwordController,
                labelText: S.of(context).password,
                hintText: S.of(context).password,
                keyboardType: TextInputType.visiblePassword,
                focus: initialState.passwordFocus,
                validator: validatePassword,
                obscure: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    buildWhen: (previous, current) => previous.isPasswordFocused != current.isPasswordFocused,
                    builder: (context, state) {
                      return SquareSvgImageFromAsset(
                        AppImage.password,
                        size: 20,
                        color: state.isPasswordFocused ? AppColor.primaryDark : AppColor.grey,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(16),
              CommonTextField(
                controller: initialState.confirmPasswordController,
                labelText: S.of(context).confirmPassword,
                hintText: S.of(context).confirmPassword,
                keyboardType: TextInputType.visiblePassword,
                focus: initialState.confirmPasswordFocus,
                validator: (value) => validateConfirmPassword(value, initialState.passwordController.text),
                obscure: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    buildWhen: (previous, current) =>
                        previous.isConfirmPasswordFocused != current.isConfirmPasswordFocused,
                    builder: (context, state) {
                      return SquareSvgImageFromAsset(
                        AppImage.password,
                        size: 20,
                        color: state.isConfirmPasswordFocused ? AppColor.primaryDark : AppColor.grey,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16 + context.bottomInset),
            child: CommonButton(
              onPressed: BlocProvider.of<ResetPasswordCubit>(context).onResetPasswordTap,
              label: S.of(context).resetPassword,
            ),
          ),
        ),
      ),
    );
  }
}
