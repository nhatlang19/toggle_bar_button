import 'package:flutter/material.dart';

class ToggleBarButton extends StatefulWidget {
  @required
  final List<String> tabItems;
  @required
  final List<Widget> tabContentItems;
  final int index;
  final Color backgroundColor;
  final Color textColor;
  final Color selectedBackgroundColor;
  final Color selectedTextColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;

  const ToggleBarButton(
      {Key key,
      this.tabItems,
      this.tabContentItems,
      this.index,
      this.backgroundColor,
      this.textColor,
      this.selectedBackgroundColor,
      this.selectedTextColor,
      this.borderColor,
      this.borderWidth,
      this.radius})
      : super(key: key);

  @override
  ToggleBarButtonState createState() => ToggleBarButtonState();
}

class ToggleBarButtonState extends State<ToggleBarButton> {
  int _index = 0;
  Color _backgroundColor;
  Color _textColor;
  Color _selectedBackgroundColor;
  Color _selectedTextColor;
  Color _borderColor;
  double _borderWidth;
  double _radius;

  @override
  void initState() {
    setState(() {
      _index = widget.index ?? 0;
      _backgroundColor =
          widget.backgroundColor ?? ThemeData.dark().primaryColor;
      _textColor = widget.textColor ?? Colors.amber[800];

      _selectedBackgroundColor =
          widget.selectedBackgroundColor ?? Colors.amber[800];
      _selectedTextColor =
          widget.selectedTextColor ?? ThemeData.dark().primaryColor;

      _borderColor = widget.borderColor ?? Colors.amber[800];
      _borderWidth = widget.borderWidth ?? 1.0;
      _radius = widget.radius ?? 10.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new SafeArea(
            child: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        this.header(),
        Expanded(child: widget.tabContentItems.elementAt(_index))
      ],
    )));
  }

  Widget header() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[] + createTabItems(),
        ));
  }

  List<Widget> createTabItems() {
    List<Widget> widgets = List();
    widget.tabItems.forEach((item) {
      return widgets.add(Expanded(
          child: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  _index = widget.tabItems.indexOf(item);
                });
              },
              child: createItem(item))));
    });

    return widgets;
  }

  Widget createItem(String item) {
    int index = widget.tabItems.indexOf(item);
    return Container(
        decoration: getBoxDecorationItem(index),
        padding: EdgeInsets.only(top: 6, bottom: 6),
        child: Center(
            child: Text(
          item,
          style: TextStyle(color: getItemTextColor(index), fontSize: 13),
        )));
  }

  Color getItemTextColor(int index) {
    if (index == _index) {
      return this._selectedTextColor;
    }

    return this._textColor;
  }

  Color getItemBackgroundColor(int index) {
    if (index == _index) {
      return this._selectedBackgroundColor;
    }

    return this._backgroundColor;
  }

  BoxDecoration getBoxDecorationItem(int index) {
    if (index == 0) {
      return BoxDecoration(
          color: getItemBackgroundColor(index),
          border: Border.all(
            color: this._borderColor,
          ),
          borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(this._radius),
              bottomLeft: Radius.circular(this._radius)));
    } else if (index == 1) {
      return BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: this._borderWidth, color: this._borderColor),
              bottom: BorderSide(
                  width: this._borderWidth, color: this._borderColor)),
          color: getItemBackgroundColor(index));
    } else if (index == widget.tabItems.length - 1) {
      return BoxDecoration(
          color: getItemBackgroundColor(index),
          border: Border.all(
            color: Colors.amber[800],
          ),
          borderRadius: new BorderRadius.only(
              topRight: Radius.circular(this._radius),
              bottomRight: Radius.circular(this._radius)));
    }

    return BoxDecoration(
        border: Border(
            left:
                BorderSide(width: this._borderWidth, color: this._borderColor),
            top: BorderSide(width: this._borderWidth, color: this._borderColor),
            bottom:
                BorderSide(width: this._borderWidth, color: this._borderColor)),
        color: getItemBackgroundColor(index));
  }
}
