import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../domain/models/club.dart';
import '../../data/repositories/club_repository.dart';
import '../../utils/command.dart';
import '../../utils/result.dart';

class ClubsViewModel extends ChangeNotifier {
  ClubsViewModel({
    required ClubRepository clubRepository,
  }) : _clubRepository = clubRepository {
    loadClubs = Command0(_loadClubs)..execute();
  }

  final _log = Logger('ClubsViewModel');
  final ClubRepository _clubRepository;
  List<Club> _clubs = [];

  List<Club> get clubs => _clubs;

  late final Command0 loadClubs;

  Future<Result<void>> _loadClubs() async {
    final resultClubs = await _clubRepository.getClubs();
    switch (resultClubs) {
      case Ok():
        {
          _clubs = resultClubs.value;
          _log.fine(
            'Clubs (${_clubs.length}) loaded',
          );
        }
      case Error():
        {
          _log.warning('Failed to load clubs', resultClubs.error);
        }
    }

    notifyListeners();
    return resultClubs;
  }
}
