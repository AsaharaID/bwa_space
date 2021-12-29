// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bwa_space/widgets/product_grid_item.dart';
import 'package:bwa_space/widgets/product_list_item.dart';
import 'package:bwa_space/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 130),
          child: AppBar(
            toolbarHeight: 80,
            backgroundColor: kWhiteColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: kBlackColor,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kWhiteGreyColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (value) {
                              Navigator.pushNamed(context, '/search-result');
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: 'Search Furniture'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.close,
                          color: kGrayColor,
                        ),
                      ],
                    ),
                  ),
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
            bottom: TabBar(
              indicatorColor: kPurpleColor,
              labelColor: kBlackColor,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 35),
              tabs: [
                Tab(
                  text: 'Chair',
                ),
                Tab(
                  text: 'Table',
                ),
                Tab(
                  text: 'Accessories',
                ),
                Tab(
                  text: 'Living Room',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildBody(),
            buildBody(),
            buildBody(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Result for : Poang',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Image.asset(
                isShowGrid ? 'assets/list.png' : 'assets/icon_grid.png',
                width: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        isLoading ? buildLoading() : isShowGrid ? buildGrid() : buildList(),
        //buildGrid(),
      ],
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

  Widget buildList() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list1.png',
        ),
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list2.png',
        ),
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list3.png',
        ),
        ProductListItem(
          title: 'Poan Table',
          price: 34,
          imageUrl: 'assets/image_product_list4.png',
        ),
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list1.png',
        ),
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list2.png',
        ),
        ProductListItem(
          title: 'Poan Chair',
          price: 34,
          imageUrl: 'assets/image_product_list3.png',
        ),
        ProductListItem(
          title: 'Poan Table',
          price: 34,
          imageUrl: 'assets/image_product_list4.png',
        ),
      ],
    );
  }
}
