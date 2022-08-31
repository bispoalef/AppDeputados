import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:trste_api/parlamentares.dart';

class ApiData extends ChangeNotifier {
  List listaDeputados = [];

  carregarDados() async {
    await _buscarDados();
  }

  _buscarDados() async {
    dynamic data = json.decode(parlamentares);

    var deputados = data['deputados']['deputado'];

    listaDeputados = deputados;
  }
}
