class BlocTemplate {
  final blocStateTemplate = '''
part of '@name_bloc.dart';

class @NameState extends Equatable {
  // state params
  final String field;

  const @NameState({
    required this.field,
  });

  @override
  List<Object?> get props => [
        field,
      ];

  @override
  String toString() {
    return \'''
    @NameState({
    field: \$field,
  })
    \''';
  }

  @NameState copyWith({
    field,
  }) {
    return @NameState(
      field: field ?? this.field,
    );
  }

  factory @NameState.empty() {
    return const @NameState(
      field: 'value'
    );
  }
}
  ''';

  final blocEventTemplate = '''
part of '@name_bloc.dart';

sealed class @NameEvent extends Equatable {
  const @NameEvent();
}

class SubEvent extends @NameEvent {
 @override
  List<Object?> get props => [];
}

  ''';

  final blocTemplate = '''

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {

  PostBloc() : super(PostState.empty()) {
    // map events
    on<SubEvent>(_onSubEvent,);
  }

  _onSubEvent(SubEvent event, Emitter<PostState> emit) async {
    // update state
    emit(state.copyWith(field: 'value'));
  }
}
''';
}
