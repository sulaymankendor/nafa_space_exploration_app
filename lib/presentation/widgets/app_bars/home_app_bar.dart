import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Use 'final' for properties that won't change after construction.
  final String leadingText;
  final List<Widget> actions;

  const HomeAppBar({Key? key, required this.leadingText, required this.actions})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      // The background color for your app bar
      color: Colors.transparent,
      // Ensure content doesn't overlap with the system status bar
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            // Position children at the ends of the row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // The leading text, using the passed-in 'leadingText' parameter
              Text(
                leadingText,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              // A row to hold the action widgets
              Row(children: actions),
            ],
          ),
        ),
      ),
    );
  }
}
