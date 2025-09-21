import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/presentation/utils/fotmatDate.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';

class LaunchDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic launch = Get.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: CustomAppBar(title: 'FalconSat'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: screenWidth(context) < maxMobileScreenWidth
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: containersMediaQuery(context),
                      child: Image.asset(
                        'assets/images/launches.png',
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: containersMediaQuery(context),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: 10, right: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue.withOpacity(0.4),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent.withOpacity(0.1),
                            ),
                            child: Text(
                              formatLaunchDate(launch['launch_date_local']),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              print('asd');
                            },
                            icon: Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),

                      child: Container(
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    launch['rocket']['rocket_name'] ??
                                        'Name was not provided',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineLarge,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: containersMediaQuery(context),

                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _statItem(
                                    context,
                                    Icons.rocket_launch,
                                    launch['rocket']['rocket_type'] ?? 'N/A',
                                  ),
                                  _statItem(
                                    context,
                                    Icons.timelapse,
                                    formatLaunchDate(
                                      launch['launch_date_local'],
                                    ),
                                  ),
                                  _statItem(
                                    context,
                                    Icons.date_range_sharp,
                                    launch['launch_year'] ?? 'N/A',
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: containersMediaQuery(context),
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Details',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                  Text(
                                    launch['details'] ??
                                        'Details was not Provided',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenDetailsWidthMediaQuery(context),

                        child: Image.asset(
                          'assets/images/launches.png',
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: screenDetailsWidthMediaQuery(context),
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue.withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blueAccent.withOpacity(0.1),
                              ),
                              child: Text(
                                formatLaunchDate(launch['launch_date_local']),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),

                        child: Container(
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      launch['rocket']['rocket_name'] ??
                                          'Name was not provided',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: screenDetailsStatWidthMediaQuery(
                                  context,
                                ),

                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue.withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blueAccent.withOpacity(0.1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _statItem(
                                      context,
                                      Icons.rocket_launch,
                                      launch['rocket']['rocket_type'] ?? 'N/A',
                                    ),
                                    _statItem(
                                      context,
                                      Icons.timelapse,
                                      formatLaunchDate(
                                            launch['launch_date_local'],
                                          ) ??
                                          'N/A',
                                    ),
                                    _statItem(
                                      context,
                                      Icons.date_range_sharp,
                                      launch['launch_year'] ?? 'N/A',
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: screenDetailsWidthMediaQuery(context),
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Details',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                    ),
                                    Text(
                                      launch['details'] ??
                                          'Details was not Provided',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
