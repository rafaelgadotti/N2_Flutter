import 'package:flutter/material.dart';
import 'pet.dart';
import 'pet_viewmodel.dart';
import 'pet_form_page.dart';
import 'app_colors.dart'; // Certifique-se de importar a classe AppColors

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PetViewModel _petViewModel = PetViewModel();

  void _updateList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Pets')),
      backgroundColor: AppColors.background, // Cor de fundo da tela principal
      body: _petViewModel.pets.isEmpty
          ? Center(child: Text('Nenhum pet cadastrado.', style: TextStyle(color: AppColors.textColor))) // Adicionando cor ao texto
          : ListView.builder(
        itemCount: _petViewModel.pets.length,
        itemBuilder: (context, index) {
          final pet = _petViewModel.pets[index];
          return ListTile(
            title: Text(pet.nome, style: TextStyle(color: AppColors.textColor)), // Adicionando cor ao texto
            subtitle: Text(pet.descricao, style: TextStyle(color: AppColors.textColor)), // Adicionando cor ao texto
            trailing: IconButton(
              icon: Icon(Icons.delete, color: AppColors.textColor), // Adicionando cor ao ícone
              onPressed: () {
                _petViewModel.deletePet(pet.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pet excluído com sucesso!')),
                );
                _updateList();
              },
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetFormPage(
                  pet: pet,
                  onSave: (updatedPet) {
                    _petViewModel.updatePet(updatedPet);
                    _updateList();
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetFormPage(
              onSave: (newPet) {
                _petViewModel.addPet(newPet);
                _updateList();
              },
            ),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
