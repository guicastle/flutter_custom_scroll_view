import 'package:flutter/material.dart';

class MySingleScrollScreen extends StatelessWidget {
  const MySingleScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Um Único Scroll')),
      body: CustomScrollView(
        // <--- O WIDGET PRINCIPAL AGORA É CUSTOMSCROLLVIEW
        slivers: <Widget>[
          // CustomScrollView usa uma lista de slivers
          // O Texto "Categorias Populares" como um Sliver
          SliverToBoxAdapter(
            // <--- Envolve widgets comuns para que se comportem como slivers
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ), // Padding apenas para o texto/layout acima
              child: const Text(
                'Categorias Populares:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            // Espaçamento também precisa ser um sliver
            child: const SizedBox(height: 16),
          ),

          // O ListView horizontal como um Sliver
          SliverToBoxAdapter(
            // <--- ListView horizontal precisa ser envolvido para ter altura fixa
            child: SizedBox(
              height: 120, // Altura fixa para a lista horizontal
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // A rolagem interna ainda é horizontal
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text('Item ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),

          // Adicionando mais conteúdo abaixo para demonstrar a rolagem única
          // Este conteúdo também estará em um Sliver para rolar junto
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Colors.blue[100],
                    alignment: Alignment.center,
                    child: const Text('Conteúdo Abaixo da Lista Horizontal'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 300,
                    color: Colors.green[100],
                    alignment: Alignment.center,
                    child: const Text('Mais Conteúdo para Forçar a Rolagem'),
                  ),
                ],
              ),
            ),
          ),

          // Se você tivesse uma lista vertical principal, usaria SliverList ou SliverGrid aqui:
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text('Item principal $index'));
            }, childCount: 50),
          ),
        ],
      ),
    );
  }
}
