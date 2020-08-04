import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/AppScaffold.dart';
import 'model/product.dart';

class Produtos extends StatefulWidget {
  final List<ProdutoModel> produtos = new List<ProdutoModel>();

  Produtos() {
    produtos.add(ProdutoModel(
        'Bolo de Morango',
        'Muito gosto, cheio de sabor',
        'https://s2.glbimg.com/rjxp5NU8HGtBrvD9ORMVwMC6cdo=/0x0:324x250/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/09/21/10_25_34_875_receita_bolo_morango_chantilly2.jpg',
        true));
    produtos.add(ProdutoModel(
        'Bolo de Morango',
        'Muito gosto, cheio de sabor',
        'https://s2.glbimg.com/rjxp5NU8HGtBrvD9ORMVwMC6cdo=/0x0:324x250/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/09/21/10_25_34_875_receita_bolo_morango_chantilly2.jpg',
        true));
    produtos.add(ProdutoModel(
        'Bolo de Morango',
        'Muito gosto, cheio de sabor',
        'https://s2.glbimg.com/rjxp5NU8HGtBrvD9ORMVwMC6cdo=/0x0:324x250/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/09/21/10_25_34_875_receita_bolo_morango_chantilly2.jpg',
        true));
  }

  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  Widget content(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: widget.produtos.length,
      itemBuilder: (context, index) {
        var item = widget.produtos[index];
        return ListTile(
          title: Text(item.titulo),
          leading: Image.network(item.urlImagem, width: 69, height: 69),
          subtitle: Text(item.descricao),
          contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 5.0),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold('Lista de Produtos', this.content(context))
        .build(context);
  }
}
