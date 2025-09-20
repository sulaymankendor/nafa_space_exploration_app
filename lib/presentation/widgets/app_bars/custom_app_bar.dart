import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/core/utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered title
            SizedBox(
              height: kToolbarHeight,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            // Left-aligned back button
            Positioned(
              left: 10,
              child: Container(
                height: kToolbarHeight,
                width:
                    kToolbarHeight, // Use kToolbarHeight for a perfect circle

                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
