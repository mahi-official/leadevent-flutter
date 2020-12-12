import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:leadevent/models/Event.dart';

@immutable
class HomepageState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomepageInitialState extends HomepageState {}

@immutable
class HomepageEventsProcessingState extends HomepageState {}

@immutable
class HomepageEventsState extends HomepageState {
  final List<Event> eventsData;
  HomepageEventsState({this.eventsData});
}

@immutable
class HomepageEventDetailsState extends HomepageState {
  final Event eventData;

  HomepageEventDetailsState({this.eventData});
}
