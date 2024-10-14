part of 'location_bloc.dart';

class LocationState extends Equatable{
  const LocationState({
    this.isFollowingUser = false,
    this.lastKnownPosition,
    locationHistory
  }) : locationHistory = locationHistory ?? const [] ;

  final bool isFollowingUser;
  final LatLng? lastKnownPosition;
  final List<LatLng> locationHistory;
  

  copyWith({
    bool? isFollowingUser,
    LatLng? lastKnownPosition,
    List<LatLng>? locationHistory,
  }) => LocationState(
    isFollowingUser: isFollowingUser ?? this.isFollowingUser,
    lastKnownPosition: lastKnownPosition ?? this.lastKnownPosition,
    locationHistory: locationHistory ?? this.locationHistory
  );

  @override
  List<Object?> get props => [ isFollowingUser, lastKnownPosition, locationHistory ];
}

