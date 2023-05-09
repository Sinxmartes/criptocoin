import 'package:criptomoedas/pages/moedas_detalhes_page.dart';
import 'package:criptomoedas/repositories/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/model.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];
  final tabela = MoedaRepository.tabela;  
  
  appBarDinamica() {
    if(selecionadas.isEmpty) {
      return AppBar(
        title: const Text("Criptocoin"),
        centerTitle: true,
        elevation: 2,
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          }
        ), 
        title: Text("${selecionadas.length} moedas selecionadas"),
        centerTitle: true,
        backgroundColor: Colors.green,
        /* titleTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w900
        ) */ //text style for title
      );
    }
      
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MoedasDetalhesPage(moeda: moeda)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            leading: (selecionadas.contains(tabela[moeda]))
              ? const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 72, 99, 73),
                child: Icon(Icons.check),
              )
              : SizedBox(width: 40, child: Image.asset(tabela[moeda].icone)),
            /* leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              backgroundImage: AssetImage(tabela[moeda].icone)
            ), */
            title: Text(tabela[moeda].nome, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),),
            trailing: Text(real.format(tabela[moeda].preco)),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: const Color.fromARGB(255, 121, 177, 123),
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda])) ? selecionadas.remove(tabela[moeda]) : selecionadas.add(tabela[moeda]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[moeda]),
          );
        }, 
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(), 
        itemCount: tabela.length
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (selecionadas.isNotEmpty) 
      ? FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.star_outline),
        label: const Text(
          'Favoritar',
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w900
          ),
        )
      )
      : null,
    );
  }
}