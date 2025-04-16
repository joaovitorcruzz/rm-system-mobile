import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});
  
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  bool _nomeVazio = false;
  bool _emailVazio = false;
  bool _emailInvalido = false;
  bool _telefoneVazio = false;
  bool _senhaVazia = false;
  bool _senhaInvalida = false;
  bool _senhasDiferentes = false;

  void _validarCadastro() {
    setState(() {
      String nome = _nomeController.text.trim();
      String email = _emailController.text.trim();
      String senha = _senhaController.text.trim();
      String confirmarSenha = _confirmarSenhaController.text.trim();

      _nomeVazio = nome.isEmpty;
      _emailVazio = email.isEmpty;
      _emailInvalido = !EmailValidator.validate(email) && !_emailVazio;
      _telefoneVazio = _telefoneController.text.trim().isEmpty;
      _senhaVazia = senha.isEmpty;
      _senhaInvalida =
          !_senhaVazia &&
          (senha.length < 7 || !RegExp(r'[^a-zA-Z0-9]').hasMatch(senha));
      _senhasDiferentes = senha != confirmarSenha;
    });

    if (_nomeVazio ||
        _emailVazio ||
        _telefoneVazio ||
        _senhaVazia ||
        _emailInvalido ||
        _senhaInvalida ||
        _senhasDiferentes) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Cadastro realizado com sucesso!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, 
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 10, 42, 69),
              Color.fromARGB(255, 26, 86, 135),
              Color.fromARGB(255, 51, 145, 221),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cadastro",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/logo-removed.png',
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                  Text(
                    "Crie sua conta na RM Sysyems",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        TextFormField(
                          controller: _nomeController,
                          decoration: InputDecoration(
                            hintText: "Nome Completo",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (_nomeVazio)
                          Text(
                            "Nome obrigatório",
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (_emailVazio)
                          Text(
                            "Email obrigatório",
                            style: TextStyle(color: Colors.red),
                          ),
                        if (_emailInvalido)
                          Text(
                            "Email inválido",
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _telefoneController,
                          decoration: InputDecoration(
                            hintText: "Telefone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (_telefoneVazio)
                          Text(
                            "Telefone obrigatório",
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _senhaController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (_senhaVazia)
                          Text(
                            "Senha obrigatória",
                            style: TextStyle(color: Colors.red),
                          ),
                        if (_senhaInvalida)
                          Text(
                            "A senha deve ter pelo menos 7 caracteres e 1 caractere especial.",
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmarSenhaController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Confirmar Senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        if (_senhasDiferentes)
                          Text(
                            "As senhas não coincidem",
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              14,
                              43,
                              94,
                            ),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            _validarCadastro();
                            if (!_nomeVazio &&
                                !_emailVazio &&
                                !_emailInvalido &&
                                !_telefoneVazio &&
                                !_senhaVazia &&
                                !_senhaInvalida &&
                                !_senhasDiferentes) {
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                          },
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Já tem uma conta? Voltar para o login",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 14, 43, 94),
                              fontSize: 20,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}