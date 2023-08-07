class Group {
  int _id;
  String _name;
  List<int> _contacts;

  Group({required int id, required String name, List<int>? contacts})
      : _id = id,
        _name = name,
        _contacts = contacts ?? [];

  set name(String name) => _name = name;
  set contacts(List<int>? contacts) => _contacts = contacts ?? [];

  int get id => _id;
  String get name => _name;
  List<int> get contacts => _contacts;

  bool addContact(int contactID) {
    if (_contacts.any((element) => element == contactID)) {
      return false;
    } else {
      _contacts.add(contactID);
      return true;
    }
  }

  bool deleteContact(int contactID) {
    return _contacts.remove(contactID);
  }
}
