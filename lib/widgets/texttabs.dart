import 'package:flutter/material.dart';

class TextTabs extends StatelessWidget {
  final String title;
  final bool isChosen;
  const TextTabs({
    Key key, this.title, this.isChosen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(title, 
              style: TextStyle(fontSize: 20,color: isChosen ? Color(0xFF79C6D0) : Colors.black26,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 5.0,
              ),
            CircleAvatar(
              backgroundColor: isChosen ? Color(0xFF79C6D0) : Colors.black26.withOpacity(0),
              radius: 3,
            )
          ],
        )
      ],
    );
  }
}