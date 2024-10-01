import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class ShimmerBuilder extends StatelessWidget {
  const ShimmerBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.02,
          ),
          padding: EdgeInsets.all(width * 0.02),
          height: width / 6,
          decoration: BoxDecoration(
            color: CustomColors.fadedblack,
            borderRadius: BorderRadius.circular(width * 0.020),
          ),
        ),
      ),
    );
  }
}
