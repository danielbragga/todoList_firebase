import 'package:flutter/material.dart';
import 'package:flutter_application_todolist_firebase/app/modules/home/models/todo_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Observer(
        builder: (_) {
          if (store.todoList.hasError) {
            return Center(
                child: ElevatedButton(
              onPressed: store.getList,
              child: const Text('Error'),
            ));
          }

          if (store.todoList.data == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          List<TodoModel> list = store.todoList.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              return ListTile();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
