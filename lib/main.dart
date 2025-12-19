import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaStateful(),
    );
  }
}

class ListaStateful extends StatefulWidget {
  const ListaStateful({super.key});

  @override
  State<ListaStateful> createState() {
    print('createState ejecutado');
    return _ListaStatefulState();
  }
}

class _ListaStatefulState extends State<ListaStateful> {
  List<String> elementos = [];

  @override
  void initState() {
    super.initState();
    print('initState ejecutado');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies ejecutado');
  }

  @override
  Widget build(BuildContext context) {
    print('build ejecutado');

    return Scaffold(
      appBar: AppBar(title: const Text('Ciclo de Vida Flutter')),
      body: Column(
        children: [
          const ListaStateless(),
          Expanded(
            child: ListView.builder(
              itemCount: elementos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(elementos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        elementos.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            elementos.add('Elemento ${elementos.length + 1}');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ListaStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget ejecutado');
  }

  @override
  void deactivate() {
    print('deactivate ejecutado');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose ejecutado');
    super.dispose();
  }
}

class ListaStateless extends StatelessWidget {
  const ListaStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Lista creada con StatelessWidget',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
