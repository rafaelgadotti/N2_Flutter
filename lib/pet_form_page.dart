import 'package:flutter/material.dart';
import 'app_colors.dart'; // Certifique-se de importar a classe AppColors
import 'pet.dart'; // Importando a classe Pet

class PetFormPage extends StatelessWidget {
  final Pet? pet; // Use a classe Pet
  final Function(Pet) onSave;

  PetFormPage({this.pet, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController(text: pet?.nome);
    final TextEditingController descricaoController = TextEditingController(text: pet?.descricao);

    return Scaffold(
      appBar: AppBar(
        title: Text(pet == null ? 'Adicionar Pet' : 'Editar Pet'),
      ),
      backgroundColor: AppColors.background, // Define a cor de fundo cinza escuro
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPet = Pet(
                  id: pet?.id ?? UniqueKey().toString(), // Use um novo ID se não houver pet
                  nome: nomeController.text,
                  descricao: descricaoController.text,
                );
                onSave(newPet);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
