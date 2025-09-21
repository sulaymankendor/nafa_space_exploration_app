import 'package:flutter/material.dart';

double screenWidth(context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}

int maxMobileScreenWidth = 600;
int maxTabletScreenWidth = 1024;
int minDesktopScreenWidth = 1025;

double containersMediaQuery(context) {
  double width = screenWidth(context);

  if (width <= maxMobileScreenWidth) {
    return width;
  } else {
    return width * 0.7;
  }
}

double homeNavSectionMediaQuery(context) {
  double width = screenWidth(context);

  if (width <= maxMobileScreenWidth) {
    return width;
  } else if (width <= maxTabletScreenWidth) {
    return width * 0.7;
  } else {
    return width * 0.45;
  }
}

double textContainerScreenWidth(context) {
  double width = screenWidth(context);
  if (width <= maxMobileScreenWidth) {
    return width * 0.7;
  } else if (width <= maxTabletScreenWidth) {
    return width * 0.4;
  } else {
    return width * 0.5;
  }
}

double screenDetailsWidthMediaQuery(context) {
  double width = screenWidth(context);
  if (width <= maxTabletScreenWidth) {
    return width;
  } else {
    return width * 0.5;
  }
}

double screenDetailsStatWidthMediaQuery(context) {
  double width = screenWidth(context);
  if (width <= maxMobileScreenWidth) {
    return width;
  } else if (width <= maxTabletScreenWidth) {
    return width * 0.6;
  } else {
    return width * 0.5;
  }
}

double searchBarWidthMediaQuery(context) {
  double width = screenWidth(context);
  if (width <= maxMobileScreenWidth) {
    return width;
  } else {
    return width * 0.5;
  }
}
