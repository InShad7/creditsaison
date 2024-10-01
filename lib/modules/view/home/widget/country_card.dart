import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/style.dart';
import 'open_card.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.commonName,
    required this.officialName,
    required this.currency,
    required this.flag,
  });

  final String commonName;
  final String officialName;
  final String currency;
  final String flag;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return OpenCardWidget(
              width: width,
              flag: flag,
              commonName: commonName,
              officialName: officialName,
              currency: currency,
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: width * 0.02,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.020),
          color: CustomColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: width * 0.08,
              backgroundColor: CustomColors.white,
              backgroundImage: NetworkImage(flag),
            ),
            KConstants.kWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commonName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  KConstants.kHeight,
                  RichText(
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
            ),
          ],
        ),
      ),
    );
  }
}
