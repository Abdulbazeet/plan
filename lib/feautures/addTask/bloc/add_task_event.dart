part of 'add_task_bloc.dart';

sealed class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

final class AddTaskSubmitted extends AddTaskEvent {
  final String listName;
  final UserTasks userTask;

  const AddTaskSubmitted({required this.listName, required this.userTask});

  @override
  List<Object> get props => [listName, userTask];
}
