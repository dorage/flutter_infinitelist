import 'package:flutter/material.dart';

class RoundNavigationButton extends StatelessWidget {
  final Function onPressed;
  final List<Widget> children;

  const RoundNavigationButton({
    Key key,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 150,
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
