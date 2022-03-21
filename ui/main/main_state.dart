part of 'main_view.dart';

class MainState extends Equatable {
  final ScrollController scrollController;
  final int currentIndex;
  final bool hasNotification;
  final bool isNavigationBarVisible;
  final User user;

  MainState(this.scrollController,
      {this.currentIndex = 0,
      this.hasNotification = false,
      this.isNavigationBarVisible = true,
      required this.user,
      this.listTitle = const ["Home", "Transaction", "Cards", "My Profile"]});

  var listTitle;

  @override
  List<Object?> get props => [currentIndex, hasNotification, isNavigationBarVisible, listTitle, user];

  static MainState get initialState => MainState(ScrollController(), user: AppPref.user!);

  MainState copyWith({int? currentIndex, bool? hasNotification, bool? isNavigationBarVisible, List<String>? listTitle, User? user}) {
    print("SET $listTitle");
    return MainState(scrollController,
        currentIndex: currentIndex ?? this.currentIndex,
        hasNotification: hasNotification ?? this.hasNotification,
        isNavigationBarVisible: isNavigationBarVisible ?? this.isNavigationBarVisible,
        listTitle: listTitle ?? this.listTitle,
        user: user ?? this.user);
  }
}
