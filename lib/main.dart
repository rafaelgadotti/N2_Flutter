import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'home_page.dart';
import 'app_colors.dart'; // Importando o arquivo da paleta de cores
import 'firebase_options.dart'; // Importando as opções do Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necessário para garantir a inicialização correta
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Inicializa o Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Pets',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.accent,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.primary),
          bodyMedium: TextStyle(color: AppColors.secondary),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,      // Cor do texto do botão
          ),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.primary, // Cor da AppBar
        ),
      ),
      home: HomePage(),
    );
  }
}
