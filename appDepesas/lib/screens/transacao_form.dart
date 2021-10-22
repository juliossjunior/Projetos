import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransacaoForm(this.onSubmit);

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final tituloController = TextEditingController();

  final valorController = TextEditingController();

  _submitForm() {
    final title = tituloController.text;
    final value = double.tryParse(valorController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: tituloController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
                focusColor: Color(0xFF21093e),
              ),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor R\$',
                focusColor: Color(0xFF21093e),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Nova Transação'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
