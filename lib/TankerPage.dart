import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class TankerDataScreen extends StatefulWidget {
  const TankerDataScreen({Key? key}) : super(key: key);

  @override
  _TankerDataScreenState createState() => _TankerDataScreenState();
}

class _TankerDataScreenState extends State<TankerDataScreen> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _fetchTankerData();
  }

  Future<void> _fetchTankerData() async {
    setState(() => _isLoading = true);
    try {
      String url = 'http://54.146.215.18:3000/tanker';
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
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tanker Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
            tooltip: 'Select Date',
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
            tooltip: 'Search',
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
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: _fetchTankerData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      if (_selectedDate != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(
                              'Showing data for: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blue[800],
                            deleteIcon: const Icon(Icons.close, color: Colors.white),
                            onDeleted: () {
                              setState(() {
                                _selectedDate = null;
                              });
                              _fetchTankerData();
                            },
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
                                columnSpacing: 24,
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
                                    label: Text('No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Date',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Tanker No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Meter\nProvided',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('In\n(KLD)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Out\n(KLD)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Water\nConsumed',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                rows: _data.map((item) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(
                                        item['slno'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            DateTime.parse(item['date'])),
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        item['tanker_no'],
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        item['meter_provided'],
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        item['in_kld'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        item['out_kld'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      )),
                                      DataCell(Text(
                                        item['water_consumed'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      )),
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTankerDataDialog(
              refreshData: _fetchTankerData,
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Data'),
        backgroundColor: Colors.blue[800],
        elevation: 4,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      await _fetchTankerData();
    }
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final searchController = TextEditingController();
        return AlertDialog(
          title: const Text('Search Tanker',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Enter tanker number',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement search functionality
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
              ),
              child: const Text('Search'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }
}

class AddTankerDataDialog extends StatefulWidget {
  final Function refreshData;

  const AddTankerDataDialog({Key? key, required this.refreshData})
      : super(key: key);

  @override
  _AddTankerDataDialogState createState() => _AddTankerDataDialogState();
}

class _AddTankerDataDialogState extends State<AddTankerDataDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _slnoController = TextEditingController();
  final TextEditingController _tankerNoController = TextEditingController();
  final TextEditingController _inKldController = TextEditingController();
  final TextEditingController _outKldController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _meterProvided = 'Yes';

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('http://54.146.215.18:3000/tanker'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'slno': int.parse(_slnoController.text),
            'date': _selectedDate.toIso8601String().split('T')[0],
            'tanker_no': _tankerNoController.text,
            'meter_provided': _meterProvided,
            'in_kld': double.parse(_inKldController.text),
            'out_kld': double.parse(_outKldController.text),
            'water_consumed': double.parse(_outKldController.text) -
                double.parse(_inKldController.text)
          }),
        );

        if (response.statusCode == 201) {
          widget.refreshData();
          Navigator.pop(context);
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
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Tanker Data',
          style: TextStyle(fontWeight: FontWeight.bold)),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _slnoController,
                decoration: InputDecoration(
                  labelText: 'Serial Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter serial number' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                title:
                    Text('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tankerNoController,
                decoration: InputDecoration(
                  labelText: 'Tanker Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter tanker number' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _meterProvided,
                decoration: InputDecoration(
                  labelText: 'Meter Provided',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ['Yes', 'No'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _meterProvided = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _inKldController,
                decoration: InputDecoration(
                  labelText: 'In (KLD)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter in value' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _outKldController,
                decoration: InputDecoration(
                  labelText: 'Out (KLD)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
          onPressed: _submitData,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[800],
          ),
          child: const Text('Submit'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void dispose() {
    _slnoController.dispose();
    _tankerNoController.dispose();
    _inKldController.dispose();
    _outKldController.dispose();
    super.dispose();
  }
}