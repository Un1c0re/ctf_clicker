import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({super.key});

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
          Image.asset('assets/images/flag.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Capture the flag!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text('Стоит: 1 000 000'),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('купить!'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
