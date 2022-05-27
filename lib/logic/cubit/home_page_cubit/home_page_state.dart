part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final Person person;
  HomePageLoaded({
    required this.person,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageLoaded && other.person == person;
  }

  @override
  int get hashCode => person.hashCode;

  @override
  String toString() => 'HomePageLoaded(person: $person)';
}

class HomePageFailed extends HomePageState {
  final String errorMsg;
  HomePageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'HomePageFailed(errorMsg: $errorMsg)';
}
