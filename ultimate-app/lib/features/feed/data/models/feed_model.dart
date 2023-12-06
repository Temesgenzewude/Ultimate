import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';

class FeedModel extends FeedEntity {
  const FeedModel({
    required String id,
    required String authorName,
    required String newsExcerpt,
    required String dateAuthorered,
    required String newsContent,
  }) : super(
          id: id,
          authorName: authorName,
          dateAuthorered: dateAuthorered,
          newsContent: newsContent,
          newsExcerpt: newsExcerpt,
        );

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'] != null ? json['id' ]: '',
      authorName: json['authorName'] != null ? json['authorName']: '',
      newsExcerpt: json['newsExcerpt'] != null ? json['newsExcerpt'] : '',
      dateAuthorered: json['dateAuthorered'] != null ? json['dateAuthorered']: '',
      newsContent: json['newsContent'] != null ? json['newsContent'] : '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorName': authorName,
      'newsExcerpt': newsExcerpt,
      'dateAuthorered': dateAuthorered,
      'newsContent': newsContent,
    };
  }
}
