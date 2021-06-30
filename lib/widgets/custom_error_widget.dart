import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    required this.onTap,
  }) : super(key: key);

  final EdgeInsets padding;
  final Function onTap;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () => onTap(),
      child: Padding(
        padding: padding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error,
                size: 32,
                color: Color(0xFFDB5A5A),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                tr('errors.tap_for_refresh'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDB5A5A),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
