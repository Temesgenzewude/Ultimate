import 'package:equatable/equatable.dart';

class FeedEntity extends Equatable {
  const FeedEntity({
    required this.authorName,
    required this.dateAuthorered,
    required this.id,
    required this.newsContent,
    required this.newsExcerpt,
  });

  final String id;
  final String authorName;
  final String newsExcerpt;
  final String dateAuthorered;
  final String newsContent;

  @override
  List<Object?> get props => [id, newsContent];
}
