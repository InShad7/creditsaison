import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  final Size preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);

    return AppBar(
      backgroundColor: CustomColors.darkBlue,
      title: const Text('Countries'),
      actions: [
        GestureDetector(
          onTap: provider.filterCountry,
          child: Row(
            children: [
              const Icon(
                Icons.filter_alt_outlined,
              ),
              KConstants.kWidth,
              Center(
                child: Text(
                  provider.isFilter ? 'Unsort' : 'Sort',
                ),
              ),
              KConstants.kWidth20,
            ],
          ),
        ),
      ],
    );
  }
}
