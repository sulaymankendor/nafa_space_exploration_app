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
        if (capsuleProvider.isLoading) {
          return Container(
            height: 200, // Give it explicit height
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (capsuleProvider.error != null) {
          return Container(
            height: 200,
            child: Center(
              child: Text(
                'Error: ${capsuleProvider.error}',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (capsuleProvider.capsule == null ||
            capsuleProvider.capsule!.isEmpty) {
          return Container(
            height: 200,
            child: Center(child: Text('No capsules found')),
          );
        }

        // Test with a simple list first
        // Test with a simple list first
        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            width: containersMediaQuery(context),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Expanded(
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
        } else {
          return Expanded(
            child: Center(
              child: Container(
                width: containersMediaQuery(context),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Expanded(
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
              ),
            ),
          );
        }
      },
    );
  }
}
