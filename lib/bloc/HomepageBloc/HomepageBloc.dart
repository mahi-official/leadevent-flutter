import 'package:bloc/bloc.dart';
import 'package:leadevent/bloc/HomepageBloc/HomepageEvent.dart';
import 'package:leadevent/bloc/HomepageBloc/HomepageState.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  @override
  HomepageBloc() : super(HomepageInitialState());

  @override
  Stream<HomepageState> mapEventToState(HomepageEvent event) async* {
    if (event is HomepageEventsEvent) {
      yield HomepageEventsProcessingState(); // Basically a processing screen state
      // var repo = eventsRepository(); //TODO: Create db call in this function or add dummy data for now.
      // var events = repo.getAllEvents();
      // yield HomepageEventsState(eventsData: events);
    } else if (event is HomepageEventDetailsEvent) {
      yield HomepageEventsProcessingState();
      // var repo = eventsRepository();
      // var evt = repo.getEventDetails(event.eventId);
      // yield HomepageEventDetailsState(eventData: evt);
    }
  }
}
