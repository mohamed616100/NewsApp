import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/home/manager/Canhnge_cursual_cubit/states.dart';
class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitialHomeState());
 static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();
  void onPageChanged(index,reason) {
    currentIndex = index;
    emit(OnChangedPageState());
  }
}