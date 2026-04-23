abstract class SmartListState {}

class SmartListInitial extends SmartListState {}

class SmartListLoading extends SmartListState {}

class SmartListSuccess extends SmartListState {}

class SmartListError extends SmartListState {
  final String message;
  SmartListError(this.message);
}

class FormChanged extends SmartListState {}

class GetAllProducts extends SmartListState {}
