import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage(this.title, this.description, this.image, this.price);

  final String title;
  final String description;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(children: [
          (ListView(
            children: [
              Image.asset(
                "assets/images/${image}",
                scale: 0.5,
              ),
              Text(description, style: const TextStyle(fontSize: 25))
            ],
          )),
          Positioned(
              bottom: 8,
              left: 16,
              width: MediaQuery.of(context).size.width - 32,
              child: Card(
                child: Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Цена: $price ₽",
                        style:
                            const TextStyle(fontSize: 26, color: Colors.black),
                      ),
                    )),
              ))
        ]));
  }
}
