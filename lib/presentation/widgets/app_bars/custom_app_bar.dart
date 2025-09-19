import 'package:flutter/material.dart';

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
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Left-aligned back button
            Positioned(
              left: 10,
              child: SizedBox(
                height: kToolbarHeight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
