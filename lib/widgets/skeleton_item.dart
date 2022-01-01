import 'package:bwa_space/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: kBlackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 82) / 2,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Shimmer.fromColors(
              child: Container(
                width: double.infinity,
                height: 120,
                color: kPurpleColor,
              ),
              baseColor: kLineDarkColor,
              highlightColor: kWhiteGreyColor,
            ),
            SizedBox(
              height: 22,
            ),
            Shimmer.fromColors(
              child: Container(
                width: double.infinity,
                height: 22,
                color: kPurpleColor,
              ),
              baseColor: kLineDarkColor,
              highlightColor: kWhiteGreyColor,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    width: 40,
                    height: 42,
                    color: kPurpleColor,
                  ),
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                ),
                Shimmer.fromColors(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPurpleColor,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
