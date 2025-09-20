import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';

class LaunchDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FalconSat'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/launches.png',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Get.toNamed('/rocketDetails');
                            print('liked');
                          },
                          icon: Icon(Icons.favorite, size: 32),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Falcon 1',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _statItem(context, Icons.rocket_launch, 'rocket'),
                          _statItem(context, Icons.timelapse, '12:20pm'),
                          _statItem(context, Icons.date_range_sharp, '2023'),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'The Falcon 1 was an expendable launch jasdjhas dfashdkjfhkjas hdkjfhkjsadkfkjas hdkjfkdfasfdkjadsjfhsadfasd asdhfakjdsfkhaskdfsystem privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.The Falcon 1 was an expendable launch jasdjhas dfashdkjfhkjas hdkjfhkjsadkfkjas hdkjfkdfasfdkjadsjfhsadfasd asdhfakjdsfkhaskdfsystem privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.The Falcon 1 was an expendable launch jasdjhas dfashdkjfhkjas hdkjfhkjsadkfkjas hdkjfkdfasfdkjadsjfhsadfasd asdhfakjdsfkhaskdfsystem privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _statItem(BuildContext context, IconData icon, String stat) {
  return Column(
    spacing: 5,
    children: [
      Icon(icon, color: Colors.blueAccent),

      Text(
        stat,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
