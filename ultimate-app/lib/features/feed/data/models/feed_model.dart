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
      id: json['id'],
      authorName: json['authorName'],
      newsExcerpt: json['newsExcerpt'],
      dateAuthorered: json['dateAuthorered'],
      newsContent: json['newsContent'],
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
