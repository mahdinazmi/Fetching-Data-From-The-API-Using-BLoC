import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fetchapibloc/model/covid-model.dart';
import 'package:fetchapibloc/resources/api-repository.dart';
part 'covid-event.dart';
part 'covid-state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(CovidLoaded(mList));
        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
