class Flag {
  String flag;
  final int price;
  final String path;

  Flag({
    required this.flag,
    required this.price,
    required this.path,
  });

  Flag.defaultFlag()
      : flag = '',
        price = 1000000,
        path = 'assets/images/flag.png';

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
        flag: json['flag'], price: 1000000, path: 'assets/images/flag.png');
  }
}
