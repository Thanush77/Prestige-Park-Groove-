
import 'package:flutter/material.dart';

class GroundWaterPage extends StatefulWidget {
  @override
  _GroundWaterPageState createState() => _GroundWaterPageState();
}

class _GroundWaterPageState extends State<GroundWaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ground Water Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ground Water Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective management of groundwater resources is essential for sustainable water supply.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Icon(Icons.opacity, size: 100, color: Colors.brown),
            // Add more content and features here
          ],
        ),
      ),
    );
  }
}
