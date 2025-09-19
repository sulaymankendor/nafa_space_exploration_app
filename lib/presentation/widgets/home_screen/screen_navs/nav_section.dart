import 'package:flutter/material.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/screen_navs/nav.dart';

class NavSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Nav(), Nav(), Nav()],
      ),
    );
  }
}
