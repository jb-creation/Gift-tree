part of 'model.dart';

@JsonSerializable()
class ChatData extends Equatable {
  final int id;
  final bool isOnline;
  final String image;
  final String name;
  final String message;
  final String time;

  const ChatData({
    required this.id,
    required this.isOnline,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  List<Object?> get props => [isOnline, message, time, name, image];

  ChatData copyWith({
    bool? isOnline,
    String? image,
    String? name,
    String? message,
    String? time,
  }) {
    return ChatData(
      id: id,
      isOnline: isOnline ?? this.isOnline,
      image: image ?? this.image,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChatDataToJson(this);
}

@JsonSerializable()
class ChatMessage {
  final int id;
  final String message;
  final DateTime time;
  final String to;
  final String from;
  final int type;

  const ChatMessage({
    required this.id,
    required this.message,
    required this.time,
    required this.to,
    required this.from,
    required this.type,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

@JsonSerializable()
class FaqsData {
  final String Question;
  final String Answer;

  const FaqsData({
    required this.Question,
    required this.Answer,
  });

  factory FaqsData.fromJson(Map<String, dynamic> json) =>
      _$FaqsDataFromJson(json);

  Map<String, dynamic> toJson() => _$FaqsDataToJson(this);
}

@JsonSerializable()
class NotificationSettingsData {
  final int id;
  final String title;
  late bool selected = false;

  NotificationSettingsData({
    required this.id,
    required this.title,
    required this.selected,
  });

  factory NotificationSettingsData.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSettingsDataToJson(this);

  NotificationSettingsData copyWith({bool? selection}) {
    return NotificationSettingsData(
        id: id, title: title, selected: selection ?? selected);
  }
}
