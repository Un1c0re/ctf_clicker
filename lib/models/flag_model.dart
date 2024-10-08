class Flag {
  final String value;
  final int price;
  final String path;

  Flag({
    required this.value,
    required this.price,
    required this.path,
  });

  Flag.defaultFlag()
      : value = '',
        price = 1000000,
        path = 'assets/images/flag.png';
}
