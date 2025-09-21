import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/presentation/widgets/reusables/like_button.dart';

class RocketDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic rocket = Get.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: CustomAppBar(title: rocket['name']),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: screenWidth(context) < maxMobileScreenWidth
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: containersMediaQuery(context),

                      child: Image.asset(
                        'assets/images/rockets.jpg',
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),

                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rocket['company'],
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge,
                                    ),
                                    Text(
                                      // 'Republic of the Marshall Islands',
                                      rocket['country'],
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              LikeButton(),
                            ],
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  spacing: 20,

                                  children: [
                                    _statItem(
                                      context,
                                      'Payload Weight',
                                      rocket['payload_weights'][0]['kg']
                                              .toString() +
                                          'kg',
                                    ),
                                    _statItem(
                                      context,
                                      'Rocket Mass',
                                      rocket['mass']['kg'].toString() + 'kg',
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 20,

                                  children: [
                                    _statItem(
                                      context,
                                      'Success Rate',
                                      '${rocket['success_rate_pct']}%',
                                    ),
                                    _statItem(
                                      context,
                                      'Rocket Mass',
                                      '${rocket['diameter']['meters']}m',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: containersMediaQuery(context),

                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                Text(
                                  rocket['description'],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                          'assets/images/rockets.jpg',
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: screenWidth(context) < maxTabletScreenWidth
                            ? EdgeInsets.all(20)
                            : EdgeInsets.only(top: 20, bottom: 20),

                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenDetailsWidthMediaQuery(context),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rocket['company'],
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineLarge,
                                        ),
                                        Text(
                                          // 'Republic of the Marshall Islands',
                                          rocket['country'],
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  LikeButton(),
                                ],
                              ),
                            ),
                            Container(
                              width: screenDetailsStatWidthMediaQuery(context),
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
                                  Column(
                                    spacing: 20,

                                    children: [
                                      _statItem(
                                        context,
                                        'Payload Weight',
                                        rocket['payload_weights'][0]['kg']
                                                .toString() +
                                            'kg',
                                      ),
                                      _statItem(
                                        context,
                                        'Rocket Mass',
                                        rocket['mass']['kg'].toString() + 'kg',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    spacing: 20,

                                    children: [
                                      _statItem(
                                        context,
                                        'Success Rate',
                                        '${rocket['success_rate_pct']}%',
                                      ),
                                      _statItem(
                                        context,
                                        'Rocket Mass',
                                        '${rocket['diameter']['meters']}m',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: screenDetailsWidthMediaQuery(context),

                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                  Text(
                                    rocket['description'],
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
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _statItem(BuildContext context, String title, String stat) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          stat,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
