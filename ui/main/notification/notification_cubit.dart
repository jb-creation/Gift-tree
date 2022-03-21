part of 'notification_view.dart';

class NotificationCubit extends BaseCubit<NotificationState> {
  NotificationCubit(BuildContext context) : super(context, const NotificationState()) {
    Timer.run(() {
      emit(NotificationState(
        listNotification: [
          model.Notification(
            title: "Sean Green",
            detail: "You paid \$100 successfully.",
            type: 1,
            to: model.TransactionUser(
              id: 1,
              name: "̌Sean Green",
              image: "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
            ),
          ),
          model.Notification(
            title: "Sean Green",
            detail: "You received \$321 from kathleen",
            type: 2,
            from: model.TransactionUser(
              id: 1,
              name: "̌Sean Green",
              image: "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
            ),
          ),
          model.Notification(
            title: "Bank Added",
            detail: "Your BOB is added successfully",
            type: 3,
          ),
          model.Notification(
            title: "Card Added",
            detail: "Your card of yes bank is added successfully.",
            type: 4,
          ),
          model.Notification(
            title: "Money Added",
            detail: "\$500 is added successfully to my balance.",
            type: 5,
          ),
        ],
      ));
    });
  }
}
