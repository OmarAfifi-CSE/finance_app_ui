import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_colors.dart';
import 'carousel_card_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  // Define your cards in a list first
  final List<Widget> cardItems = [
    const CarouselCardWidget(),
    const CarouselCardWidget(
      backgroundColor: Color(0xff4151A6),
      cardName: 'M-Card',
      cardBalance: '3209 EG',
      cardNumber: '**** 4545',
      cardExpiry: '07/28',
    ),
    const CarouselCardWidget(
      cardName: 'Z-Card',
      cardBalance: '10506 EG',
      cardNumber: '**** 2676',
      cardExpiry: '03/25',
    ),
    const CarouselCardWidget(
      backgroundColor: Color(0xff4151A6),
      cardName: 'Y-Card',
      cardBalance: '5029 EG',
      cardNumber: '**** 1782',
      cardExpiry: '04/29',
    ),
  ];

  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 263.h,
            padEnds: false,
            viewportFraction: 0.65,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index.toDouble();
              });
            },
          ),
          items: cardItems.map((card) {
            return Container(
              // Adjust this value to increase or decrease the gap
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: card,
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
        DotsIndicator(
          dotsCount: cardItems.length,
          position: currentPage,
          decorator: DotsDecorator(
            spacing: EdgeInsets.symmetric(horizontal: 4.w),
            color: Color(0xffE3E9ED),
            activeColor: AppColors.primaryColor,
            size: const Size.square(9.0),
            activeSize: Size(18.w, 9.h),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
