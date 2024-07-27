import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../core/helpers/data_cache.dart';
import '../../../../../core/helpers/spacing.dart';
import 'carousel_slider_item.dart';
import 'custom_animated_smooth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int activeIndex;
  late CarouselController controller;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.0.h,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeFactor: 0.25,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                var nowPlayingMovies =
                    cache.getData(DataCacheKeys.nowPlayingMovies);
                return CarouselSliderItem(
                  moviesModel: nowPlayingMovies.movies![index],
                );
              },
            ),
          ),
          verticalSpace(12),
          CustomAnimatedSmoothIndicator(
            activeIndex: activeIndex,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
