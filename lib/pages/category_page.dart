import 'package:bwa_space/theme.dart';
import 'package:bwa_space/widgets/home_category_item.dart';
import 'package:bwa_space/widgets/product_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          elevation: 0,
          backgroundColor: kWhiteColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: kPurpleColor,
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                'Chair',
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
              SizedBox(
                width: 18,
              ),
              Image.asset(
                'assets/options.png',
                width: 24,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 10,
          ),
          HomeCategoryItem(
            title: 'Minimalist Chair',
            subtitle: 'Chair',
            imageUrl: 'assets/image_product_category1.png',
          ),
          SizedBox(
            height: 24,
          ),
          Wrap(
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
                title: 'Poan Chair',
                imageUrl: 'assets/image_product_grid6.png',
                price: 420,
                isWishlist: false,
              ),
              ProductGridItem(
                title: 'Poan Chair',
                imageUrl: 'assets/image_product_grid6.png',
                price: 420,
                isWishlist: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
