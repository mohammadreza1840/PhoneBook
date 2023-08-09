import 'dart:io';

import 'Contact.dart';
import 'Phone.dart';
import 'PhoneBook.dart';

void main(List<String> args) {
  print('''
Wellcome To PhoneBook:
1- Show All Contacts
2- Add Contact
3- Delete Contact
4- Edit Contact
5- Add Group
6- Add Group to Contact
7- Delete Group
8- Delete Group From Contact
9- Edit Group
10- Show All Groups
11- Search in Contacts
0- Exit.

Enter The Select:''');
  int choice = int.parse(stdin.readLineSync()!);
  PhoneBook book = PhoneBook();
  while (choice != 0) {
    switch (choice) {
      case 1: //Show All Contacts
        showAllContacts(book);
        break;
      case 2: //Add Contact
        addContact(book);
        break;
      case 3: //Delete Contact
        deleteContact(book);
        break;
      case 4: //Edit Contact
        break;
      case 11: //Search in Contacts
        break;
      case 5: //Add Group
        break;
      case 6: //Add Group to Contact
        break;
      case 7: //Delete Group
        break;
      case 8: //Delete Group From Contact
        break;
      case 9: //Edit Group
        break;
      case 10: //Show All Groups
        break;
    }

    print('''
Menu:
1- Show All Contacts
2- Add Contact
3- Delete Contact
4- Edit Contact
5- Add Group
6- Add Group to Contact
7- Delete Group
8- Delete Group From Contact
9- Edit Group
10- Show All Groups
0- Exit.

Enter The Select:
''');
    choice = int.parse(stdin.readLineSync()!);
  }
  print('Good By');
}

void deleteContact(PhoneBook book) {
  print("All Contacts here for Removing:");
  showAllContacts(book);
  print('Please Enter ContactID for Remove...');
  int selectedID = int.parse(stdin.readLineSync()!);
  if (book.deleteContact(selectedID)) {
    print("Removed!");
  } else {
    print('ContactID is not Currect!');
  }
}

void addContact(PhoneBook book) {
  print('''Adding Contact:
        Enter FirstName:''');
  String fName = stdin.readLineSync()!;
  print('''Enter LastName:''');
  String lName = stdin.readLineSync()!;
  print('''Enter PhoneNumber:''');
  String phone = stdin.readLineSync()!;
  print('''Enter PhoneTitle:''');
  String title = stdin.readLineSync()!;
  // print('''Enter GroupName:''');
  // String groupName = stdin.readLineSync()!;
  book.addContact(Contact(
      firstName: fName,
      lastName: lName,
      phones: [Phone(title: title, phone: phone)]));
}

void showAllContacts(PhoneBook book) {
  print(book.contacts.map((e) => {
        "id: ": e.id,
        "First Name: ": e.firstName,
        "Last Name: ": e.lastName,
        "Phones: ": e.phones.map((e) => {"${e.title}: ": e.phone}),
        "Groups: ": e.groups.map((e) => book.groups
            .where((element) => element.id == e)
            .map((e) => {"id: ": e.id, "title: ": e.name}))
      }));
}
