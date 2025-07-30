
import 'package:flutter/material.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class SectionName extends StatelessWidget {
  const SectionName({
    super.key, required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: AppText.style18w400(context),
        ),
      );
  }
}
