import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:creditsaison/modules/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeController extends ChangeNotifier {
  bool isFilter = false;
  bool isLoading = false;

  List<CountryModel> filteredCountry = [];
  List<CountryModel> countriesData = [];
  List<String> countryList = [
    "india",
    "korea",
    "germany",
    "italy",
    "china",
    "israel",
    "lanka",
  ];

// fun to fetch the country data
  Future<List<CountryModel>> fetchCountryData() async {
    isLoading = true;
    List<CountryModel> countriesData = [];

    for (String country in countryList) {
      //base URL
      String apiUrl = 'https://restcountries.com/v3.1/translation/$country';

      try {
        final response = await http.get(Uri.parse(apiUrl)).timeout(
              const Duration(seconds: 10),
            );

        if (response.statusCode == 200) {
          List jsonResponse = jsonDecode(response.body);

          if (jsonResponse.isNotEmpty) {
            // parse and add each country data
            CountryModel countryModel = CountryModel.fromJson(jsonResponse[0]);
            countriesData.add(countryModel);
          }
        } else {
          Fluttertoast.showToast(msg: 'Failed to load data! Try again later.');
          log('Failed to load data for $country (Status code: ${response.statusCode})');
        }
        //error handlings
      } on TimeoutException {
        Fluttertoast.showToast(msg: 'Timeout! Try again later.');
        log('Error: Timeout!! Try again later for $country');
      } on FormatException {
        Fluttertoast.showToast(msg: 'Format not found! Try again later.');
        log('Error: Data format error for $country');
      } on SocketException {
        Fluttertoast.showToast(
            msg: 'Oops! Check your internet connection! Try again later.');
        log('Error: Check your internet connection for $country');
      } on HttpException {
        Fluttertoast.showToast(msg: 'Some thing went wrong! Try again later.');
        log('Error: HTTP error occurred for $country');
      } catch (e) {
        Fluttertoast.showToast(msg: 'Some thing went wrong! Try again later.');
        log('Error: Something went wrong for $country: $e');
      }
    }
//assign the fetched data
    this.countriesData = countriesData;
    filteredCountry = countriesData;
    isLoading = false;
    notifyListeners();

    return countriesData;
  }

//fun to filter the countries by alphabetical order
  void filterCountry() {
    isFilter = !isFilter;

    if (isFilter) {
      filteredCountry = List.from(countriesData)
        ..sort((a, b) => a.commonName.compareTo(b.commonName));
      Fluttertoast.showToast(msg: 'sorted by name');
    } else {
      // Resetting to the original unsorted list
      filteredCountry = List.from(countriesData);
      Fluttertoast.showToast(msg: 'unsorted');
    }
    notifyListeners();
  }
}
