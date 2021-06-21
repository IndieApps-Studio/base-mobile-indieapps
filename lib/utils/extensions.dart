import 'package:flutter/widgets.dart';

extension UtilExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screen => mediaQuery.size;
}

extension StringExtension on String {
  String get capitalize {
    if (this.isEmpty) {
      return '-';
    }
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }

  String get replaceDash {
    if (this.isEmpty) {
      return '-';
    }

    return this.replaceAll('-', ' ');
  }

  String get removeFirstBackSlash {
    if (this.isEmpty) {
      return '-';
    } else if (this[0] == '/') return this.replaceFirst('/', '');

    return this;
  }

  String get replaceBackSlash {
    if (this.isEmpty) {
      return '-';
    }

    return this.replaceAll('/', ' ');
  }

  String get capitalizeFirstOfEach {
    if (this.isEmpty) {
      return '-';
    }
    return this.split(" ").map((str) => str.toLowerCase().capitalize).join(" ");
  }

  String get emptyNumber {
    if (this.isEmpty) {
      return '0';
    }

    return this;
  }
}
