part of 'main_view.dart';

class MainCubit extends BaseCubit<MainState> {
  final MainService _service;


  MainCubit(BuildContext context)
      : _service = MainService(context),
        super(context, MainState.initialState) {
    state.scrollController.addListener(() {
      switch (state.scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          toggleNavigationBar(true);
          break;
        case ScrollDirection.reverse:
          toggleNavigationBar(true);
          break;
        case ScrollDirection.idle:
      }
    });

    getProfile();
  }

  Future<void> getProfile() async {
    var user = await _service.getProfile();
    if (user != null) {
      AppPref.user = user;
      emit(state.copyWith(user: user));
    }
  }

  void toggleNavigationBar(bool value) {
    emit(state.copyWith(isNavigationBarVisible: value));
  }

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void toggleNotification(bool hasNotification) {
    emit(state.copyWith(hasNotification: hasNotification));
  }

  void notificationClick() {
    Navigator.of(context).pushNamed(AppRoute.notificationScreen);
  }
}
