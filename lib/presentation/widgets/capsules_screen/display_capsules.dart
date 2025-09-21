import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/providers/capsule_provider.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/capsules_screen/capsule_card.dart';
import 'package:provider/provider.dart';

class DisplayCapsule extends StatefulWidget {
  @override
  State<DisplayCapsule> createState() => _DisplayCapsule();
}

class _DisplayCapsule extends State<DisplayCapsule> {
  @override
  void initState() {
    super.initState();
    // Fetch capsules when the widget loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CapsuleProvider>().fetchCapsulesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CapsuleProvider>(
      builder: (context, capsuleProvider, child) {
        print('isLoading ${capsuleProvider.isLoading}');

        if (capsuleProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (capsuleProvider.error != null) {
          return Center(
            child: Text(
              'Error: ${capsuleProvider.error}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        }

        // Handle the case where the list is null or empty due to no network.
        if (capsuleProvider.capsule == null ||
            capsuleProvider.capsule!.isEmpty) {
          return const Center(
            child: Text(
              'No capsules found. Please check your network connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            width: containersMediaQuery(context),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView.builder(
              itemCount: capsuleProvider.capsule!.length,
              itemBuilder: (context, index) {
                final capsule = capsuleProvider.capsule![index];
                return CapsuleCard(
                  type: capsule['type'],
                  status: capsule['status'],
                );
              },
            ),
          );
        } else {
          return Center(
            child: Container(
              width: containersMediaQuery(context),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView.builder(
                itemCount: capsuleProvider.capsule!.length,
                itemBuilder: (context, index) {
                  final capsule = capsuleProvider.capsule![index];
                  return CapsuleCard(
                    type: capsule['type'],
                    status: capsule['status'],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
