import 'package:flutter/material.dart';
import 'package:tempoapi/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({Key? key, required this.climaModel}) : super(key: key);

  final ClimaModel climaModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            "https://openweathermap.org/img/wn/${climaModel.icone}@2x.png",
            fit: BoxFit.fill,
            width: 110
        ),
        Text(
            "${climaModel.temperatura.toStringAsFixed(0)}ºC",
            style: const TextStyle(fontSize: 50)
        ),
        Text(
            climaModel.descricao,
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center
        ),
        const SizedBox(height: 24),
        Text(
            "Temperatura Mínima: ${climaModel.tempMin.toStringAsFixed(0)}ºC",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        ),
        Text(
            "Temperatura Máxima: ${climaModel.tepMax.toStringAsFixed(0)}ºC",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        ),
        Text(
            "Sensação Térmica: ${climaModel.sensacaoTermica.toStringAsFixed(0)}ºC",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        ),
        Text(
            "Umidade do Ar: ${climaModel.umidade}%",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        ),
        Text(
            "Visibilidade: ${climaModel.visibilidade}Km",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        ),
        Text(
            "Pressão Atmosférica: ${climaModel.pressao}hPa",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center
        )
      ],
    );
  }
}
