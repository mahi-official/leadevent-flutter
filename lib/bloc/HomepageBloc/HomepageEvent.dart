import 'package:equatable/equatable.dart';

abstract class HomepageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomepageStartEvent extends HomepageEvent {}

class HomepageEventsEvent extends HomepageEvent {}

class HomepageEventDetailsEvent extends HomepageEvent {
  final int eventId;
  HomepageEventDetailsEvent(this.eventId);

  @override
  List<Object> get props => [eventId];
}
