part of 'map_bloc.dart';

abstract class MapEvent extends Equatable{
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent{
  final GoogleMapController mapController;

  const OnMapInitializedEvent({required this.mapController});
  
}
class OnFollowUserEvent extends MapEvent{
  final bool followUser;

  OnFollowUserEvent({required this.followUser});

}