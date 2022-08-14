part of 'covid-bloc.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();

  @override
  List<Object> get props => [];
}

class GetCovidList extends CovidEvent {}
