import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/main/main_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';

part 'profile_cubit.dart';

part 'profile_state.dart';

part 'profile_option.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          userView(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  BlocSelector<MainCubit, MainState, User>(
                    selector: (state) => state.user,
                    builder: (context, user) {
                      return commonList(ProfileOptionGroup([
                        ProfileOption(_ProfileOption.firstName,
                            S.of(context).firstName, user.FirstName, "", false),
                        ProfileOption(_ProfileOption.lastName,
                            S.of(context).lastName, user.LastName, "", false),
                        ProfileOption(_ProfileOption.emailAddress,
                            S.of(context).email, user.Email, "", false),
                        ProfileOption(
                            _ProfileOption.mobileNumber,
                            S.of(context).mobileNumber,
                            user.PhoneNumber,
                            "",
                            false),
                      ]));
                    },
                  ),
                  const SizeBoxH(16),
                  const Divider(indent: 16, endIndent: 16),
                  const SizeBoxH(16),
                  commonList(ProfileOptionGroup([
                    ProfileOption(
                        _ProfileOption.notifications,
                        S.of(context).notifications,
                        "Change Notification Settings",
                        AppImage.notificationSetting),
                    ProfileOption(
                        _ProfileOption.changePassword,
                        S.of(context).password,
                        "Change Password Settings",
                        AppImage.passwordSetting),
                    ProfileOption(
                        _ProfileOption.termsAndConditions,
                        S.of(context).termsAndCondition,
                        "Terms you agree to when you use app",
                        AppImage.termsSetting),
                    ProfileOption(_ProfileOption.faq, S.of(context).faqs,
                        "Frequently Asked Questions", AppImage.termsSetting),
                  ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userView() {
    return Container(
      width: double.maxFinite,
      height: 140,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 58.0),
              decoration: const BoxDecoration(
                color: AppColor.primary,
              ),
              child: CommonText.bold(S.of(context).myProfile,
                  size: 22, color: AppColor.white, textAlign: TextAlign.center),
            ),
          ),
          Positioned(
            bottom: 60.0,
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                ApiClient.dio.clear();
                AppPref.clear();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoute.loginScreen, (route) => false);
              },
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 58.0),
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                ),
                child: const Icon(
                  Icons.power_settings_new,
                  size: 28,
                  color: AppColor.white,
                ),
              ),
            ),
          )
         /* ,
          Positioned(
            width: 100,
            height: 100,
            bottom: 10,
            child: Stack(
              children: const [
                Positioned(
                  child: ClipOval(
                    child: Material(
                      color: AppColor.white,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleImageFromNetwork(
                          imageUrl: "https://picsum.photos/200",
                          size: 84,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 4,
                    right: 10,
                    width: 36,
                    height: 36,
                    child: ClipOval(
                      child: Material(
                        color: AppColor.white,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: CircleSvgImageFromAsset(
                            AppImage.camera,
                            size: 18,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget commonList(ProfileOptionGroup optionGroup) {
    return Material(
      color: AppColor.white,
      clipBehavior: Clip.hardEdge,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        itemCount: optionGroup.options.length,
        separatorBuilder: (context, index) => Container(
          height: 16.0,
        ),
        itemBuilder: (context, index) => listItem(optionGroup.options[index]),
      ),
    );
  }

  Widget listItem(ProfileOption option) {
    return InkWell(
      onTap: () async {
        switch (option.option) {
          case _ProfileOption.firstName:
            await Navigator.of(context).pushNamed(AppRoute.profileUpdate);
            BlocProvider.of<MainCubit>(context).getProfile();
            break;
          case _ProfileOption.lastName:
            await Navigator.of(context).pushNamed(AppRoute.profileUpdate);
            BlocProvider.of<MainCubit>(context).getProfile();
            break;
          case _ProfileOption.emailAddress:
            await Navigator.of(context).pushNamed(AppRoute.profileUpdate);
            BlocProvider.of<MainCubit>(context).getProfile();
            break;
          case _ProfileOption.mobileNumber:
            await Navigator.of(context).pushNamed(AppRoute.profileUpdate);
            BlocProvider.of<MainCubit>(context).getProfile();
            break;
          case _ProfileOption.notifications:
            Navigator.of(context).pushNamed(AppRoute.settingsScreen);
            break;
          case _ProfileOption.changePassword:
            Navigator.of(context).pushNamed(AppRoute.changePassword);
            break;
          case _ProfileOption.termsAndConditions:
            break;
          case _ProfileOption.faq:
            Navigator.of(context).pushNamed(AppRoute.faqsScreen);
            break;
        }
      },
      child: Material(
        color: const Color(0xFFF9FCFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColor.greyMedium),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (option.hasIcon) ...[
                Material(
                  borderRadius: BorderRadius.circular(12),
                  child: CircleSvgImageFromAsset(
                    option.image,
                    size: 36,
                  ),
                ),
                const SizeBoxV(12),
              ],
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                      alignment: AlignmentDirectional.centerStart,
                      child: CommonText.semiBold(
                        option.title,
                        size: 16,
                        color: AppColor.primary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 4, 8, 8),
                      alignment: AlignmentDirectional.centerStart,
                      child: CommonText.medium(
                        option.description,
                        size: 14,
                        color: AppColor.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: SquareSvgImageFromAsset(
                  AppImage.arrowNext,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
