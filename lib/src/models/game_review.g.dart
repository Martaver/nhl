// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameReview _$GameReviewFromJson(Map<String, dynamic> json) {
  return GameReview(
      id: json['id'] as String,
      message: json['message'] as String,
      rating: json['rating'] as int);
}

Map<String, dynamic> _$GameReviewToJson(GameReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'rating': instance.rating
    };
