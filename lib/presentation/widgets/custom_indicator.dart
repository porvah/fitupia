import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final int size;

  const CustomIndicator({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 10,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.only(left: 8.0),
              width: SizeConfig.getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: (index) < size ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}
