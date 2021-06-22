import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNoDataWidget extends StatelessWidget {
  const CustomNoDataWidget({
    Key? key,
    this.label,
    this.padding = const EdgeInsets.all(8.0),
    this.borderRadius = BorderRadius.zero,
    required this.onTap,
  }) : super(key: key);

  final String? label;
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
                Icons.file_copy_outlined,
                size: 42,
                color: Colors.black38,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                label ?? '${tr('widgets.no_data')}',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${tr('widgets.tap_for_refresh')}',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black38,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
