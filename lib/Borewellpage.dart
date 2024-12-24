import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class BorewellDataScreen extends StatefulWidget {
  const BorewellDataScreen({Key? key}) : super(key: key);

  @override
  _BorewellDataScreenState createState() => _BorewellDataScreenState();
}

class _BorewellDataScreenState extends State<BorewellDataScreen> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = false;
  DateTime? _selectedDate;
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _fetchBorewellData();
  }

  Future<void> _fetchBorewellData() async {
    setState(() => _isLoading = true);
    try {
      String url = 'http://54.146.215.18:3000/borewell';
      if (_selectedDate != null) {
        url += '?date=${DateFormat('yyyy-MM-dd').format(_selectedDate!)}';
      }
      if (_searchQuery != null) {
        url += _selectedDate != null ? '&search=$_searchQuery' : '?search=$_searchQuery';
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
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borewell Water Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _selectedDate = null;
                _searchQuery = null;
              });
              _fetchBorewellData();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Active Filters
                if (_selectedDate != null || _searchQuery != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        if (_selectedDate != null)
                          Chip(
                            label: Text(
                              'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                            ),
                            onDeleted: () {
                              setState(() => _selectedDate = null);
                              _fetchBorewellData();
                            },
                          ),
                        if (_searchQuery != null)
                          Chip(
                            label: Text('Search: $_searchQuery'),
                            onDeleted: () {
                              setState(() => _searchQuery = null);
                              _fetchBorewellData();
                            },
                          ),
                      ],
                    ),
                  ),

                // Data Table
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.all(8.0),
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.teal.shade50),
                          columnSpacing: 20.0,
                          headingTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 16,
                          ),
                          dataRowColor: MaterialStateProperty.resolveWith(
                            (Set states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.grey.shade100;
                              }
                              return null;
                            },
                          ),
                          border: TableBorder.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          columns: const [
                            DataColumn(
                              label: Text('Date', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                            DataColumn(
                              label: Text('Borewell No', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                            DataColumn(
                              label: Text('Located At', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                            DataColumn(
                              label: Text('In (KLD)', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                            DataColumn(
                              label: Text('Out (KLD)', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                            DataColumn(
                              label: Text('Consumed (KLD)', 
                                style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                          ],
                          rows: _data.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(item['date']),
                                    ),
                                  ),
                                ),
                                DataCell(Text(item['borewell_no'])),
                                DataCell(Text(item['located_at'])),
                                DataCell(Text(item['in_kld'].toString())),
                                DataCell(Text(item['out_kld'].toString())),
                                DataCell(Text(item['water_consumed'].toString())),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDataDialog,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddDataDialog() async {
    final formKey = GlobalKey<FormState>();
    final borewellNoController = TextEditingController();
    final locatedAtController = TextEditingController();
    final inKldController = TextEditingController();
    final outKldController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Borewell Data'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                  ),
                ),
                TextFormField(
                  controller: borewellNoController,
                  decoration: const InputDecoration(
                    labelText: 'Borewell Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter borewell number' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: locatedAtController,
                  decoration: const InputDecoration(
                    labelText: 'Located At',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter location' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: inKldController,
                  decoration: const InputDecoration(
                    labelText: 'In (KLD)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter in value' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: outKldController,
                  decoration: const InputDecoration(
                    labelText: 'Out (KLD)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter out value' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  final response = await http.post(
                    Uri.parse('http://54.146.215.18:3000/borewell'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({
                      'date': selectedDate.toIso8601String().split('T')[0],
                      'borewell_no': borewellNoController.text,
                      'located_at': locatedAtController.text,
                      'in_kld': double.parse(inKldController.text),
                      'out_kld': double.parse(outKldController.text),
                      'water_consumed':
                          double.parse(outKldController.text) -
                          double.parse(inKldController.text),
                    }),
                  );

                  if (response.statusCode == 201) {
                    Navigator.pop(context);
                    _fetchBorewellData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
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
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      await _fetchBorewellData();
    }
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final searchController = TextEditingController();
        return AlertDialog(
          title: const Text('Search'),
          content: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Enter borewell number or location',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _searchQuery = searchController.text;
                });
                Navigator.pop(context);
                _fetchBorewellData();
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }
}