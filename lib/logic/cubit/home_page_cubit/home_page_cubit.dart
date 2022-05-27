import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/person.dart';
import '../../../data/shared/shared_service.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  Future loadHomePage() async {
    try {
      emit(HomePageLoading());
      final String nic = await SharedServices.getNic();
      final Person person = await HTTPServices.getPerson(nic: nic);
      emit(HomePageLoaded(person: person));
    } catch (e) {
      emit(HomePageFailed(errorMsg: e.toString()));
    }
  }
}
