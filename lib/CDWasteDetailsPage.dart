// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';


// class CDWasteDetailsPage extends StatefulWidget {
//   @override
//   _WasteDetailsPageState createState() => _WasteDetailsPageState();
// }

// class _WasteDetailsPageState extends State<CDWasteDetailsPage> {
//   final TextEditingController _projectAreaController =
//       TextEditingController();
//   DateTime? _startDate;
//   DateTime? _endDate;
//   bool _isLoading = false;
//   List<dynamic> _wasteData = [];

//   void _calculateAndStoreWaste() async {
//     final double? projectArea = double.tryParse(_projectAreaController.text);

//     if (projectArea == null || projectArea <= 0) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Enter a valid project area')));
//       return;
//     }

//     final wasteEstimation = (projectArea * 0.3).toStringAsFixed(2); // Example multiplier
//     final wasteEntry = {
//       'date': DateTime.now().toIso8601String(),
//       'project_area': projectArea,
//       'waste_estimation': wasteEstimation,
//     };

//     try {
//       _isLoading = true;
//       setState(() {});

//       final response = await http.post(
//         Uri.parse('http://54.146.215.18:3000/add-waste'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(wasteEntry),
//       );

//       if (response.statusCode == 201) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Data saved successfully')));
//         _fetchWasteData(); // Refresh data after addition
//       } else {
//         throw Exception('Failed to store waste data');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error: $e')));
//     } finally {
//       _isLoading = false;
//       setState(() {});
//     }
//   }

//   Future<void> _fetchWasteData() async {
//     if (_startDate == null || _endDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Select a valid date range')),
//       );
//       return;
//     }

//     try {
//       setState(() => _isLoading = true);

//       final response = await http.get(Uri.parse(
//           'http://54.146.215.18:3000/get-waste?start_date=${DateFormat('yyyy-MM-dd').format(_startDate!)}&end_date=${DateFormat('yyyy-MM-dd').format(_endDate!)}'));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['data'];
//         setState(() {
//           _wasteData = data;
//         });
//       } else {
//         throw Exception('Failed to load waste data');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error: $e')));
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('C&D Waste Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Components of C&D Waste:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             const Text('• Concrete Waste\n• Wood Waste\n• Metal Scrap\n'
//                 '• Ceramic and Tile Waste\n• Packaging Materials'),
//             const SizedBox(height: 16),
//             const Text(
//               'Waste Generation Estimation',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _projectAreaController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: 'Project Area (m²)',
//                 hintText: 'Enter project area in square meters',
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _calculateAndStoreWaste,
//               child: const Text('Calculate and Store Waste'),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'C&D Waste Generated',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () async {
//                       final date = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100));
//                       setState(() => _startDate = date);
//                     },
//                     child: Text(_startDate == null
//                         ? 'Start Date'
//                         : DateFormat('yyyy-MM-dd').format(_startDate!)),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () async {
//                       final date = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100));
//                       setState(() => _endDate = date);
//                     },
//                     child: Text(_endDate == null
//                         ? 'End Date'
//                         : DateFormat('yyyy-MM-dd').format(_endDate!)),
//                   ),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: _fetchWasteData,
//               child: const Text('Fetch Waste Data'),
//             ),
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('ID')),
//                         DataColumn(label: Text('Date')),
//                         DataColumn(label: Text('Area (m²)')),
//                         DataColumn(label: Text('Waste (kg)')),
//                       ],
//                       rows: _wasteData
//                           .map(
//                             (item) => DataRow(
//                               cells: [
//                                 DataCell(Text(item['id'].toString())),
//                                 DataCell(Text(item['date'])),
//                                 DataCell(Text(item['project_area'].toString())),
//                                 DataCell(Text(item['waste_estimation'])),
//                               ],
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CDWasteTablePage extends StatefulWidget {
//   const CDWasteTablePage({Key? key}) : super(key: key);

//   @override
//   _CDWasteTablePageState createState() => _CDWasteTablePageState();
// }

// class _CDWasteTablePageState extends State<CDWasteTablePage> {
//   List<CDWasteEntry> wasteEntries = [];
//   bool isLoading = false;
//   double totalWaste = 0;

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _storageController = TextEditingController();
//   final TextEditingController _disposalController = TextEditingController();
//   DateTime? _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     fetchWasteData();
//   }

//   Future<void> fetchWasteData() async {
//     setState(() => isLoading = true);
//     try {
//       final response = await http.get(
//         Uri.parse('http://54.146.215.18:3000/cd-waste'),
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body)['data'];
//         setState(() {
//           wasteEntries = data.map((e) => CDWasteEntry.fromJson(e)).toList();
//           calculateTotal();
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   void calculateTotal() {
//     totalWaste = wasteEntries.fold(
//       0, (sum, entry) => sum + entry.quantity);
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   void _showAddDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add New Entry'),
//         content: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextButton(
//                   onPressed: () => _selectDate(context),
//                   child: Text(
//                     _selectedDate == null
//                         ? 'Select Date'
//                         : DateFormat('yyyy-MM-dd').format(_selectedDate!),
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _quantityController,
//                   decoration: InputDecoration(labelText: 'Quantity (kg)'),
//                   keyboardType: TextInputType.number,
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//                 TextFormField(
//                   controller: _storageController,
//                   decoration: InputDecoration(labelText: 'Mode of Storage'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//                 TextFormField(
//                   controller: _disposalController,
//                   decoration: InputDecoration(labelText: 'Mode of Disposal'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: _submitForm,
//             child: Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       if (_selectedDate == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please select a date')),
//         );
//         return;
//       }

//       try {
//         final response = await http.post(
//           Uri.parse('http://54.146.215.18:3000/cd-waste'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode({
//             'date': DateFormat('yyyy-MM-dd').format(_selectedDate!),
//             'quantity': double.parse(_quantityController.text),
//             'storage_mode': _storageController.text,
//             'disposal_mode': _disposalController.text,
//           }),
//         );

//         if (response.statusCode == 201) {
//           Navigator.pop(context);
//           fetchWasteData();
//           _resetForm();
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error adding entry: $e')),
//         );
//       }
//     }
//   }

//   void _resetForm() {
//     _selectedDate = null;
//     _quantityController.clear();
//     _storageController.clear();
//     _disposalController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('C&D Waste Data'),
//         backgroundColor: Colors.teal[700],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: [
//                   DataTable(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     headingRowColor: MaterialStateProperty.all(
//                       Colors.teal.shade50,
//                     ),
//                     columns: [
//                       DataColumn(label: Text('No.')),
//                       DataColumn(label: Text('Date')),
//                       DataColumn(label: Text('Quantity (kg)')),
//                       DataColumn(label: Text('Mode of Storage')),
//                       DataColumn(label: Text('Mode of Disposal')),
//                     ],
//                     rows: [
//                       ...wasteEntries.map((entry) => DataRow(
//                             cells: [
//                               DataCell(Text(entry.id.toString())),
//                               DataCell(Text(DateFormat('yyyy-MM-dd')
//                                   .format(entry.date))),
//                               DataCell(Text(entry.quantity.toString())),
//                               DataCell(Text(entry.storageMode)),
//                               DataCell(Text(entry.disposalMode)),
//                             ],
//                           )),
//                       DataRow(
//                         color: MaterialStateProperty.all(Colors.grey.shade200),
//                         cells: [
//                           DataCell(Text('Total',
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                           DataCell(Text('')),
//                           DataCell(Text(totalWaste.toString(),
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                           DataCell(Text('')),
//                           DataCell(Text('')),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDialog,
//         child: Icon(Icons.add),
//         backgroundColor: Colors.teal[700],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _quantityController.dispose();
//     _storageController.dispose();
//     _disposalController.dispose();
//     super.dispose();
//   }
// }

// class CDWasteEntry {
//   final int id;
//   final DateTime date;
//   final double quantity;
//   final String storageMode;
//   final String disposalMode;

//   CDWasteEntry({
//     required this.id,
//     required this.date,
//     required this.quantity,
//     required this.storageMode,
//     required this.disposalMode,
//   });

//   factory CDWasteEntry.fromJson(Map<String, dynamic> json) {
//     return CDWasteEntry(
//       id: json['id'],
//       date: DateTime.parse(json['date']),
//       quantity: json['quantity_kg'].toDouble(),
//       storageMode: json['storage_mode'],
//       disposalMode: json['disposal_mode'],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

// Constants
const double kSpacing = 16.0;
const EdgeInsets kPadding = EdgeInsets.all(kSpacing);
const String baseUrl = 'http://54.146.215.18:3000';

class CDWasteDetailsPage extends StatefulWidget {
  @override
  _CDWasteDetailsPageState createState() => _CDWasteDetailsPageState();
}

class _CDWasteDetailsPageState extends State<CDWasteDetailsPage> {
  final TextEditingController _projectAreaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isLoading = false;
  List<dynamic> _wasteData = [];

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse('$baseUrl/cd-waste'));
      if (response.statusCode == 200) {
        setState(() {
          _wasteData = json.decode(response.body)['data'];
        });
      } else {
        _showError('Failed to fetch initial data');
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Future<void> _calculateAndStoreWaste() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cd-waste/calculate'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'projectArea': double.parse(_projectAreaController.text),
          'startDate': _startDate?.toIso8601String(),
          'endDate': _endDate?.toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _wasteData.add(data);
        });
        _showSuccess('Waste calculation stored successfully');
      } else {
        _showError('Failed to calculate waste');
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('C&D Waste Details'),
          centerTitle: true,
          elevation: 0,
        ),
        body: _isLoading
            ? _buildLoadingIndicator()
            : _buildContent(),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
          SizedBox(height: kSpacing),
          Text('Loading data...'),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: kPadding,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWasteComponentsCard(),
            SizedBox(height: kSpacing),
            _buildCalculationSection(),
            SizedBox(height: kSpacing),
            _buildWasteDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildWasteComponentsCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Components of C&D Waste',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            Divider(),
            _buildWasteComponent('Concrete Waste'),
            _buildWasteComponent('Wood Waste'),
            _buildWasteComponent('Metal Scrap'),
            _buildWasteComponent('Ceramic and Tile Waste'),
            _buildWasteComponent('Packaging Materials'),
          ],
        ),
      ),
    );
  }

  Widget _buildWasteComponent(String text) {
    return ListTile(
      leading: Icon(Icons.circle, size: 8),
      title: Text(text),
      dense: true,
    );
  }

  Widget _buildCalculationSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waste Generation Estimation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            SizedBox(height: kSpacing),
            TextFormField(
              controller: _projectAreaController,
              decoration: InputDecoration(
                labelText: 'Project Area (m²)',
                hintText: 'Enter project area in square meters',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
                prefixIcon: Icon(Icons.area_chart, color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter project area';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            SizedBox(height: kSpacing),
            _buildDateSelectionRow(),
            SizedBox(height: kSpacing),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _calculateAndStoreWaste,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(width: 8),
                    Text('Calculate and Store Waste'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelectionRow() {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.calendar_today),
            label: Text(
              _startDate == null
                  ? 'Select Start Date'
                  : DateFormat('yyyy-MM-dd').format(_startDate!),
            ),
            onPressed: () => _selectDate(true),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.calendar_today),
            label: Text(
              _endDate == null
                  ? 'Select End Date'
                  : DateFormat('yyyy-MM-dd').format(_endDate!),
            ),
            onPressed: () => _selectDate(false),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Widget _buildWasteDataTable() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waste Data History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            SizedBox(height: kSpacing),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                    MaterialStateProperty.all(Colors.teal.shade50),
                columns: [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Project Area (m²)')),
                  DataColumn(label: Text('Waste Amount (kg)')),
                ],
                rows: _wasteData.map<DataRow>((waste) {
                  return DataRow(
                    cells: [
                      DataCell(Text(DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(waste['date'])))),
                      DataCell(Text(waste['projectArea'].toString())),
                      DataCell(Text(waste['wasteAmount'].toString())),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _projectAreaController.dispose();
    super.dispose();
  }
}
