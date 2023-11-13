import 'package:flutter/material.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';
import 'package:syoftassignment/entities/person_entity.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.personEntity,
  });
  final PersonEntity personEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(226, 91, 92, 1),
        title: const Text('User Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndValueWidget(
                title: 'First Name',
                value: personEntity.firstName ?? '-',
              ),
              TitleAndValueWidget(
                title: 'Last Name',
                value: personEntity.lastName ?? '-',
              ),
              TitleAndValueWidget(
                title: 'Email',
                value: personEntity.email ?? '-',
              ),
              TitleAndValueWidget(
                title: 'Phone',
                value: personEntity.phone ?? '-',
              ),
              TitleAndValueWidget(
                title: 'City',
                value: personEntity.city ?? '-',
              ),
              TitleAndValueWidget(
                title: 'ZIp Code',
                value: personEntity.zipCode ?? '-',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndValueWidget extends StatelessWidget {
  const TitleAndValueWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyleConstants.s20WBcBlack,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyleConstants.s20WBcBlack,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
