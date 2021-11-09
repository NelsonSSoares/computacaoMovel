import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:tempoapi/model/clima_model.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

 late ClimaModel climaModel;

 final  List<String> _cidades = [
    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista",
    "Brasilia",
    "Campo Grande",
    "Cuiaba",
    "Floarianopolis",
    "Fortaleza",
    "Giânia",
    "João Pessoa",
    "Macapá",
    "Maceio",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "Sâo Luís",
    "São Paulo",
    "Teresina",
    "Vitória"
  ];

  String _cidadeSelecionada = "São Paulo";

  carregaClima() async{
    const String _apiURL = "api.openweathermap.org/"; //LINK API
    const String _path = "data/2.5/weather";
    const String _appid = "6e7b8fa6b5a64360dcee5b495b2fdfed"; // CHAVE API
    const String _units = "metric";
    const String _lang = "pt-br";

    final _parametros = {
      "q": _cidadeSelecionada,
      "appid": _appid,
      "units": _units,
      "lang": _lang
    };
    //linha que faz a requisição para API
    final climaResponse = await http.get(Uri.https(_apiURL, _path,_parametros));
    //teste
    //print('url funcioanndo ${climaResponse.request!.url.toString()}' );
    // print(climaResponse.body);

    if(climaResponse.statusCode == 200){
      climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
    }
  }

  @override
  Widget build(BuildContext context) {

    /* pegando tamanho da tela*/

    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              items: _cidades,
              showSelectedItems: true,
              showSearchBox: true,
              maxHeight: height - padding.top - 60,
              onChanged: (value){/* valor do item selecionado*/

                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });

                },
            )
          ],
        ),
      )
    );
  }
}

 