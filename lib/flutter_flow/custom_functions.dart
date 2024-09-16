import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

dynamic filterCoins(List<dynamic> responseData) {
  List<String> desiredCoins = [
    'Bitcoin',
    "Ethereum",
    // "Shiba Inu",
    // "Terra Classic",
    "Solana",
    "BNB",
    "XRP"
  ];

  List<dynamic> filteredData = responseData
      .where((entry) => desiredCoins.contains(entry['name']))
      .toList();

  return filteredData;
}

String convertDate(String dateString) {
  // Split the date string by spaces
  List<String> parts = dateString.split(' ');

  // Extract the time part
  String timePart = parts[4];

  // Return the time part
  return timePart;
}

List<String>? convertDateJsonList(List<dynamic> jsonList) {
  List<String> formattedDates = [];

  for (var jsonMap in jsonList) {
    if (jsonMap is Map<String, dynamic>) {
      // Iterate over the values of the current map
      String? utcDateString;
      for (var value in jsonMap.values) {
        // Check if the value is a string
        if (value is String) {
          // Assign the string value to utcDateString
          utcDateString = value;
          // Exit the loop after finding the first string value
          break;
        }
      }

      if (utcDateString != null) {
        try {
          // Parse the UTC date string
          // DateTime utcDate =
          //     DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(utcDateString);
          DateTime utcDate = DateTime.parse(utcDateString);

          // Convert to local timezone
          DateTime localDate = utcDate.toLocal();

          // Format the date as needed
          // String formattedDate =
          //     DateFormat("yyyy-MM-dd HH:mm:ss").format(localDate);
          String formattedTime =
              DateFormat("yyyy-MM-dd hh:mm:ss a").format(localDate);

          formattedDates.add(formattedTime);
        } catch (e) {
          print("Error converting date: $e");
        }
      } else {
        print("Error: Date string not found in the map.");
      }
    } else {
      print("Error: Input is not a map.");
    }
  }

  //   // Parse the input UTC time string
  // DateTime utcDateTime = DateTime.parse(utcTime);

  // // Convert the UTC time to the desired time zone (e.g., Eastern Time)
  // DateTime usDateTime = utcDateTime.toLocal();

  // // Format the DateTime object to the desired string format
  // String formattedTime = DateFormat("yyyy-MM-dd hh:mm:ss a").format(usDateTime);

  return formattedDates.isNotEmpty ? formattedDates : null;
}

dynamic convertDateJson(dynamic jsonMap) {
// Iterate over the values of the first map
  String? utcDateString;
  for (var value in jsonMap.values) {
    // Check if the value is a string
    if (value is String) {
      // Assign the string value to utcDateString
      utcDateString = value;
      // Exit the loop after finding the first string value
      break;
    }
  }

  if (utcDateString != null) {
    try {
      // Parse the UTC date string
      DateTime utcDate =
          DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(utcDateString);

      // Convert to US timezone (Eastern Time)
      DateTime usDate = utcDate.toLocal();

      // Format the date as needed
      String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(usDate);

      return formattedDate;
    } catch (e) {
      print("Error converting date: $e");
      return null; // Return null if an error occurs during parsing/conversion
    }
  } else {
    print("Error: Date string not found in the first map.");
    return null; // Return null if the date string is not found
  }
}

String? convertToUs(String utcTime) {
  // Parse the input UTC time string
  DateTime utcDateTime = DateTime.parse(utcTime);

  // Convert the UTC time to the desired time zone (e.g., Eastern Time)
  DateTime usDateTime = utcDateTime.toLocal();

  // Format the DateTime object to the desired string format
  String formattedTime = DateFormat("yyyy-MM-dd hh:mm:ss a").format(usDateTime);

  return formattedTime;
}

String formatDoublePrice(double value) {
  if (value >= 1) {
    // For values >= 1, show two decimal places
    return value.toStringAsFixed(2);
  } else {
    // For values < 1, show up to four significant digits after the decimal point
    // Convert to string to properly handle scientific notation for very small values
    String result = value.toStringAsPrecision(5);

    // Remove trailing zeros after the decimal point
    if (result.contains(".") && result.indexOf(".") < result.length - 1) {
      result = result.replaceAll(RegExp(r"0*$"), "");
    }

    return result;
  }
}

dynamic filterCoinsShibaLunc(List<dynamic> responseData) {
  List<String> desiredCoins = [
    // 'Bitcoin',
    // "Ethereum",
    "Shiba Inu",
    "Terra Classic",
    // "Solana",
    // "BNB",
    // "XRP"
  ];

  List<dynamic> filteredData = responseData
      .where((entry) => desiredCoins.contains(entry['name']))
      .toList();

  return filteredData;
}

List<double> createListFromTwoVariable(
  double var1,
  double var2,
) {
  List<double> mergedList = [];

  mergedList.add(var1);
  mergedList.add(var2);

  return mergedList;
}
