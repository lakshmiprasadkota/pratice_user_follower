import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!.withOpacity(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? 1
              : .5),
      highlightColor: Colors.grey[200]!.withOpacity(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? 1
              : .5),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 50),
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 30,
                width: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                height: 50,
                width: 50,
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
