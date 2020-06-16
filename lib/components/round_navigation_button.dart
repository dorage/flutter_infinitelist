import 'package:flutter/material.dart';

class RoundNavigationButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final double height;

  const RoundNavigationButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.height = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(height / 15),
        ),
        child: child,
      ),
    );
  }
}
