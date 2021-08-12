import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    @required this.text,
    @required this.icon,
    this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override 
  Widget build(BuildContext context)
  {
    return Padding(padding: EdgeInsets.all(20),
    child: FlatButton(
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blue,
      onPressed: press,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: Color(0xFFFF7643),
            width: 22,
          ),
          SizedBox(width: 20),
          Expanded(child: Text(text)),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
    );
  }
}