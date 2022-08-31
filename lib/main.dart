import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trste_api/data/api.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ApiData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ApiData data;
  @override
  Widget build(BuildContext context) {
    data = context.watch<ApiData>();
    data.carregarDados();
    List listaDeputados = data.listaDeputados;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Deputados'),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: listaDeputados.length,
          itemBuilder: (_, index) {
            var itemLista = listaDeputados[index];
            return Column(
              children: [
                ListTile(
                  leading: Image.network(itemLista['urlFoto']),
                  title: Text(itemLista['nomeParlamentar']),
                  subtitle: Text(itemLista['partido']),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text('Saber Mais'),
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
