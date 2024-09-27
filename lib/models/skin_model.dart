class Skin {
  final String path;
  final String name;
  final int price;
  final double tapValue;

  Skin({
    required this.path,
    required this.name,
    required this.price,
    required this.tapValue,
  });

  Skin.defaultSkin()
      : path = 'assets/images/emoji/default.png',
        name = 'default dude',
        price = 0,
        tapValue = 0.1;
}
