import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String title;
  late bool check;
  DocumentReference reference;

  TodoModel(
      {required this.reference,
      required this.title = "",
      required this.check = false});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'], check: doc['check'], reference: doc.reference);
  }

  get status => null;

  Future save() async {
    if (reference == null) {
      reference = await FirebaseFirestore.instance
          .collection('todo')
          .add({'title': title, 'check': check});
    } else {
      reference.update({'title': title, 'check': check});
    }
  }
}
