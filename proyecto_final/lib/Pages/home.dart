import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool Busqueda = false;
  int _indiceNavigator = 0;  // Índice seleccionado para el BottomNavigationBar
  final TextEditingController _busquedaControl = TextEditingController(); 

  // Lista de pantallas que se mostrarán según el índice
  final List<Widget> _screens = [
    const Center(child: Text('Pantalla de Inicio', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Pantalla de Carrito de compras', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Pantalla de Historial de compras', style: TextStyle(fontSize: 24))),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _indiceNavigator = index;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Busqueda
            ? TextField(
                controller: _busquedaControl,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Buscar...",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                onChanged: (query) {
                  print("Texto de búsqueda: $query");
                },
              )
            : const Text('Tienda de ropa A Z'),
        backgroundColor: const Color.fromARGB(247, 209, 40, 231),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                Busqueda = !Busqueda;  // Alterna entre búsqueda y título normal
                if (!Busqueda) {
                  _busquedaControl.clear();  // Limpiar el campo de búsqueda cuando se cierra
                }
              });
            },
          ),
        ],
      ),
      body: _screens[_indiceNavigator],  // Muestra la pantalla correspondiente según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        currentIndex: _indiceNavigator,  // El índice de la pestaña seleccionada
        onTap: _onItemTapped,  // Cambia el índice cuando el usuario toca un ítem
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
        ],
      ),
    );
  }
}
