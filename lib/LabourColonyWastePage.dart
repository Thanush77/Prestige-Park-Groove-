import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';


class LabourColonyWastePage extends StatefulWidget {
  const LabourColonyWastePage({Key? key}) : super(key: key);

  @override
  _LabourColonyWastePageState createState() => _LabourColonyWastePageState();
}

class _LabourColonyWastePageState extends State<LabourColonyWastePage> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _fetchWasteData();
  }

  Future<void> _fetchWasteData() async {
    setState(() => _isLoading = true);
    try {
      String url = 'http://54.146.215.18:3000/labour-colony-waste';
      if (_selectedDate != null) {
        url += '?date=${DateFormat('yyyy-MM-dd').format(_selectedDate!)}';
      }
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _createWasteData() async {
    final newData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => NewWasteDataDialog(),
    );

    if (newData != null) {
      try {
        setState(() => _isLoading = true);
        final response = await http.post(
          Uri.parse('http://54.146.215.18:3000/labour-colony-waste'),
          body: jsonEncode(newData),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          setState(() {
            _data.add(newData);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New waste data added successfully')),
          );
        } else {
          throw Exception('Failed to create new waste data');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labour Colony Waste Data'),
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Quantity (kg)')),
                    DataColumn(label: Text('Mode of Storage')),
                    DataColumn(label: Text('Mode of Disposal')),
                  ],
                  rows: _data.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item['no'].toString())),
                      DataCell(Text(DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(item['date'])))),
                      DataCell(Text(item['quantity'].toString())),
                      DataCell(Text(item['storage_mode'])),
                      DataCell(Text(item['disposal_mode'])),
                    ]);
                  }).toList(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createWasteData,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewWasteDataDialog extends StatefulWidget {
  @override
  _NewWasteDataDialogState createState() => _NewWasteDataDialogState();
}

class _NewWasteDataDialogState extends State<NewWasteDataDialog> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _quantityController = TextEditingController();
  final _storageController = TextEditingController();
  final _disposalController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _quantityController.dispose();
    _storageController.dispose();
    _disposalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Waste Data'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a date';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Quantity (kg)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the quantity';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _storageController,
              decoration: const InputDecoration(labelText: 'Mode of Storage'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the mode of storage';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _disposalController,
              decoration: const InputDecoration(labelText: 'Mode of Disposal'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the mode of disposal';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop({
                'date': _dateController.text,
                'quantity': int.parse(_quantityController.text),
                'storage_mode': _storageController.text,
                'disposal_mode': _disposalController.text,
              });
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}