import 'dart:io';

import 'Contact.dart';
import 'Phone.dart';
import 'PhoneBook.dart';

void main(List<String> args) {
  print('''


Wellcome To PhoneBook v1:
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
  int choice = int.parse(stdin.readLineSync()!);
  PhoneBook book = PhoneBook();
  while (choice != 0) {
    switch (choice) {
      case 1:
        print(book.contacts.map((e) => {
              "id: ": e.id,
              "First Name: ": e.firstName,
              "Last Name: ": e.lastName,
              "Phones: ": e.phones.map((e) => {"${e.title}: ": e.phone}),
              "Groups: ": e.groups.map((e) => book.groups
                  .where((element) => element.id == e)
                  .map((e) => {"id: ": e.id, "title: ": e.name}))
            }));
        break;
      case 2:
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
            id: book.contacts.length+1,
            firstName: fName,
            lastName: lName,
            phones: [Phone(title: title, phone: phone)]));
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
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
