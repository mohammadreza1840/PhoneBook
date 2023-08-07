import 'Contact.dart';
import 'Group.dart';

class PhoneBook {
  List<Group> _groups;
  List<Contact> _contacts;

  PhoneBook({List<Group>? groups, List<Contact>? contacts})
      : _groups = groups ?? [],
        _contacts = contacts ?? [];

  set groups(List<Group>? groups) => _groups = groups ?? [];
  set contacts(List<Contact>? contacts) => _contacts = contacts ?? [];

  List<Group> get groups => _groups;
  List<Contact> get contacts => _contacts;

  //Contact Methodes
  bool addContact(Contact newContact) {
    if (_contacts.any((element) => element == newContact)) {
      return false;
    }
    _contacts.add(newContact);
    return true;
  }

  bool editContact(int oldContactID, Contact newContact) {
    int index = _contacts.indexWhere((element) => element.id == oldContactID);
    if (index == -1) {
      return false;
    }
    _contacts[index] = newContact;
    return true;
    // if (!_contacts.any((element) => element.id == oldContactID)) {
    //   return false;
    // }
    // int index = _contacts.indexWhere((element) => element.id == oldContactID);
    // _contacts[index] = newContact;
    // return true;
  }

  bool deleteContact(int contactID) {
    int index = _contacts.indexWhere((element) => element.id == contactID);
    if (index == -1) {
      return false;
    }
    _contacts.removeAt(index);
    return true;
  }

  List<Contact> showAllContacts() {
    return _contacts;
  }

  List<Contact> search(String input) {
    return _contacts
        .where((element) =>
            element.firstName.contains(input) ||
            element.lastName!.contains(input) ||
            element.phones.any((element) => element.phone.contains(input)))
        .toList();
  }

  //Group Methodes
  bool addGroup(Group newGroup) {
    if (_groups.any((element) => element == newGroup)) {
      return false;
    }
    _groups.add(newGroup);
    return true;
  }

  bool editGroup(int groupID, Group newGroup) {
    int index = _groups.indexWhere((element) => element.id == groupID);
    if (index == -1) {
      return false;
    }
    _groups[index] = newGroup;
    return true;
  }

  bool deleteGroup(int groupID) {
    int index = _groups.indexWhere((element) => element.id == groupID);
    if (index == -1) {
      return false;
    }
    _groups.removeAt(index);
    return true;
  }

  List<Group> showAllGroups() {
    return _groups;
  }
}
