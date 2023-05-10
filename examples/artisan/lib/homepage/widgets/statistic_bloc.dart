import 'package:flutter/material.dart';

class StatisticBloc extends StatelessWidget {
  const StatisticBloc({Key? key, required this.items}) : super(key: key);
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: items,
      ),
    );
  }
}
