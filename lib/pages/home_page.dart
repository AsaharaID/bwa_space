// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bwa_space/theme.dart';
import 'package:bwa_space/widgets/home_category_item.dart';
import 'package:bwa_space/widgets/home_popular_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kPurpleColor,
              blurRadius: 5,
              offset: Offset(0, 0),
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: kWhiteColor,
            onTap: (value) {
              if (value == 1) {
                Navigator.pushNamed(context, '/wishlist');
              } else if (value == 2) {
                Navigator.pushNamed(context, '/profile');
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home.svg',
                    color: kPurpleColor,
                    width: 24,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/heart.png',
                    width: 24,
                  ),
                  label: 'wishlist'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/person.png',
                    width: 24,
                  ),
                  label: 'profile'),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/image_background.png',
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    //NOTE : Header
                    Image.asset(
                      'assets/sr-logo-2.png',
                      width: 53,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'SR-Space',
                      style: purpleTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/shopping-cart.png',
                      width: 30,
                    ),
                  ],
                ),
              ),

              //NOTE : Search Bar
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 24,
                    right: 24,
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kWhiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search Furniture',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Image.asset(
                        'assets/icon_search.png',
                        width: 24,
                        color: kGrayColor,
                      )
                    ],
                  ),
                ),
              ),
              //NOTE : Category Title
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Show All',
                      style: purpleTextStyle,
                    ),
                  ],
                ),
              ),
              //NOTE : Category Carousel
              Container(
                margin: EdgeInsets.only(top: 25),
                child: CarouselSlider(
                  // ignore: prefer_const_literals_to_create_immutables
                  items: [
                    HomeCategoryItem(
                      title: 'Minimalist Chair',
                      subtitle: 'Chair',
                      imageUrl: 'assets/image_product_category1.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalist Table',
                      subtitle: 'Table',
                      imageUrl: 'assets/image_product_category2.png',
                    ),
                    HomeCategoryItem(
                      title: 'Minimalist Chair',
                      subtitle: 'chair',
                      imageUrl: 'assets/image_product_category3.png',
                    ),
                  ],
                  options: CarouselOptions(
                    height: 140,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (value, _) {
                      setState(() {
                        categoryIndex = value;
                      });
                    },
                  ),
                ),
              ),
              //NOTE : Carousel Indicator
              Container(
                margin: EdgeInsets.only(
                  top: 13,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 0 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 1 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            categoryIndex == 2 ? kBlackColor : kLineDarkColor,
                      ),
                    ),
                  ],
                ),
              ),

              //NOTE : Popular Section
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Show All',
                            style: purpleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 310,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular1.png',
                              price: 34,
                              isWishlist: true,
                            ),
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular2.png',
                              price: 40,
                              isWishlist: false,
                            ),
                            HomePopularItem(
                              title: 'Poan Chair',
                              imageUrl: 'assets/image_product_popular3.png',
                              price: 69,
                              isWishlist: false,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
