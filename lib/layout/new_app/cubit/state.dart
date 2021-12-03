abstract class NewsAppState{}
class NewsInitialState extends NewsAppState{}
class NewsBottomNavBarState extends NewsAppState{}
class NewsBusinessGetDataLoadingState extends NewsAppState{}
class NewsBusinessGetDataSuccessState extends NewsAppState{}
class NewsBusinessErrorState extends NewsAppState{
   final String error;
   NewsBusinessErrorState(this.error);
}
class NewsSportsGetDataLoadingState extends NewsAppState{}
class NewsSportsGetDataSuccessState extends NewsAppState{}
class NewsSportsErrorState extends NewsAppState{
   final String error;
   NewsSportsErrorState(this.error);
}
class NewsScienceGetDataLoadingState extends NewsAppState{}
class NewsScienceGetDataSuccessState extends NewsAppState{}
class NewsScienceErrorState extends NewsAppState{
   final String error;
   NewsScienceErrorState(this.error);
}

class NewsSearchGetDataLoadingState extends NewsAppState{}
class NewsSearchGetDataSuccessState extends NewsAppState{}
class NewsSearchErrorState extends NewsAppState{
   final String error;
   NewsSearchErrorState(this.error);
}
