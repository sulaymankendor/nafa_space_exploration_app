import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';

class RocketDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Falcon 1'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/rockets.jpg',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueAccent.withOpacity(0.1),
                          ),
                          child: Text(
                            '20 march 2025',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
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
                            'SpaceX',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            'Republic of the Marshall Islands',
                            style: Theme.of(context).textTheme.bodyMedium,
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
                          Column(
                            spacing: 20,

                            children: [
                              _statItem(context, 'Payload Weight', '200kg'),
                              _statItem(context, 'Rocket Mass', '146 kg'),
                            ],
                          ),
                          Column(
                            spacing: 20,

                            children: [
                              _statItem(context, 'Rocket Mass', '146 kg'),
                              _statItem(context, 'Rocket Mass', '146 kg'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'The Falcon 1 was an expendable launch jasdjhas dfashdkjfhkjas hdkjfhkjsadkfkjas hdkjfkdfasfdkjadsjfhsadfasd asdhfakjdsfkhaskdfsystem privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.',
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

Widget _statItem(BuildContext context, String title, String stat) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
      ),
      Text(
        stat,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    ],
  );
}
