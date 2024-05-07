import 'package:voyage/utils/contact.database.dart';

import '../model/contact.model.dart';

class ContactService {
  ContactDatabase contactDatabase = ContactDatabase();

  Future<List<Contact>> listeContacts() async {
    var contacts = await contactDatabase.recuperer();
    return contacts.map((item) => Contact.fromJson(item)).toList();
  }

  Future<bool> ajouterContact(Contact c) async {
    int res = await contactDatabase.inserer(c);
    return res > 0 ? true : false;
  }

  Future<bool> modifierContact(Contact contact) async {
    int res = await contactDatabase.modifier(contact);
    return res > 0 ? true : false;
  }

  Future<bool> supprimerContact(Contact contact) async {
    int res = await contactDatabase.supprimer(contact);
    return res > 0 ? true : false;
  }
}
