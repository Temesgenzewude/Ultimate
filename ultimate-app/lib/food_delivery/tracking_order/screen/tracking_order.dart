import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/button_swipe.dart';

class TrackingOrder extends StatefulWidget {
  const TrackingOrder({Key? key}) : super(key: key);

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  BitmapDescriptor? _markerIconFrom;
  BitmapDescriptor? _markerIconTaxi;
  TripDataEntity? trip;
  late String mapStyleDark;
  bool isFinished = false;
  Timer? timer;

  Polyline? tripPolyline;
  int tripDistanceMeters = 20;
  bool isActive = false;

  LatLng? taxiMarkerLatLng;

  final LatLng myLocation = const LatLng(37.785834, -122.406417);
  late LatLng from;
  late LatLng to;
  Completer<GoogleMapController> mapControllerCompleter = Completer();

  Future<void> loadAssets() async {
    _markerIconFrom = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 1), store_front,
        mipmaps: false);
    _markerIconTaxi = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 1), ic_motorbike);
  }

  void startNewTrip(BuildContext context, LatLng from, LatLng to) {
    tripPolyline = Polyline(
        polylineId: const PolylineId('polyline-1'),
        width: 2,
        patterns: [
          PatternItem.dash(5),
          PatternItem.dash(10),
        ],
        color: primary,
        points: [
          from,
          LatLng(to.latitude + 0.01, to.longitude - 0.001),
          LatLng(to.latitude + 0.009, to.longitude - 0.002),
          LatLng(to.latitude + 0.008, to.longitude - 0.003),
          LatLng(to.latitude + 0.007, to.longitude - 0.004),
          LatLng(to.latitude + 0.001, to.longitude - 0.005),
          LatLng(to.latitude, to.longitude - 0.002),
          LatLng(to.latitude, to.longitude - 0.001),
          to
        ]);
    trip = TripDataEntity(
      polyline: tripPolyline!,
      distanceMeters: tripDistanceMeters,
    );
    activateTrip();
  }

  LatLng getTaxiDrivePosition(double animationValue) {
    assert(trip != null);
    final points = trip!.polyline.points;
    final int pointIndex = ((points.length - 1) * animationValue).round();
    return points[pointIndex];
  }

  void activateTrip() {
    taxiMarkerLatLng = null;
    isActive = true;
    const drivingDuration = Duration(seconds: 5);

    final drivingStartTime = DateTime.now();
    final drivingEndTime = DateTime.now().add(drivingDuration);

    timer = Timer.periodic(const Duration(milliseconds: 600), (time) {
      final now = DateTime.now();
      if (DateTime.now().compareTo(drivingEndTime) >= 0) {
        time.cancel();
        return;
      }
      final double drivingAnimationValue =
          now.difference(drivingStartTime).inMilliseconds.toDouble() /
              drivingDuration.inMilliseconds.toDouble();
      taxiMarkerLatLng = getTaxiDrivePosition(drivingAnimationValue);
      setState(() {});
    });
  }

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString('assets/images/style_map_dark.json')
        .then((string) {
      mapStyleDark = string;
    });
    loadAssets();
    from = LatLng(myLocation.latitude + 0.01, myLocation.longitude + 0.005);
    to = LatLng(myLocation.latitude, myLocation.longitude);
    startNewTrip(context, from, to);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: _markerIconFrom != null
          ? Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Animarker(
                    curve: Curves.bounceInOut,
                    zoom: 17.5,
                    rippleColor: primary,
                    duration: const Duration(milliseconds: 2000),
                    markers: <Marker>{
                      RippleMarker(
                          markerId: const MarkerId('toMarker'),
                          position: to,
                          alpha: 0.8,
                          ripple: true,
                          visible: false),
                    },
                    mapId: mapControllerCompleter.future
                        .then<int>((value) => value.mapId),
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                          target: LatLng(37.785834, -122.406417), zoom: 15),
                      myLocationEnabled: true,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      scrollGesturesEnabled: true,
                      myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                          anchor: const Offset(0.5, 0.5),
                          icon: _markerIconFrom!,
                          position: from,
                          markerId: const MarkerId('fromMarker'),
                        ),
                        if (isActive && taxiMarkerLatLng != null)
                          Marker(
                              anchor: const Offset(0.5, 0.5),
                              icon: _markerIconTaxi!,
                              position: taxiMarkerLatLng!,
                              markerId: const MarkerId('taxiMarker')),
                      },
                      polylines: <Polyline>{trip!.polyline},
                      onMapCreated: (GoogleMapController controller) {
                        controller.setMapStyle(mapStyleDark);
                        mapControllerCompleter.complete(controller);
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: 24,
                    top: 64,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimationClick(
                          function: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(icArrowLeft,
                              width: 24, height: 24, color: grey1100),
                        ),
                        AnimationClick(
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: grey200.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Shipper pick up your food.',
                                  style: title4(color: grey1100),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    '0901-776-058',
                                    style: subhead(color: grey500),
                                  ),
                                ),
                                Text(
                                  'Your order is already on its way to you!',
                                  style: subhead(color: grey500),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 24,
                    left: 8,
                    right: 8,
                    child: AnimationClick(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 32),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Fabrice Bessan',
                                            style: title3(color: grey1100),
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                'Food-Shipper',
                                                style: subhead(color: grey1100),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                '⭐️️10',
                                                style:
                                                    headline(color: grey1100),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AnimationClick(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: corn1,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Image.asset(
                                          chat_centered_dots,
                                          width: 24,
                                          height: 24,
                                          color: grey100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '🛵️ 10kms',
                                      style: headline(color: grey1100),
                                    ),
                                    Text(
                                      '⏰️ 15-20 minutes',
                                      style: headline(color: grey1100),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 32),
                                SwipeableButtonView(
                                  buttonText: 'Swipe to Call',
                                  buttonWidget: Container(
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  activeColor: const Color(0xFF009C41),
                                  isFinished: isFinished,
                                  onWaitingProcess: () {
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        isFinished = true;
                                      });
                                    });
                                  },
                                  onFinish: () async {
                                    setState(() {
                                      isFinished = false;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 20,
                              top: -30,
                              child: AnimationClick(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48),
                                      border: Border.all(color: grey100)),
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage(avt_male2),
                                    radius: 32,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            )
          : const CupertinoActivityIndicator(),
    );
  }
}

class TripDataEntity {
  TripDataEntity({
    required this.polyline,
    required this.distanceMeters,
  });

  final Polyline polyline;
  final int distanceMeters;
}
