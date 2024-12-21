import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main.dart';
import 'home_page.dart';

class BlankPage extends StatelessWidget {
  final String message;
  final bool showBackButton;

  const BlankPage({
    Key? key, 
    this.message = 'Page Under Development', 
    this.showBackButton = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prestige Park Grove'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        leading: showBackButton 
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 82, 159, 151), // Matching drawer gradient
              const Color.fromARGB(255, 52, 94, 89),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder Image or Icon
              Icon(
                Icons.construction_rounded,
                size: 100,
                color: Colors.white.withOpacity(0.8),
              ),
              
              const SizedBox(height: 20),
              
              // Message Text
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              
              // Optional Action Button
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}