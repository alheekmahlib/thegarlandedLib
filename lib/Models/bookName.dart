class BookName{
  int _id;
  String _title;
  String _bookQuoted;
  String _aboutBook;
  String _bookD;

  BookName(dynamic obj){
    _id = obj['id'];
    _title = obj['title'];
    _bookQuoted = obj['bookQuoted'];
    _aboutBook = obj['aboutBook'];
    _bookD = obj['bookD'];
  }
  BookName.fromMap(Map<String, dynamic> data){
    _id = data['id'];
    _title = data['title'];
    _bookQuoted = data['bookQuoted'];
    _aboutBook = data['aboutBook'];
    _bookD = data['bookD'];
  }
  Map<String, dynamic> toMap() => {
    'id' : _id, 'title': _title,'bookQuoted' : _bookQuoted,'aboutBook':_aboutBook, 'bookD' : _bookD};
  int get id => _id;
  String get title => _title;
  String get bookQuoted => _bookQuoted;
  String get aboutBook => _aboutBook;
  String get bookD => _bookD;
}






