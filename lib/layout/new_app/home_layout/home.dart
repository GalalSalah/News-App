import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/new_app/cubit/cubit.dart';
import 'package:news_app/layout/new_app/cubit/state.dart';
import 'package:news_app/layout/new_app/theme_cubit/cubit.dart';
import 'package:news_app/moduls/search/search_screen.dart';
import 'package:news_app/shared/component/components.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text('News App'),
            actions: [IconButton(onPressed: (){
              navigateTo(context, SearchScreen());
            }, icon:const Icon(Icons.search) ),
              IconButton(onPressed: (){
                AppCubit.get(context).changeAppMode();
              }, icon:const Icon(Icons.brightness_4_outlined) )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            onTap: (int index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
