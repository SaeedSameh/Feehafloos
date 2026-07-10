// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class FeehaAtmMap extends StatefulWidget {
  const FeehaAtmMap({
    Key? key,
    this.width,
    this.height,
    this.atmLocations,
    this.atmStatuses,
    this.onMarkerTap,
    this.userLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<LatLng>? atmLocations;
  final List<String>? atmStatuses;
  final Future Function(int clickedIndex)? onMarkerTap;
  final LatLng? userLocation;

  @override
  State<FeehaAtmMap> createState() => _FeehaAtmMapState();
}

class _FeehaAtmMapState extends State<FeehaAtmMap> {
  @override
  Widget build(BuildContext context) {
    // تحديد ما إذا كان التطبيق في وضع الدارك مود
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // تغيير الستايل بناء على وضع التطبيق
    final mapStyle = isDarkMode ? 'dark-v11' : 'light-v11';
    final mapboxUrl =
        'https://api.mapbox.com/styles/v1/mapbox/$mapStyle/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FlZWRtYXAiLCJhIjoiY21wcjEwNHlyMDRyODJwcjFwMm1rcHAyaiJ9.tDeL-tEq2YlifHEND9m2iw';

    // اللوجيك الجديد لمركز الخريطة
    final center = widget.userLocation != null
        ? ll.LatLng(
            widget.userLocation!.latitude, widget.userLocation!.longitude)
        : ((widget.atmLocations != null && widget.atmLocations!.isNotEmpty)
            ? ll.LatLng(widget.atmLocations!.first.latitude,
                widget.atmLocations!.first.longitude)
            : const ll.LatLng(29.9737, 30.9446));

    // تم حل المشكلة هنا: استخدام طريقة الدمج الصحيحة في دارت
    final String mapKey = widget.atmStatuses?.join(',') ?? '';

    // تجهيز لستة الدبابيس بتاعت الماكينات
    List<Marker> allMarkers = List.generate(
      widget.atmLocations?.length ?? 0,
      (index) {
        final loc = widget.atmLocations![index];

        final rawStatus =
            (widget.atmStatuses != null && widget.atmStatuses!.length > index)
                ? widget.atmStatuses![index]
                : '';

        final status = rawStatus.trim().toLowerCase();

        Color markerColor;
        if (status == 'has cash' || status == 'فيها فلوس') {
          markerColor = Colors.green;
        } else if (status == 'broken' ||
            status == 'عطلانة' ||
            status == 'عطلانه') {
          markerColor = Colors.amber;
        } else if (status == 'empty' ||
            status == 'فاضية' ||
            status == 'فاضيه') {
          markerColor = Colors.grey;
        } else {
          markerColor = Colors.red;
        }

        return Marker(
          point: ll.LatLng(loc.latitude, loc.longitude),
          width: 50,
          height: 50,
          child: GestureDetector(
            onTap: () {
              if (widget.onMarkerTap != null) {
                widget.onMarkerTap!(index);
              }
            },
            child: Icon(
              Icons.location_on,
              color: markerColor,
              size: 40,
            ),
          ),
        );
      },
    ).toList();

    // إضافة دبوس أزرق مميز لموقع المستخدم الحالي (لو موجود)
    if (widget.userLocation != null) {
      allMarkers.add(
        Marker(
          point: ll.LatLng(
              widget.userLocation!.latitude, widget.userLocation!.longitude),
          width: 60,
          height: 60,
          child: const Icon(
            Icons.my_location,
            color: Colors.blueAccent,
            size: 45,
          ),
        ),
      );
    }

    return Container(
      key: ValueKey(mapKey),
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: center,
          initialZoom: 14.0,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: mapboxUrl,
          ),
          MarkerLayer(
            markers: allMarkers,
          ),
        ],
      ),
    );
  }
}
