import 'package:flutter/material.dart';

class ItemOverview extends StatelessWidget {
  final String? image;
  final String name;
  final String? routeName;
  const ItemOverview(
      {Key? key, required this.name, required this.image, this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridTile(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(image!),
                ),
              ),
            ),
            Text(name),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(routeName!);
      },
    );
  }
}
