import 'package:flutter/material.dart';

class LandPadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 25, 34, 49),
      ),

      child: Row(
        spacing: 15,

        children: [
          Icon(Icons.landscape_sharp, size: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Earth',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 200, //to be changed to relative the screen
                child: Text(
                  'Jakdjf ajds lfal dslf jalkds flads lkflak dsfjowej a defd',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
