part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initalize() = Initialize;
  const factory FastLaughEvent.likeVideo({
    required int id,
  }) = LikeVideo;
  const factory FastLaughEvent.unlikeVideo({
    required int id,
  }) = UnlikeVideo;
}
