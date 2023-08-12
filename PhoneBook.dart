import 'Contact.dart';
import 'Group.dart';
import 'Phone.dart';

class PhoneBook {
  List<Group> _groups;
  List<Contact> _contacts;
  static int lastContactID = 0;

  PhoneBook({List<Group>? groups, List<Contact>? contacts})
      : _groups = groups ?? [],
        _contacts = contacts ?? [] {
    _contacts.length > 0
        ? lastContactID = _contacts[_contacts.length - 1].id!
        : lastContactID = 0;
  }

  set groups(List<Group>? groups) => _groups = groups ?? [];
  set contacts(List<Contact>? contacts) => _contacts = contacts ?? [];

  List<Group> get groups => _groups;
  List<Contact> get contacts => _contacts;

  //Contact Methodes
  bool addContact(String firstName, String lastName, List<Phone> phones) {
    lastContactID++;
    Contact newContact = Contact(
        id: lastContactID,
        firstName: firstName,
        lastName: lastName,
        phones: phones);
    if (_contacts.any((element) => element == newContact)) {
      return false;
    }
    _contacts.add(newContact);
    return true;
  }

  bool editContact(int oldContactID, String? firstName, String? lastName,
      List<Phone>? phones) {
    int index = _contacts.indexWhere((element) => element.id == oldContactID);
    if (index == -1) {
      return false;
    }
    if (firstName != null) {
      _contacts[index].firstName = firstName;
    }
    if (lastName != null) {
      _contacts[index].lastName = lastName;
    }
    if (phones != null) {
      _contacts[index].phones = phones;
    }
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

  Contact getWithID(int id) {
    return _contacts.firstWhere((element) => element.id == id);
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
