import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import '../app_style.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;

  const CustomExpandableText({super.key, required this.text});

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: AppStyle.mainTitle,
        ),
        const SizedBox(height: 10),
        ExpandableText(
          widget.text,
          expandText: 'read all',
          collapseText: 'read less',
          maxLines: 8,
          linkColor: Colors.blue,
          animation: true,
          collapseOnTextTap: true,
          style: AppStyle.mainContent,
        )
      ],
    );
  }
}
