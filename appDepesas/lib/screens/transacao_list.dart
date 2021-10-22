import 'package:despesas/screens/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacaoList extends StatelessWidget {
  final List<Transacao> transacao;

  TransacaoList(this.transacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transacao.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada!',
                ),
                SizedBox(height: 20), //20
                Container(height: 200),
              ],
            )
          : ListView.builder(
              itemCount: transacao.length,
              itemBuilder: (ctx, index) {
                final tr = transacao[index];
                return Card(
                  elevation: 8, //5
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5, //5
                  ),

                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF21093e),
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.valor.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.titulo,
                            style: TextStyle(
                              color: Color(0xFF21093e),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.data),
                            style: TextStyle(
                                //color: Color(0xFF01579b),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /*child: ListTile(
                    //tileColor: Colors.grey,
                    leading: CircleAvatar(
                      radius: 30, //30
                      backgroundColor: Color(0xFF01579b),
                      child: Padding(
                        padding: const EdgeInsets.all(5), //6
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.valor}',
                            style: TextStyle(
                              color: Color(0xFFffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.titulo,
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.data),
                    ),
                  ),*/
                );
              },
            ),
    );
  }
}
