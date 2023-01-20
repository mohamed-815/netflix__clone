import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class searchTextTitle extends StatelessWidget {
  final String title;
  const searchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: kWhitecolor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
