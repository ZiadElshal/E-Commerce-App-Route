import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/core/resources/assets_manager.dart';
import 'package:e_commerce_app_route/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class AnnouncementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: ColorManager.primaryDark,
      indicatorBackgroundColor: ColorManager.white,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: HomeTabViewModel.get(context).sliderImages
          .map((url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          width: 210.w,
          height: 210.h,
        ),
      ))
          .toList(),
    );
  }
}
