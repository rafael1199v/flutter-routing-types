import 'package:flutter/material.dart';
import 'package:flutter_routing_types/features/home/presentation/pages/home.page.dart';
import '../viewmodels/registration_viewmodel.dart';
import 'music_search.page.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registration';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  late final RegistrationViewModel _registrationViewModel;

  @override
  void initState() {
    super.initState();
    _registrationViewModel = RegistrationViewModel();
  }

  @override
  void dispose() {
    _registrationViewModel.dispose();
    super.dispose();
  }

  void _navigateToSearch() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const MusicSearchPage()),
    );

    if (result != null && mounted) {
      _registrationViewModel.setMusic(result);
    }
  }

  void _finishRegistration() {
    if (_registrationViewModel.canRegister(_formKey.currentState!.validate())) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Usuario')),
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

              ListenableBuilder(
                listenable: _registrationViewModel,
                builder: (context, _) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[400]!),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _registrationViewModel.selectedMusic == null
                              ? 'Aún no has seleccionado música'
                              : 'Música seleccionada: ${_registrationViewModel.selectedMusic}',
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
                  );
                },
              ),

              const Spacer(),

              ElevatedButton(
                onPressed: _finishRegistration,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
