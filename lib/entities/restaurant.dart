class Restaurant {
  final String _name;
  final String _description;
  final List<String> _images;
  final double _rating;
  final int _count;
  final double latitude;
  final double longitude;

  Restaurant(
    this._name,
    this._description,
    this._images,
    this._rating,
    this._count,
    this.latitude,
    this.longitude,
  );
  String get name => _name;

  String get description => _description;

  List<String> get images => _images;

  double get rating => _rating;
  int get count => _count;
}
