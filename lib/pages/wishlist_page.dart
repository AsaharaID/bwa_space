import 'package:bwa_space/theme.dart';
import 'package:bwa_space/widgets/product_grid_item.dart';
import 'package:bwa_space/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isLoading = true;
  bool isShowGrid = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBar(
          elevation: 0,
          backgroundColor: kWhiteColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Spacer(),
              Text(
                'Wishlist',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/icon_search.png',
                width: 24,
              ),
            ],
          ),
        ),
      ),
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
              if (value == 0) {
                Navigator.pushNamed(context, '/home');
              } else if (value == 2) {
                Navigator.pushNamed(context, '/profile');
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home.svg',
                    width: 24,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/heart.png',
                    color: kPurpleColor,
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
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          SizedBox(
            height: 30,
          ),
          isLoading ? buildLoading() : buildGrid(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
    );
  }

  Widget buildGrid() {
    return Wrap(
      clipBehavior: Clip.antiAlias,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 18,
      runSpacing: 18,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid1.png',
          price: 34,
          isWishlist: true,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid2.png',
          price: 69,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid3.png',
          price: 31,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid4.png',
          price: 32,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Table',
          imageUrl: 'assets/image_product_grid5.png',
          price: 420,
          isWishlist: true,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid6.png',
          price: 420,
          isWishlist: false,
        ),
        ProductGridItem(
          title: 'Poan Table',
          imageUrl: 'assets/image_product_grid5.png',
          price: 420,
          isWishlist: true,
        ),
        ProductGridItem(
          title: 'Poan Chair',
          imageUrl: 'assets/image_product_grid6.png',
          price: 420,
          isWishlist: false,
        ),
      ],
    );
  }
}
