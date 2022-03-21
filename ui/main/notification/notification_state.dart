part of 'notification_view.dart';

class NotificationState extends Equatable {
  final List<model.Notification> listNotification;

  const NotificationState({this.listNotification = const []});

  @override
  List<Object?> get props => [listNotification];

  NotificationState copyWith({List<model.Notification>? listNotification}) {
    return NotificationState(
      listNotification: listNotification ?? this.listNotification,
    );
  }
}
