import 'package:avaliacao_gui_dm1/ui/components/components.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String address = '';

  String? simpleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercício Montagem GUI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: .start,
            children: <Widget>[
              Text(
                'TELA DE CADASTRO',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DefaultTextFormField(
                fieldTitle: 'NOME:',
                labelText: 'Digite o nome',
                onSaved: (value) => name = value ?? '',
                validator: simpleValidator,
              ),
              DefaultTextFormField(
                fieldTitle: 'ENDEREÇO:',
                labelText: 'Digite o endereço',
                onSaved: (value) => address = value ?? '',
                validator: simpleValidator,
              ),
              DefaultTextFormField(
                fieldTitle: 'eMAIL:',
                labelText: 'Digite o email',
                onSaved: (value) => email = value ?? '',
                validator: simpleValidator,
              ),
              const SizedBox(height: 18),
              Row(
                spacing: 22,
                mainAxisAlignment: .end,
                children: <Widget>[
                  DefaultElevatedButton(
                    text: 'CANCELAR',
                    onPressed: () {
                      _formKey.currentState?.reset();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Operaçao cancelada!',
                          ),
                          content: Text(
                            'Os campos foram limpos para preenchimento',
                          ),
                        ),
                      );
                    },
                  ),
                  DefaultElevatedButton(
                    text: 'SALVAR',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Cadastro salvo'
                            ),
                            content: Column(
                              crossAxisAlignment: .start,
                              mainAxisSize: .min,
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(
                                    text: 'Nome: ',
                                    children: [
                                      TextSpan(
                                        text: name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Endereço: ',
                                    children: [
                                      TextSpan(
                                        text: address,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Email: ',
                                    children: [
                                      TextSpan(
                                        text: email,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
