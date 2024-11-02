import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para adicionar um novo pet
  Future<void> addPet(String id, String nome, String descricao) async {
    await _firestore.collection('pets').doc(id).set({
      'Nome': nome,
      'Descrição': descricao,
    });
  }

  // Método para obter todos os pets
  Future<List<Map<String, dynamic>>> getPets() async {
    QuerySnapshot snapshot = await _firestore.collection('pets').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // Método para atualizar um pet
  Future<void> updatePet(String id, String nome, String descricao) async {
    await _firestore.collection('pets').doc(id).update({
      'Nome': nome,
      'Descrição': descricao,
    });
  }

  // Método para excluir um pet
  Future<void> deletePet(String id) async {
    await _firestore.collection('pets').doc(id).delete();
  }
}
