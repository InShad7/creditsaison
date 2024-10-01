import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/style.dart';

class OpenCardWidget extends StatelessWidget {
  const OpenCardWidget({
    super.key,
    required this.width,
    required this.flag,
    required this.commonName,
    required this.officialName,
    required this.currency,
  });

  final double width;
  final String flag;
  final String commonName;
  final String officialName;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: width * 0.2,
            backgroundColor: CustomColors.white,
            backgroundImage: NetworkImage(flag),
          ),
          KConstants.kHeight,
          Text(
            textAlign: TextAlign.center,
            commonName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          KConstants.kHeight,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Official Name: ',
              style: CustomStyle.normalBlack,
              children: [
                TextSpan(
                  text: officialName,
                  style: CustomStyle.boldBlack,
                ),
              ],
            ),
          ),
          KConstants.kHeight,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Currency: ',
              style: CustomStyle.normalBlack,
              children: [
                TextSpan(
                  text: currency,
                  style: CustomStyle.boldBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
