import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan/models/lists.dart';
import 'package:plan/models/tasks.dart';
import 'package:uuid/uuid.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskSubmitted>(_addTaskSubmitted);
  }
  Future<void> _addTaskSubmitted(
    AddTaskSubmitted event,
    Emitter<AddTaskState> emit,
  ) async {
    try {
      emit(AddTaskLoading());
      final User user = FirebaseAuth.instance.currentUser!;
      final String userId = user.uid;
      Uuid uuid = const Uuid();
      String listId = uuid.v4();
      var userCollections = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('userList');
      while (await userCollections
          .doc(listId)
          .get()
          .then((value) => value.exists)) {
        listId = uuid.v4();
      }

      // final userRef =
      //   await   FirebaseFirestore.instance
      //         .collection("users")
      //         .doc(userId)
      //         .collection('userList')
      //         .doc(listId)
      //         .collection('tasks')
      //         .doc();

      // await userRef.set(event.userTask.toMap());
      // emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskError(error: e.toString()));
    }
  }
}
