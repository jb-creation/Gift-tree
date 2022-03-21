part of 'profile_view.dart';

class ProfileOptionGroup {
  final List<ProfileOption> options;

  ProfileOptionGroup(this.options);
}

class ProfileOption {
  final _ProfileOption option;
  final String title;
  final String description;
  final String image;
  final bool hasIcon;

  ProfileOption(this.option, this.title, this.description, this.image, [this.hasIcon = true]);
}

enum _ProfileOption {
  firstName,
  lastName,
  emailAddress,
  mobileNumber,
  notifications,
  changePassword,
  termsAndConditions,
  faq
}