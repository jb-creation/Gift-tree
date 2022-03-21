import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/registration_header_view.dart';
import 'package:pessa_flow/ui/login_register/otp_verification/otp_verification_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/utils/input_formatters.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_recovery_cubit.dart';

part 'password_recovery_state.dart';

class PasswordRecoveryView extends StatefulWidget {
  const PasswordRecoveryView({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryViewState createState() => _PasswordRecoveryViewState();
}

class _PasswordRecoveryViewState extends State<PasswordRecoveryView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<PasswordRecoveryCubit>(context).state;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: initialState.formKey,
          child: Column(
            children: [
              RegistrationHeaderView(
                title: S.of(context).passwordRecoveryTitle,
                subTitle: S.of(context).passwordRecoverySubTitle,
              ),
              CommonTextField(
                controller: initialState.phoneController,
                labelText: S.of(context).phoneNumber,
                hintText: S.of(context).enterYourPhoneNumber,
                keyboardType: TextInputType.phone,
                focus: initialState.phoneFocus,
                validator: validateMobileNumber,
                inputFormatters: [NumberInputFormatter(length: 10)],
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<PasswordRecoveryCubit, PasswordRecoveryState>(
                    buildWhen: (previous, current) => previous.isPhoneFocused != current.isPhoneFocused,
                    builder: (context, state) {
                      return SquareSvgImageFromAsset(
                        AppImage.phone,
                        size: 20,
                        color: state.isPhoneFocused ? AppColor.primaryDark : AppColor.grey,
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
        color: AppColor.transparent,
        elevation: 0,
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16 + context.bottomInset),
            child: CommonButton(
              onPressed: BlocProvider.of<PasswordRecoveryCubit>(context).onSendCodeTap,
              label: S.of(context).sendCode,
            ),
          ),
        ),
      ),
    );
  }
}
