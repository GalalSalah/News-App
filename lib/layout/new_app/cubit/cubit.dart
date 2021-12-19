import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/new_app/cubit/state.dart';
import 'package:news_app/moduls/business/business_screen.dart';
import 'package:news_app/moduls/science/science_screen.dart';
import 'package:news_app/moduls/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsAppState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(NewsBottomNavBarState());
    if(index==1) getSports();
    if(index==2) getScience();
  }

  List<dynamic> business=[];

  void getBusiness() {
    emit(NewsBusinessGetDataLoadingState());
    DioHelpers.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'a0c5452e0d56478e8d66e68658e56e78',
    }).then((value) {
      business = value.data['articles'];
      print(business[5]['title']);
      emit(NewsBusinessGetDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsBusinessErrorState(onError.toString()));
    });
  
  }


  List<dynamic> sports=[];

  void getSports() {

    emit(NewsSportsGetDataLoadingState());

      DioHelpers.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'a0c5452e0d56478e8d66e68658e56e78',
      }).then((value) {
        sports = value.data['articles'];
        print(sports[5]['title']);
        emit(NewsSportsGetDataSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsSportsErrorState(onError.toString()));
      });


  }
  List<dynamic> science=[];

  void getScience() {
    emit(NewsScienceGetDataLoadingState());
    DioHelpers.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'a0c5452e0d56478e8d66e68658e56e78',
    }).then((value) {
      science = value.data['articles'];
      print(science[5]['title']);
      emit(NewsScienceGetDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsScienceErrorState(onError.toString()));
    });

  }

  List<dynamic> search=[];

  void getSearch(String n) {

    emit(NewsSearchGetDataLoadingState());

    DioHelpers.getData(url: 'v2/everything', query: {
      'q': '$n',
      'apiKey': 'a0c5452e0d56478e8d66e68658e56e78',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsScienceGetDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsScienceErrorState(onError.toString()));
    });

  }
}
