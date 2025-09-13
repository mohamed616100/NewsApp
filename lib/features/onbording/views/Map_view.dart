import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newsapp/core/widgets/Buttonlarge.dart';
import '../../../core/helper/my_navgitor.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_font_weight.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/widgets/Custom_Bottom_Nav.dart';
import '../cubit/cubit_location/cubit_location.dart';
import '../cubit/cubit_location/state_location.dart';
class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      LocationCubit()
        ..getLocation(),
      child: Builder(
        builder: (context) {
          return Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 90.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: TextFormField(
                        controller: LocationCubit.get(context).Usernamecontroller,
                        style: GoogleFonts.schibstedGrotesk(
                          color: AppColors.black,
                          fontSize: 17.sp,
                          fontWeight: AppFontWeight.regular,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: IconButton(onPressed: null,
                            icon: SvgPicture.asset(
                                AppIcons.profile, width: 24.w, height: 24.h),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.Grey1,
                        ),
                      ),
                    ),SizedBox(height: 20.h,),
                            BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state)
                {
                  if(state is StateLoading)
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is StateSuccess)
                  {
                    return Expanded(
                      child: Stack(
                        children: [
                      GoogleMap(
                      initialCameraPosition: CameraPosition(
                      target: LatLng(state.latLng.latitude, state.latLng.longitude),
                      zoom: 15,
                    ),
                    markers: LocationCubit.get(context).markers,
                        myLocationEnabled: true,
                        onTap: LocationCubit.get(context).changeLocation,
                        onMapCreated: (GoogleMapController mapController) {
                          LocationCubit.get(context).controller.complete(mapController);
                        },

                      ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 28.h),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Buttonlarge(
                                    text: 'Get Started',
                                    onPressed: () {
                                      final selectedLocation = LocationCubit.get(context).markers.first.position;
                                      final username = LocationCubit.get(context).Usernamecontroller.text;
                                      MyNavigator.goTo(context, CustomBottomNav(
                                        selectedLocation: selectedLocation,
                                        username: username,
                                      ),
                                          type: NavigatorType.pushAndRemoveUntil,
                                      );
                                    },
                                    width: 161.w,
                                    height: 56.h,
                                    spacebetween: 0
                                )),
                          )
                        ],
                      ),
                    );
                  }
                  else if(state is StateError)
                  {
                    return Text(state.error);
                  }
                  else
                  {
                    return SizedBox();
                  }
                }
                          ),
                  ],
                ),
          );
        }
      ),
    );
  }
}
