part of 'map_bloc.dart';

class MapState extends Equatable{
  const MapState({
    this.isMapInitialized = false, 
    this.isFollowingUser = true
  });

  final bool isMapInitialized;
  final bool isFollowingUser;


  copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser
  }) => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    isFollowingUser: isFollowingUser ?? this.isFollowingUser
  );

  @override
  List<Object> get props => [ isMapInitialized, isFollowingUser ];
}


