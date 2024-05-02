import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../app/utils/app_fonts.dart';
import '../../../app/widgets/button_widget.dart';
import '../../../app/widgets/image_widget.dart';
import '../../../app/widgets/text_widget.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key,});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  late GoogleMapController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition:  CameraPosition(
                target: LatLng(29.979562,31.255448),
                zoom: 12.5,
              ),
              onMapCreated: (con) {
                controller = con;
                initStyle(context);
              },
              markers: {
                Marker(
                  markerId: const MarkerId("1"),
                  position: LatLng(29.979562,31.255448),
                ),
                Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(30.037845,31.221526),
                ),
                Marker(
                  markerId: const MarkerId("3"),
                  position:LatLng(30.005891,31.229520),
                ),
              },
              polylines:{
                Polyline(
                  polylineId: const PolylineId("1"),
                  width: 5,
                  color: Colors.blue,
                  points: [
                    LatLng(29.979562,31.255448),
                    LatLng(30.037845,31.221526),
                  ]
                ),
                Polyline(
                  polylineId: const PolylineId("2"),
                  width: 5,
                    color: Colors.blue,
                    points: [
                    LatLng(29.979562,31.255448),
                    LatLng(30.005891,31.229520),
                  ]
                ),
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r),
                topRight: Radius.circular(35.r),
              ),
              color: AppColors.mainColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ImageWidget(
                      imageUrl: "assets/images/track.png",
                      width: 100.w,
                      height: 100.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Ali Omar Ali",
                          titleSize: 16.sp,
                          titleFontWeight: AppFonts.bold600,
                          titleColor: AppColors.white,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20.sp,
                              color: AppColors.yellow,
                            ),
                            TextWidget(
                              title: "3.5",
                              titleSize: 16.sp,
                              titleColor: AppColors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                16.verticalSpace,
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r),
                    ),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_city,
                            size: 25.sp,
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: TextWidget(
                              title: "46, edrees st, elwehda st, Imbaba, Giza-Egypt",
                              titleSize: 16.sp,
                              titleMaxLines: 5,
                              titleAlign: TextAlign.start,
                              titleFontWeight: AppFonts.bold600,
                              titleColor: AppColors.black,
                            ),
                          ),

                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 25.sp,
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: TextWidget(
                              title: "Within five days",
                              titleSize: 16.sp,
                              titleMaxLines: 5,
                              titleAlign: TextAlign.start,
                              titleFontWeight: AppFonts.bold600,
                              titleColor: AppColors.black,
                            ),
                          ),

                        ],
                      ),
                      16.verticalSpace,
                      ButtonWidget(
                        onPressed: () {

                        },
                        text: "Back to home",
                        textColor: AppColors.white,
                        mainAxisAlignment: MainAxisAlignment.center,
                        horizontalMargin: 50.sp,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void initStyle(context)async {
    var style = await DefaultAssetBundle.of(context).
    loadString("assets/maps_styles/style.json");
    controller.setMapStyle(style);
  }
}
