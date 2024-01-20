import 'package:flutter/material.dart';
import 'package:memory_share/services/authentification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool inLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
               decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/man.png'),
                fit: BoxFit.cover
                ),
               ),
              ),
            ),
            Text(
              'Mem-Share',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Decouvrez et partager les beaux moments passes avec vos proches',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            inLoginProcess ? Center(child: CircularProgressIndicator()) :
            ElevatedButton(
              onPressed: () => signIn(),
               child: Text('Connectez-vous avec google'))
          ],
        ),
      ),
    );
  }

  signIn() {
    setState(() {
      inLoginProcess = true;
      AuthService().signInWithGoogle();
    });
  }
}