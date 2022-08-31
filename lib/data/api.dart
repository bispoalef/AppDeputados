import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:trste_api/parlamentares.dart';

class ApiData extends ChangeNotifier {
  List listaDeputados = [];

  carregarDados() async {
    await _buscarDados();
    await _buscarGastos();
  }

  _buscarDados() async {
    dynamic data = json.decode(parlamentares);

    var deputados = data['deputados']['deputado'];

    listaDeputados = deputados;
  }

  _buscarGastos() async {
    var url = Uri.parse(
        'https://dadosabertos.camara.leg.br/api/v2/deputados/74459/despesas?ordem=ASC&ordenarPor=ano');
    var response = await http.get(url);

    final jsonResponse = jsonDecode(response.body);

    print(jsonResponse['dados'][3]['valorDocumento']);

    // var deputados = data['deputados']['deputado'];

    // listaDeputados = deputados;
  }
}
