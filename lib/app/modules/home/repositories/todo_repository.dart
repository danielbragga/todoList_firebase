import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_todolist_firebase/app/modules/home/models/todo_model.dart';
import 'package:flutter_application_todolist_firebase/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  FirebaseFirestore firestore;

  TodoRepository({required this.firestore});

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) {
        return
      });
    });
  }
}
