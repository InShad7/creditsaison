import 'package:creditsaison/modules/controller/home_controller.dart';
import 'package:creditsaison/modules/model/country_model.dart';
import 'package:creditsaison/modules/view/home/widget/home_card_animation.dart';
import 'package:creditsaison/modules/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/app_bar.dart';
import 'widget/country_card.dart';
import 'widget/shimmer_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<HomeController>(context, listen: false);
    provider.fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: const CustomAppBar(),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return value.isLoading
              ? const ShimmerBuilder()
              : ListView.builder(
                  itemCount: value.filteredCountry.length,
                  itemBuilder: (context, index) {
                    CountryModel country = value.filteredCountry[index];
                    return AnimatedOpacitySlideTransition(
                      delay: Duration(milliseconds: 100 * index),
                      child: CountryCard(
                        commonName: country.commonName,
                        currency: country.currencyName,
                        officialName: country.officialName,
                        flag: country.flag,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
