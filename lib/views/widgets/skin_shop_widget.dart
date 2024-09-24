import 'dart:ui';

import 'package:ctf_clicker/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/skin_model.dart';

class SkinShopWidget extends StatelessWidget {
  final Skin skin;

  const SkinShopWidget({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(skin.path, height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skin.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text('Добавляет +${skin.tapValue}'),
                  Text('Стоит: ${skin.price}'),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('купить!'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
