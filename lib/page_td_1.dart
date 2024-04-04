import 'package:flutter/material.dart';

class PageTD1 extends StatefulWidget {
  const PageTD1({super.key});

  @override
  State<PageTD1> createState() => _PageTD1State();
}

class _PageTD1State extends State<PageTD1> {
  String defaultText = "Bienvenue sur la page TD 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page TD 1'),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(defaultText,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: changeText, child: const Text("Cliquez ici pour continuer")),
                const SizedBox(height: 20),
                Image.network('https://images.pexels.com/photos/11073147/pexels-photo-11073147.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', width: 200, height: 200, fit: BoxFit.cover),
              ],
            ),
          )),
    );
  }

  void changeText(){
    setState(() {
      defaultText = "Vous avez cliqué sur le bouton";
    });
  }
}