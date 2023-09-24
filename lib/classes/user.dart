class User {
  String _name;
  double _weight;
  double _height;

  User(this._name, this._weight, this._height);

  String get name => _name;
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  double get weight => _weight;
  set weight(double newWeight) {
    if (newWeight > 0) {
      _weight = newWeight;
    }
  }

  double get height => _height;
  set height(double newHeight) {
    if (newHeight > 0) {
      _height = newHeight;
    }
  }

  double calculateBmi() {
    if (_height == 0 || _weight == 0) {
      throw ArgumentError();
    }
    return _weight / (_height * _height);
  }

  String bmiClassification(double bmi) {
    switch (bmi) {
      case < 16:
        return 'Magreza grave';
      case < 17:
        return 'Magreza moderada';
      case < 18.5:
        return 'Magreza leve';
      case < 25:
        return 'Saudável';
      case < 30:
        return 'Sobrepeso';
      case < 35:
        return 'Obesidade grau I';
      case < 40:
        return 'Obesidade grau II (severa)';
      default:
        return 'Obesidade grau III (mórbida)';
    }
  }
}
