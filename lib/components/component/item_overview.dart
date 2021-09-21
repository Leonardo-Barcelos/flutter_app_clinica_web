import 'package:flutter/material.dart';

class ItemOverview extends StatelessWidget {
  final Icon? icon;
  final String name;
  const ItemOverview({
    Key? key,
    required this.name,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Image(
                image: AssetImage('assets/user_image.png'),
              ),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}
