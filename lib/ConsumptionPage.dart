import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({super.key});

  @override
  _ConsumptionPageState createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  List<Map<String, dynamic>> _data = [];
  List<String> _availableSources = [];
  String? _selectedSource;
  DateTime? _selectedDate;
  bool _isLoading = false;

  final _dateController = TextEditingController();
  final _sourceController = TextEditingController();
  final _waterSuppliedController = TextEditingController();
  final _treatedWaterController = TextEditingController();
  final _quantitySuppliedController = TextEditingController();
  final _modeOfConvergenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchConsumptionData();
    _fetchAvailableSources();
  }

  Future<void> _fetchConsumptionData() async {
    setState(() => _isLoading = true);
    try {
      String url = 'http://54.146.215.18:3000/consumption';

      if (_selectedSource != null || _selectedDate != null) {
        url += '?';
        if (_selectedSource != null) {
          url += 'source=$_selectedSource';
        }
        if (_selectedDate != null) {
          url += (_selectedSource != null ? '&' : '') +
              'date=${DateFormat('yyyy-MM-dd').format(_selectedDate!)}';
        }
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(responseData['data']);
        });
      } else {
        _showErrorDialog('Failed to fetch consumption data');
      }
    } catch (e) {
      _showErrorDialog('Error: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchAvailableSources() async {
    try {
      final response =
          await http.get(Uri.parse('http://54.146.215.18:3000/consumption/sources'));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          _availableSources = List<String>.from(responseData['sources']);
        });
      } else {
        _showErrorDialog('Failed to fetch sources');
      }
    } catch (e) {
      _showErrorDialog('Error: ${e.toString()}');
    }
  }

  void _showErrorDialog(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Water Consumption Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _selectDate,
            tooltip: 'Select Date',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: _fetchConsumptionData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            if (_selectedDate != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(
                                    'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.blue[800],
                                  deleteIcon:
                                      const Icon(Icons.close, color: Colors.white),
                                  onDeleted: () {
                                    setState(() => _selectedDate = null);
                                    _fetchConsumptionData();
                                  },
                                ),
                              ),
                            if (_selectedSource != null)
                              Chip(
                                label: Text(
                                  'Source: $_selectedSource',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.blue[800],
                                deleteIcon:
                                    const Icon(Icons.close, color: Colors.white),
                                onDeleted: () {
                                  setState(() => _selectedSource = null);
                                  _fetchConsumptionData();
                                },
                              ),
                          ],
                        ),
                      ),
                      if (_availableSources.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Filter by Source',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                value: _selectedSource,
                                items: _availableSources.map((String source) {
                                  return DropdownMenuItem<String>(
                                    value: source,
                                    child: Text(source),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() => _selectedSource = newValue);
                                  _fetchConsumptionData();
                                },
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.grey[300],
                                dataTableTheme: DataTableThemeData(
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.blue[100]!),
                                  dataRowColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                ),
                              ),
                              child: DataTable(
                                columnSpacing: 20,
                                horizontalMargin: 20,
                                headingRowHeight: 60,
                                dataRowHeight: 55,
                                headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                                columns: const [
                                  DataColumn(
                                      label: Text('No.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Source',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Water\nSupplied',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Fresh/Treated\nWater',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Quantity\nSupplied',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Mode of\nConvergence',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                ],
                                rows: _data.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  return DataRow(
                                    cells: [
                                      DataCell(Text((index + 1).toString(),
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(
                                          item['date'] != null
                                              ? DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(item['date']))
                                              : '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(item['source'] ?? '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(
                                          item['water_supplied'] ?? '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(item['treated_water'] ?? '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(
                                          item['quantity_supplied']
                                              ?.toString() ??
                                              '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                      DataCell(Text(
                                          item['mode_of_convergence'] ?? '',
                                          style:
                                              const TextStyle(fontSize: 14))),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDialog,
        backgroundColor: Colors.blue[800],
        icon: const Icon(Icons.add),
        label: const Text('Add Consumption'),
        elevation: 4,
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue[800]!,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
      _fetchConsumptionData();
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Consumption Data',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _sourceController,
                decoration: InputDecoration(
                  labelText: 'Source',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _waterSuppliedController,
                decoration: InputDecoration(
                  labelText: 'Water Supplied',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _treatedWaterController,
                decoration: InputDecoration(
                  labelText: 'Fresh/Treated Water',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _quantitySuppliedController,
                decoration: InputDecoration(
                  labelText: 'Quantity Supplied',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _modeOfConvergenceController,
                decoration: InputDecoration(
                  labelText: 'Mode of Convergence',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final response = await http.post(
                  Uri.parse('http://54.146.215.18:3000/consumption'),
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode({
                    'date': _dateController.text,
                    'source': _sourceController.text,
                    'waterSupplied': _waterSuppliedController.text,
                    'treatedWater': _treatedWaterController.text,
                    'quantitySupplied':
                        double.parse(_quantitySuppliedController.text),
                    'modeOfConvergence': _modeOfConvergenceController.text
                  }),
                );

                if (response.statusCode == 201) {
                  await _fetchConsumptionData();
                  await _fetchAvailableSources();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data added successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  // Clear all controllers
                  _dateController.clear();
                  _sourceController.clear();
                  _waterSuppliedController.clear();
                  _treatedWaterController.clear();
                  _quantitySuppliedController.clear();
                  _modeOfConvergenceController.clear();
                } else {
                  throw Exception('Failed to add data');
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${e.toString()}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
            ),
            child: const Text('Add'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _sourceController.dispose();
    _waterSuppliedController.dispose();
    _treatedWaterController.dispose();
    _quantitySuppliedController.dispose();
    _modeOfConvergenceController.dispose();
    super.dispose();
  }
}
