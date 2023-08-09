import 'Phone.dart';

class Contact {
  String _firstName;
  String? _lastName;
  int? _id;
  List<Phone> _phones;
  List<int> _groups;

  Contact(
      {int? id,
      required String firstName,
      String? lastName,
      required List<Phone> phones,
      List<int>? groups})
      : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        /* _phones = phones == null ? []:phones, */
        _phones = phones,
        _groups = groups ?? [];

  set firstName(firstName) => _firstName = firstName;
  set lastName(lastName) => _lastName = lastName;
  set phones(phones) => _phones = phones;
  set groups(groups) => _groups = groups;

  String get firstName => _firstName;
  String? get lastName => _lastName;
  int? get id => _id;
  
  List<Phone> get phones => _phones;
  List<int> get groups => _groups;

  bool addGroup(int groupID) {
    if (_groups.any((element) => element == groupID)) {
      return false;
    } else {
      _groups.add(groupID);
      return true;
    }
  }

  bool deleteGroup(int groupID) {
    return _groups.remove(groupID);
  }
}
