enum Rpa { rock, paper, scissors }

extension RpaExtension on Rpa {
  String get description {
    switch (this) {
      case Rpa.rock:
        return 'Rock';
      case Rpa.paper:
        return 'Paper';
      case Rpa.scissors:
        return 'Scissors';
    }
  }
}
