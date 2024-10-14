part of 'gps_bloc.dart';

class GpsState extends Equatable{

  const GpsState({
    required this.isGpsEnabled, 
    required this.isGpsPermissionGranted
  });

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted; 
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) => GpsState(
    isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled , 
    isGpsPermissionGranted: isGpsPermissionGranted ?? this.isGpsPermissionGranted 
  );

  @override
  List<Object> get props => [ isGpsEnabled, isGpsPermissionGranted ];
}

