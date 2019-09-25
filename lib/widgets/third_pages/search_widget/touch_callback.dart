import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isfeed;
  final Color background;

  const TouchCallBack(
      {Key key, this.onPressed, this.isfeed, this.background, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TouchCallBackState();
  }
}

class TouchCallBackState extends State<TouchCallBack> {

  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        color:color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isfeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
