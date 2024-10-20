import 'package:flutter/material.dart';
import 'package:quiz_app/accueil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Set background to sky blue
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the Accueil page
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Image.network(
                'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-quiz-logo-with-speech-bubble-symbols-png-image_6568572.png', // Replace with the actual URL or use AssetImage if stored locally
                width: 100, // Adjust the size as needed
                height: 100,
              ),
              const SizedBox(
                  height: 20), // Spacing between the logo and description

              // Description
              const Text(
                'Application Flutter Quiz',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
