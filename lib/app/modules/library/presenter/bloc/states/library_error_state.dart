import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class LibraryErrorState extends LibraryStates{
  final FailureLibraryDatabase failureLibraryDatabase;

  LibraryErrorState(this.failureLibraryDatabase);
}