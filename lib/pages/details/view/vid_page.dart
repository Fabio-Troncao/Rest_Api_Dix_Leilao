import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rest_api_adix_leilao/pages/details/components/vid.dart';

// ignore: camel_case_types
class VidPage extends StatefulWidget {
  const VidPage({super.key});

  String get title => 'Ao Vivo';

  @override
  State<VidPage> createState() => _VidPageState();
}

// ignore: camel_case_types
class _VidPageState extends State<VidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/home');
          },
        ),
        backgroundColor: const Color.fromARGB(255, 10, 43, 71),
      ),
      body: Column(
        children: const [
          VideoContainer(),
          PhraseContainer(),
          IconTextContainer(),
        ],
      ),
    );
  }
}
