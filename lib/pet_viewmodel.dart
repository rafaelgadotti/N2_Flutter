import 'package:uuid/uuid.dart';
import 'pet.dart';

class PetViewModel {
  final List<Pet> _pets = [];
  final _uuid = Uuid();

  List<Pet> get pets => List.unmodifiable(_pets);

  void addPet(Pet pet) {
    pet.id = _uuid.v4(); // Gera um ID único para cada pet
    _pets.add(pet);
  }

  void updatePet(Pet pet) {
    final index = _pets.indexWhere((p) => p.id == pet.id);
    if (index != -1) {
      _pets[index] = pet;
    }
  }

  void deletePet(String id) {
    _pets.removeWhere((pet) => pet.id == id);
  }
}
