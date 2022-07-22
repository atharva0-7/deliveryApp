import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: FittedBox(
        child: Row(children: const [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(Icons.star_border),
          Icon(Icons.star_border)
        ]),
      ),
    );
  }
}
