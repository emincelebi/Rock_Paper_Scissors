import 'dart:math';

import 'package:rock_paper_scissors/components/enums.dart';

class RpaService {
  int compareToChoose(Rpa? phone, Rpa? person) {
    if (phone == Rpa.rock && person == Rpa.scissors ||
        phone == Rpa.paper && person == Rpa.rock ||
        phone == Rpa.scissors && person == Rpa.paper) {
      return 1;
    } else if (phone == Rpa.rock && person == Rpa.paper ||
        phone == Rpa.paper && person == Rpa.scissors ||
        phone == Rpa.scissors && person == Rpa.rock) {
      return 2;
    }
    return 0;
  }

  String? result(int? isKnow) {
    switch (isKnow) {
      case 0:
        return 'DRAW!';
      case 1:
        return 'LOSE';
      case 2:
        return 'WIN!';
    }
    return null;
  }

  Rpa? phoneChoice() {
    int random = Random().nextInt(3);

    switch (random) {
      case 0:
        return Rpa.rock;
      case 1:
        return Rpa.paper;
      case 2:
        return Rpa.scissors;
    }
    return null;
  }
}
