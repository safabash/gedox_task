import 'package:flutter/material.dart';
import 'package:gedox_task/view/widgets/button_widget.dart';

Widget listItem(String img, String movieName) {
  return SizedBox(
    width: 240.0,
    height: 300.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 280.0,
          width: 180.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: const [
            Button_widget(text: '18+', fontSize: 12),
            Button_widget(text: 'Action', fontSize: 12),
            Button_widget(text: '5.0', fontSize: 12)
          ],
        ),
        const SizedBox(height: 1),
        Center(
          child: Text(
            movieName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ),
  );
}
