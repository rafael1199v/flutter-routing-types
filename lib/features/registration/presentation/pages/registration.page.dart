import 'package:flutter/material.dart';
import 'package:flutter_routing_types/features/home/presentation/pages/home.page.dart';
import 'music_search.page.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registration';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedMusic;

  void _navigateToSearch() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MusicSearchPage()),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedMusic = result as String;
      });
    }
  }

  void _finishRegistration() {
    if (_formKey.currentState!.validate() && _selectedMusic != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const Text(
                'Cuéntanos sobre ti',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Ingresa tu nombre' : null,
              ),
              const SizedBox(height: 20),
              
              // Sección de Selección de Música (Push con retorno)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Column(
                  children: [
                    Text(
                      _selectedMusic == null 
                          ? 'Aún no has seleccionado música' 
                          : 'Música seleccionada: $_selectedMusic',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _navigateToSearch,
                      icon: const Icon(Icons.search),
                      label: const Text('Buscar mi música favorita'),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              ElevatedButton(
                onPressed: _finishRegistration,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                ),
                child: const Text(
                  'Finalizar Registro',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}