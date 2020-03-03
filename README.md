# toggle_bar_button

[![pub package](https://img.shields.io/pub/v/toggle_bar.svg)](https://pub.dartlang.org/packages/toggle_bar_button)

A dart package to display a horizontal bar of customisable toggle tabs. Supports iOS and Android.

## Installation
Depend on it.
``` dart
dependencies:
  toggle_bar_button: ^1.0.0
```

## Usage
``` yaml
import 'package:toggle_bar_button/toggle_bar_button.dart';

ToggleBarButton(
    tabItems: ["Apples", 'Bananas', 'Oranges', 'Papayas'],
    tabContentItems: <Widget>[
        Center(child: Text('Apples')),
        Center(child: Text('Bananas')),
        Center(child: Text('Oranges')),
        Center(child: Text('Papayas')),
    ],
)
```

## Parameters
```dart 
@required final List<String> tabItems;
@required final List<Widget> tabContentItems;
final int index;
final Color backgroundColor;
final Color textColor;
final Color selectedBackgroundColor;
final Color selectedTextColor;
final Color borderColor;
final double borderWidth;
final double radius;