
// import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// class WaterConsumptionPage extends StatefulWidget {
//   const WaterConsumptionPage({super.key});

//   @override
//   _WaterConsumptionPageState createState() => _WaterConsumptionPageState();
// }

// class _WaterConsumptionPageState extends State<WaterConsumptionPage> {
//   // Starting year and current year
//   int startYear = DateTime.now().year - 4;
//   int currentYear = DateTime.now().year;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Water Consumption'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Header Section
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.teal[50],
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     'Water Management during the entire stage of construction',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Track and manage water consumption efficiently',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Efficient water management is crucial for sustainable development.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Track your water consumption regularly to ensure optimal usage.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
            
//             // Dynamic Year Range Bar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(5, (index) {
//                 int year = startYear + index;
//                 bool isCurrentYear = year == currentYear;
                
//                 return ElevatedButton(
//                   onPressed: () {
//                     // TODO: Add functionality for each year button
//                     print('Selected Year: $year');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(16),
//                     backgroundColor: isCurrentYear ? Colors.teal : Colors.teal[200],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     '$year',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 20),
            
//             // Project Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ProjectOptionsPage()
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Project Water Consumption',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
            
//             // Labour Colony Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LabourColonyPage()
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text(
//                 'Labour Colony',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
            
//             // Additional Info Section
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.teal[50],
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Details of Water consumption in Project and Labour Colony',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildConsumptionRing('Total', '5000 L'),
//                       _buildConsumptionRing('This Month', '1500 L'),
//                       _buildConsumptionRing('Today', '50 L'),
//                     ],
//                   ),
//                 ],
//               ),
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Details of Water consumption in Project and Labour Colony',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//               Widget _buildConsumptionRing(String label, String value) {
//                 return Column(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.teal, width: 5),
//                       ),
//                       child: Center(
//                         child: Text(
//                           value,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.teal,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       label,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 );
//               }
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 );
//               }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProjectLabourColonyPage extends StatelessWidget {
//   const ProjectLabourColonyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Water Consumption'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildFeatureButton(
//             context,
//             'Project',
//             Icons.business,
//             const ProjectOptionsPage(),
//           ),
//           _buildFeatureButton(
//             context,
//             'Labour Colony',
//             Icons.people,
//             const LabourColonyPage(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureButton(
//       BuildContext context, String title, IconData icon, Widget page) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton.icon(
//         icon: Icon(icon, size: 28),
//         label: Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(16),
//           backgroundColor: Colors.teal,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         ),
//       ),
//     );
//   }
// }

// class ProjectOptionsPage extends StatelessWidget {
//   const ProjectOptionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Project Options'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildFeatureButton(
//             context,
//             'Source of Water',
//             Icons.water,
//             const SourcePage(),
//           ),
//           _buildFeatureButton(
//             context,
//             'Consumption of Water',
//             Icons.bar_chart,
//             const ConsumptionPage(),
//           ),
//           _buildFeatureButton(
//             context,
//             'Sewage Water',
//             Icons.water_damage,
//             const SewagePage(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureButton(
//       BuildContext context, String title, IconData icon, Widget page) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton.icon(
//         icon: Icon(icon, size: 28, color: Colors.white),
//         label: Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(16),
//           backgroundColor: Colors.teal,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         ),
//       ),
//     );
//   }
// }

// class SourcePage extends StatelessWidget {
//   const SourcePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Source of Water'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildFeatureButton(
//             context,
//             'Borewell',
//             Icons.local_drink,
//             const BorewellWaterPage(),
//           ),
//           _buildFeatureButton(
//             context,
//             'BWSSB',
//             Icons.water,
//             const SourceDetailsPage(source: 'BWSSB'),
//           ),
//           _buildFeatureButton(
//             context,
//             'Tanker',
//             Icons.local_drink,
//             const TankerPage(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureButton(
//       BuildContext context, String title, IconData icon, Widget page) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton.icon(
//         icon: Icon(icon, size: 28),
//         label: Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(16),
//           backgroundColor: Colors.teal,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         ),
//       ),
//     );
//   }
// }

// class SourceDetailsPage extends StatelessWidget {
//   final String source;
//   const SourceDetailsPage({super.key, required this.source});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(source),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.info, size: 100, color: Colors.teal),
//               const SizedBox(height: 20),
//               Text(
//                 'Details about $source',
//                 style:
//                     const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Here you can add more detailed information about the water source.',
//                 style: const TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ConsumptionPage extends StatefulWidget {
//   const ConsumptionPage({super.key});

//   @override
//   _ConsumptionPageState createState() => _ConsumptionPageState();
// }

// class _ConsumptionPageState extends State<ConsumptionPage> {
//   List<Map<String, dynamic>> _data = [];
//   List<String> _availableSources = [];
//   String? _selectedSource;
//   DateTime? _selectedDate;

//   final _dateController = TextEditingController();
//   final _sourceController = TextEditingController();
//   final _consumptionController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchConsumptionData();
//     _fetchAvailableSources();
//   }

//   Future<void> _fetchConsumptionData() async {
//     try {
//       String url = 'http://192.168.0.168:3000/consumption';
      
//       // Add query parameters if filters are applied
//       if (_selectedSource != null || _selectedDate != null) {
//         url += '?';
//         if (_selectedSource != null) {
//           url += 'source=$_selectedSource';
//         }
//         if (_selectedDate != null) {
//           url += (_selectedSource != null ? '&' : '') + 
//                  'date=${_selectedDate!.toIso8601String().split('T')[0]}';
//         }
//       }

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           _data = List<Map<String, dynamic>>.from(responseData['data']);
//         });
//       } else {
//         _showErrorDialog('Failed to fetch consumption data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   Future<void> _fetchAvailableSources() async {
//     try {
//       final response = await http.get(Uri.parse('http://192.168.0.168:3000/consumption/sources'));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           _availableSources = List<String>.from(responseData['sources']);
//         });
//       } else {
//         _showErrorDialog('Failed to fetch sources');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   Future<void> _addConsumptionData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.0.168:3000/consumption'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'date': _dateController.text,
//           'source': _sourceController.text,
//           'consumption': double.parse(_consumptionController.text)
//         }),
//       );

//       if (response.statusCode == 201) {
//         // Refresh data after adding
//         await _fetchConsumptionData();
//         await _fetchAvailableSources();
        
//         // Clear controllers
//         _dateController.clear();
//         _sourceController.clear();
//         _consumptionController.clear();
//       } else {
//         final responseBody = json.decode(response.body);
//         _showErrorDialog(responseBody['error'] ?? 'Failed to add consumption data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       await _fetchConsumptionData();
//     }
//   }

//   void _showAddDataDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Add New Entry'),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _dateController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date (DD-MM-YYYY)',
//                   hintText: 'Enter date in DD-MM-YYYY format',
//                 ),
//                 keyboardType: TextInputType.datetime,
//               ),
//               TextField(
//                 controller: _sourceController,
//                 decoration: const InputDecoration(labelText: 'Source'),
//               ),
//               TextField(
//                 controller: _consumptionController,
//                 decoration: const InputDecoration(
//                   labelText: 'Consumption (KLD)',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               _addConsumptionData();
//               Navigator.pop(context);
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Consumption Details'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               setState(() {
//                 _selectedDate = null;
//                 _selectedSource = null;
//               });
//               _fetchConsumptionData();
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         child: const Icon(Icons.add),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Filter chips
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 spacing: 8.0,
//                 children: [
//                   if (_selectedDate != null)
//                     Chip(
//                       label: Text(
//                         'Date: ${_selectedDate!.toIso8601String().split('T')[0]}',
//                       ),
//                       onDeleted: () {
//                         setState(() => _selectedDate = null);
//                         _fetchConsumptionData();
//                       },
//                     ),
//                   if (_selectedSource != null)
//                     Chip(
//                       label: Text('Source: $_selectedSource'),
//                       onDeleted: () {
//                         setState(() => _selectedSource = null);
//                         _fetchConsumptionData();
//                       },
//                     ),
//                 ],
//               ),
//             ),

//             // Source filter dropdown
//             if (_availableSources.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: DropdownButton<String>(
//                   hint: const Text('Filter by Source'),
//                   value: _selectedSource,
//                   items: _availableSources.map((String source) {
//                     return DropdownMenuItem<String>(
//                       value: source,
//                       child: Text(source),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedSource = newValue;
//                     });
//                     _fetchConsumptionData();
//                   },
//                 ),
//               ),

//             // Data table
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Date')),
//                   DataColumn(label: Text('Source')),
//                   DataColumn(label: Text('Consumption (KLD)')),
//                 ],
//                 rows: _data
//                     .map((item) => DataRow(
//                           cells: [
//                             DataCell(Text(item['date'] ?? '')),
//                             DataCell(Text(item['source'] ?? '')),
//                             DataCell(Text(item['consumption']?.toString() ?? '')),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//     _sourceController.dispose();
//     _consumptionController.dispose();
//     super.dispose();
//   }
// }
// class SewagePage extends StatelessWidget {
//   const SewagePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sewage'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const StpPage()));
//             },
//             child: const Text('STP'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LabourColonyPage()));
//             },
//             child: const Text('Labour Colony'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StpPage extends StatelessWidget {
//   const StpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('STP'),
//       ),
//       body: const Center(
//           child: Text('Not Completed Project under Implementation')),
//     );
//   }
// }



// class LabourColonyPage extends StatefulWidget {
//   const LabourColonyPage({super.key});

//   @override
//   State<LabourColonyPage> createState() => _LabourColonyPageState();
// }

// class _LabourColonyPageState extends State<LabourColonyPage> {
//   final List<Map<String, String>> _data = [];
//   DateTime? _selectedDate;

//   // Controllers for text fields
//   final _dateController = TextEditingController();
//   final _sourceController = TextEditingController();
//   final _consumptionController = TextEditingController();
//   final _dischargeController = TextEditingController();
//   final _dischargedToController = TextEditingController();
//   final _modeController = TextEditingController();

//   List<Map<String, String>> get filteredData {
//     if (_selectedDate == null) return _data;
//     return _data
//         .where((item) =>
//             item['date'] ==
//             '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}')
//         .toList();
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   void _showAddDataDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Add New Entry'),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _dateController,
//                 decoration:
//                     const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
//               ),
//               TextField(
//                 controller: _sourceController,
//                 decoration: const InputDecoration(labelText: 'Source'),
//               ),
//               TextField(
//                 controller: _consumptionController,
//                 decoration:
//                     const InputDecoration(labelText: 'Consumption (KLD)'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _dischargeController,
//                 decoration: const InputDecoration(labelText: 'Discharge'),
//               ),
//               TextField(
//                 controller: _dischargedToController,
//                 decoration: const InputDecoration(labelText: 'Discharged To'),
//               ),
//               TextField(
//                 controller: _modeController,
//                 decoration:
//                     const InputDecoration(labelText: 'Mode of Transport'),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _data.add({
//                   'date': _dateController.text,
//                   'source': _sourceController.text,
//                   'consumption': _consumptionController.text,
//                   'discharge': _dischargeController.text,
//                   'dischargedTo': _dischargedToController.text,
//                   'mode': _modeController.text,
//                 });
//               });
//               Navigator.pop(context);
//               // Clear controllers
//               _dateController.clear();
//               _sourceController.clear();
//               _consumptionController.clear();
//               _dischargeController.clear();
//               _dischargedToController.clear();
//               _modeController.clear();
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Labour Colony Consumption'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               setState(() {
//                 _selectedDate = null;
//               });
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         child: const Icon(Icons.add),
//       ),
//       body: Column(
//         children: [
//           if (_selectedDate != null)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Chip(
//                 label: Text(
//                   'Filtered: ${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
//                 ),
//                 onDeleted: () => setState(() => _selectedDate = null),
//               ),
//             ),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: DataTable(
//                   headingRowColor:
//                       MaterialStateProperty.all(Colors.teal.shade50),
//                   columns: const [
//                     DataColumn(label: Text('Date')),
//                     DataColumn(label: Text('Source')),
//                     DataColumn(label: Text('Consumption (KLD)')),
//                     DataColumn(label: Text('Discharge')),
//                     DataColumn(label: Text('Discharged To')),
//                     DataColumn(label: Text('Mode of Transport')),
//                   ],
//                   rows: filteredData
//                       .map((item) => DataRow(
//                             cells: [
//                               DataCell(Text(item['date'] ?? '')),
//                               DataCell(Text(item['source'] ?? '')),
//                               DataCell(Text(item['consumption'] ?? '')),
//                               DataCell(Text(item['discharge'] ?? '')),
//                               DataCell(Text(item['dischargedTo'] ?? '')),
//                               DataCell(Text(item['mode'] ?? '')),
//                             ],
//                           ))
//                       .toList(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//     _sourceController.dispose();
//     _consumptionController.dispose();
//     _dischargeController.dispose();
//     _dischargedToController.dispose();
//     _modeController.dispose();
//     super.dispose();
//   }
// }




// class BorewellWaterPage extends StatefulWidget {
//   const BorewellWaterPage({Key? key}) : super(key: key);

//   @override
//   _BorewellWaterPageState createState() => _BorewellWaterPageState();
// }

// class _BorewellWaterPageState extends State<BorewellWaterPage> {
//   List<Map<String, dynamic>> _data = [];
//   DateTime? _selectedDate;
//   String? _searchQuery;

//   // Controllers for add data dialog
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _borewell1Controller = TextEditingController();
//   final TextEditingController _borewell2Controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchBorewellData();
//   }

//   Future<void> _fetchBorewellData() async {
//     try {
//       String url = 'http://192.168.0.168:3000/borewell';

//       // Add query parameters if filters are applied
//       if (_selectedDate != null || _searchQuery != null) {
//         url += '?';
//         if (_selectedDate != null) {
//           url += 'date=${_selectedDate!.toIso8601String().split('T')[0]}';
//         }
//         if (_searchQuery != null) {
//           url += (_selectedDate != null ? '&' : '') + 'search=$_searchQuery';
//         }
//       }

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           _data = List<Map<String, dynamic>>.from(responseData['data']);
//         });
//       } else {
//         _showErrorDialog('Failed to fetch borewell data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   // New method to add borewell data
//   Future<void> _addBorewellData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.0.168:3000/borewell'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'date': _dateController.text,
//           'borewell1': double.parse(_borewell1Controller.text),
//           'borewell2': double.parse(_borewell2Controller.text),
//           'total_water_consumption': 
//             double.parse(_borewell1Controller.text) + 
//             double.parse(_borewell2Controller.text),
//         }),
//       );

//       if (response.statusCode == 201) {
//         // Refresh data after successful addition
//         await _fetchBorewellData();
//         Navigator.of(context).pop(); // Close the dialog
        
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Data added successfully')),
//         );
//       } else {
//         _showErrorDialog('Failed to add borewell data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   void _showAddDataDialog() {
//     // Reset controllers
//     _dateController.text = DateTime.now().toIso8601String().split('T')[0];
//     _borewell1Controller.clear();
//     _borewell2Controller.clear();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Borewell Data'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _dateController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date',
//                   hintText: 'YYYY-MM-DD',
//                 ),
//                 keyboardType: TextInputType.datetime,
//               ),
//               TextField(
//                 controller: _borewell1Controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Borewell 1 (KLD)',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _borewell2Controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Borewell 2 (KLD)',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate inputs
//                 if (_dateController.text.isEmpty ||
//                     _borewell1Controller.text.isEmpty ||
//                     _borewell2Controller.text.isEmpty) {
//                   _showErrorDialog('Please fill all fields');
//                   return;
//                 }
                
//                 _addBorewellData();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       await _fetchBorewellData();
//     }
//   }

//   void _showSearchDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final _searchController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Search'),
//           content: TextField(
//             controller: _searchController,
//             decoration: const InputDecoration(hintText: 'Enter search query'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _searchQuery = _searchController.text;
//                 });
//                 Navigator.pop(context);
//                 _fetchBorewellData();
//               },
//               child: const Text('Search'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Borewell Water Data'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: _showSearchDialog,
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               setState(() {
//                 _selectedDate = null;
//                 _searchQuery = null;
//               });
//               _fetchBorewellData();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Filter chips
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 spacing: 8.0,
//                 children: [
//                   if (_selectedDate != null)
//                     Chip(
//                       label: Text(
//                         'Date: ${_selectedDate!.toIso8601String().split('T')[0]}',
//                       ),
//                       onDeleted: () {
//                         setState(() => _selectedDate = null);
//                         _fetchBorewellData();
//                       },
//                     ),
//                   if (_searchQuery != null)
//                     Chip(
//                       label: Text('Search: $_searchQuery'),
//                       onDeleted: () {
//                         setState(() => _searchQuery = null);
//                         _fetchBorewellData();
//                       },
//                     ),
//                 ],
//               ),
//             ),

//             // Data table
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Sl No')),
//                   DataColumn(label: Text('Date')),
//                   DataColumn(label: Text('Borewell 1 (KLD)')),
//                   DataColumn(label: Text('Borewell 2 (KLD)')),
//                   DataColumn(label: Text('Total Water Consumption (KLD)')),
//                 ],
//                 rows: _data
//                     .map((item) => DataRow(
//                           cells: [
//                             DataCell(Text(item['slno'].toString())),
//                             DataCell(Text(item['date'] ?? '')),
//                             DataCell(Text(item['borewell1'].toString())),
//                             DataCell(Text(item['borewell2'].toString())),
//                             DataCell(Text(item['total_water_consumption'].toString())),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Add a floating action button to add new data
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
// class TankerPage extends StatefulWidget {
//   const TankerPage({Key? key}) : super(key: key);

//   @override
//   _TankerPageState createState() => _TankerPageState();
// }

// class _TankerPageState extends State<TankerPage> {
//   List<Map<String, dynamic>> _data = [];
//   DateTime? _selectedDate;
//   String? _searchQuery;

//   // Controllers for add data dialog
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _tanker1Controller = TextEditingController();
//   final TextEditingController _tanker2Controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchTankerData();
//   }

//   Future<void> _fetchTankerData() async {
//     try {
//       String url = 'http://192.168.0.168:3000/tanker';

//       // Add query parameters if filters are applied
//       if (_selectedDate != null || _searchQuery != null) {
//         url += '?';
//         if (_selectedDate != null) {
//           url += 'date=${_selectedDate!.toIso8601String().split('T')[0]}';
//         }
//         if (_searchQuery != null) {
//           url += (_selectedDate != null ? '&' : '') + 'search=$_searchQuery';
//         }
//       }

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           _data = List<Map<String, dynamic>>.from(responseData['data']);
//         });
//       } else {
//         _showErrorDialog('Failed to fetch tanker data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   Future<void> _addTankerData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.0.168:3000/tanker'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'date': _dateController.text,
//           'tanker1': double.parse(_tanker1Controller.text),
//           'tanker2': double.parse(_tanker2Controller.text),
//           'total_water_consumption': 
//             double.parse(_tanker1Controller.text) + 
//             double.parse(_tanker2Controller.text),
//         }),
//       );

//       if (response.statusCode == 201) {
//         // Refresh data after successful addition
//         await _fetchTankerData();
//         Navigator.of(context).pop(); // Close the dialog
        
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Data added successfully')),
//         );
//       } else {
//         _showErrorDialog('Failed to add tanker data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   void _showAddDataDialog() {
//     // Reset controllers
//     _dateController.text = DateTime.now().toIso8601String().split('T')[0];
//     _tanker1Controller.clear();
//     _tanker2Controller.clear();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Tanker Data'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _dateController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date',
//                   hintText: 'YYYY-MM-DD',
//                 ),
//                 keyboardType: TextInputType.datetime,
//               ),
//               TextField(
//                 controller: _tanker1Controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Tanker 1 (KLD)',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: _tanker2Controller,
//                 decoration: const InputDecoration(
//                   labelText: 'Tanker 2 (KLD)',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate inputs
//                 if (_dateController.text.isEmpty ||
//                     _tanker1Controller.text.isEmpty ||
//                     _tanker2Controller.text.isEmpty) {
//                   _showErrorDialog('Please fill all fields');
//                   return;
//                 }
                
//                 _addTankerData();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       await _fetchTankerData();
//     }
//   }

//   void _showSearchDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final _searchController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Search'),
//           content: TextField(
//             controller: _searchController,
//             decoration: const InputDecoration(hintText: 'Enter search query'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _searchQuery = _searchController.text;
//                 });
//                 Navigator.pop(context);
//                 _fetchTankerData();
//               },
//               child: const Text('Search'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tanker Water Data'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: _showSearchDialog,
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               setState(() {
//                 _selectedDate = null;
//                 _searchQuery = null;
//               });
//               _fetchTankerData();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Filter chips
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 spacing: 8.0,
//                 children: [
//                   if (_selectedDate != null)
//                     Chip(
//                       label: Text(
//                         'Date: ${_selectedDate!.toIso8601String().split('T')[0]}',
//                       ),
//                       onDeleted: () {
//                         setState(() => _selectedDate = null);
//                         _fetchTankerData();
//                       },
//                     ),
//                   if (_searchQuery != null)
//                     Chip(
//                       label: Text('Search: $_searchQuery'),
//                       onDeleted: () {
//                         setState(() => _searchQuery = null);
//                         _fetchTankerData();
//                       },
//                     ),
//                 ],
//               ),
//             ),

//             // Data table
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Sl No')),
//                   DataColumn(label: Text('Date')),
//                   DataColumn(label: Text('Tanker 1 (KLD)')),
//                   DataColumn(label: Text('Tanker 2 (KLD)')),
//                   DataColumn(label: Text('Total Water Consumption (KLD)')),
//                 ],
//                 rows: _data
//                     .map((item) => DataRow(
//                           cells: [
//                             DataCell(Text(item['slno'].toString())),
//                             DataCell(Text(item['date'] ?? '')),
//                             DataCell(Text(item['tanker1'].toString())),
//                             DataCell(Text(item['tanker2'].toString())),
//                             DataCell(Text(item['total_water_consumption'].toString())),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Add a floating action button to add new data
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WaterConsumptionData {
  final int total;
  final int thisMonth;
  final int today;

  WaterConsumptionData({
    required this.total,
    required this.thisMonth,
    required this.today,
  });

  // Factory constructor to parse JSON
  factory WaterConsumptionData.fromJson(Map<String, dynamic> json) {
    return WaterConsumptionData(
      total: json['total'] ?? 0,
      thisMonth: json['thisMonth'] ?? 0,
      today: json['today'] ?? 0,
    );
  }
}

class WaterConsumptionPage extends StatefulWidget {
  const WaterConsumptionPage({super.key});

  @override
  _WaterConsumptionPageState createState() => _WaterConsumptionPageState();
}

class _WaterConsumptionPageState extends State<WaterConsumptionPage> {
  int startYear = 2024;
  late int currentYear;
  WaterConsumptionData _consumptionData = WaterConsumptionData(
    total: 5000,
    thisMonth: 1500,
    today: 50,
  );
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    currentYear = startYear + 5;
    _fetchWaterConsumptionData();
  }

  Future<void> _fetchWaterConsumptionData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.get(
        Uri.parse('http://0.0.0.0:3000/water-consumption'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _consumptionData = WaterConsumptionData.fromJson(jsonData);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load water consumption data';
          _isLoading = false;
        });
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: ${e.toString()}';
        _isLoading = false;
      });
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Consumption'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchWaterConsumptionData,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _fetchWaterConsumptionData,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildHeaderContainer(),
            const SizedBox(height: 16),
            _buildYearSelectionRow(),
            const SizedBox(height: 20),
            _buildNavigationButton(
              'Project Water Management',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProjectOptionsPage(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildNavigationButton(
              'Labour Colony',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LabourColonyPage(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildConsumptionDetailsContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: _buildBoxDecoration(),
      child: const Text(
        'Water Management during the entire stage of construction',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildYearSelectionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        int year = startYear + index;
        bool isCurrentYear = year == currentYear;

        return ElevatedButton(
          onPressed: () {
            print('Selected Year: $year');
            setState(() {
              currentYear = year;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: isCurrentYear ? Colors.teal : Colors.teal[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '$year',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildConsumptionDetailsContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: _buildBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Details of Water Consumption in Project and Labour Colony',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _isLoading
              ? const CircularProgressIndicator(color: Colors.teal)
              : _errorMessage.isNotEmpty
                  ? Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildConsumptionRing(
                            'Total', '${_consumptionData.total} L'),
                        _buildConsumptionRing(
                            'This Month', '${_consumptionData.thisMonth} L'),
                        _buildConsumptionRing(
                            'Today', '${_consumptionData.today} L'),
                      ],
                    ),
        ],
      ),
    );
  }

  Widget _buildConsumptionRing(String label, String value) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.teal, width: 5),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.teal[50],
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}


// Placeholder for other pages - you'll need to implement these
class ProjectOptionsPage extends StatelessWidget {
  const ProjectOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Water Options'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFeatureButton(
            context,
            'Source of Water',
            Icons.water,
            const SourcePage(),
          ),
          _buildFeatureButton(
            context,
            'Consumption of Water',
            Icons.bar_chart,
            const ConsumptionPage(),
          ),
          _buildFeatureButton(
            context,
            'Sewage Water',
            Icons.water_damage,
            const SewagePage(),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context, 
    String title, 
    IconData icon, 
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28, color: Colors.white),
        label: Text(
          title, 
          style: const TextStyle(fontSize: 18, color: Colors.white)
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}

// Placeholder classes for other pages
// class LabourColonyPage extends StatelessWidget {
//   const LabourColonyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Labour Colony'),
//         backgroundColor: Colors.teal,
//       ),
//       body: const Center(
//         child: Text('Labour Colony Water Management'),
//       ),
//     );
//   }
// }

class SourcePage extends StatelessWidget {
  const SourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Source'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSourceButton(
            context,
            'Borewell',
            Icons.local_drink,
            const BorewellDataScreen(),
          ),
          _buildSourceButton(
            context,
            'BWSSB',
            Icons.water,
            const SourceDetailsPage(source: 'BWSSB'),
          ),
          _buildSourceButton(
            context,
            'Tanker',
            Icons.local_drink,
            const TankerDataScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceButton(
    BuildContext context, 
    String title, 
    IconData icon, 
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28, color: Colors.white),
        label: Text(
          title, 
          style: const TextStyle(fontSize: 18, color: Colors.white)
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}

class SourceDetailsPage extends StatelessWidget {
  final String source;
  const SourceDetailsPage({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(source),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info, size: 100, color: Colors.teal),
              const SizedBox(height: 20),
              Text(
                'Details about $source',
                style: const TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Here you can add more detailed information about the $source water source.',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder classes for additional pages
// class ConsumptionPage extends StatelessWidget {
//   const ConsumptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Water Consumption'),
//         backgroundColor: Colors.teal,
//       ),
//       body: const Center(
//         child: Text('Water Consumption Details'),
//       ),
//     );
//   }
// }

// class SewagePage extends StatelessWidget {
//   const SewagePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sewage Water'),
//         backgroundColor: Colors.teal,
//       ),
//       body: const Center(
//         child: Text('Sewage Water Management'),
//       ),
//     );
//   }
// }

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
      String url = 'http://0.0.0.0:3000/consumption';

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
          await http.get(Uri.parse('http://0.0.0.0:3000/consumption/sources'));

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
                  Uri.parse('http://0.0.0.0:3000/consumption'),
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

class SewagePage extends StatelessWidget {
  const SewagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sewage'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StpPage()));
            },
            child: const Text('STP'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LabourColonyPage()));
            },
            child: const Text('Labour Colony'),
          ),
        ],
      ),
    );
  }
}

class StpPage extends StatelessWidget {
  const StpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STP'),
      ),
      body: const Center(
          child: Text('Not Completed Project under Implementation')),
    );
  }
}

class LabourColonyPage extends StatefulWidget {
  const LabourColonyPage({super.key});

  @override
  State<LabourColonyPage> createState() => _LabourColonyPageState();
}

class _LabourColonyPageState extends State<LabourColonyPage> {
  final List<Map<String, String>> _data = [];
  DateTime? _selectedDate;

  final _dateController = TextEditingController();
  final _sourceController = TextEditingController();
  final _consumptionController = TextEditingController();
  final _dischargeController = TextEditingController();
  final _dischargedToController = TextEditingController();
  final _modeController = TextEditingController();

  List<Map<String, String>> get filteredData {
    if (_selectedDate == null) return _data;
    return _data
        .where((item) =>
            item['date'] ==
            '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}')
        .toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showAddDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Entry'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _dateController,
                decoration:
                    const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
              TextField(
                controller: _sourceController,
                decoration: const InputDecoration(labelText: 'Source'),
              ),
              TextField(
                controller: _consumptionController,
                decoration:
                    const InputDecoration(labelText: 'Consumption (KLD)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _dischargeController,
                decoration: const InputDecoration(labelText: 'Discharge'),
              ),
              TextField(
                controller: _dischargedToController,
                decoration: const InputDecoration(labelText: 'Discharged To'),
              ),
              TextField(
                controller: _modeController,
                decoration:
                    const InputDecoration(labelText: 'Mode of Transport'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _data.add({
                  'date': _dateController.text,
                  'source': _sourceController.text,
                  'consumption': _consumptionController.text,
                  'discharge': _dischargeController.text,
                  'dischargedTo': _dischargedToController.text,
                  'mode': _modeController.text,
                });
              });
              Navigator.pop(context);
              _dateController.clear();
              _sourceController.clear();
              _consumptionController.clear();
              _dischargeController.clear();
              _dischargedToController.clear();
              _modeController.clear();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labour Colony Consumption'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              setState(() {
                _selectedDate = null;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDataDialog,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          if (_selectedDate != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: Text(
                  'Filtered: ${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                ),
                onDeleted: () => setState(() => _selectedDate = null),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor:
                      MaterialStateProperty.all(Colors.teal.shade50),
                  columns: const [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Source')),
                    DataColumn(label: Text('Consumption (KLD)')),
                    DataColumn(label: Text('Discharge')),
                    DataColumn(label: Text('Discharged To')),
                    DataColumn(label: Text('Mode of Transport')),
                  ],
                  rows: filteredData
                      .map((item) => DataRow(
                            cells: [
                              DataCell(Text(item['date'] ?? '')),
                              DataCell(Text(item['source'] ?? '')),
                              DataCell(Text(item['consumption'] ?? '')),
                              DataCell(Text(item['discharge'] ?? '')),
                              DataCell(Text(item['dischargedTo'] ?? '')),
                              DataCell(Text(item['mode'] ?? '')),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _sourceController.dispose();
    _consumptionController.dispose();
    _dischargeController.dispose();
    _dischargedToController.dispose();
    _modeController.dispose();
    super.dispose();
  }
}
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
      String url = 'http://0.0.0.0:3000/borewell';
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
                    Uri.parse('http://0.0.0.0:3000/borewell'),
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

// class TankerPage extends StatefulWidget {
//   const TankerPage({Key? key}) : super(key: key);

//   @override
//   _TankerPageState createState() => _TankerPageState();
// }

// class _TankerPageState extends State<TankerPage> {
//   List<Map<String, dynamic>> _data = [];
//   DateTime? _selectedDate;
//   String? _searchQuery;

//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _tankerNoController = TextEditingController();
//   final TextEditingController _meterProvidedController = TextEditingController();
//   final TextEditingController _inController = TextEditingController();
//   final TextEditingController _outController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchTankerData();
//   }

//   Future<void> _fetchTankerData() async {
//     try {
//       String url = 'http://0.0.0.0:3000/tanker';

//       if (_selectedDate != null || _searchQuery != null) {
//         url += '?';
//         if (_selectedDate != null) {
//           url += 'date=${_selectedDate!.toIso8601String().split('T')[0]}';
//         }
//         if (_searchQuery != null) {
//           url += (_selectedDate != null ? '&' : '') + 'search=$_searchQuery';
//         }
//       }

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         setState(() {
//           _data = List<Map<String, dynamic>>.from(responseData['data']);
//         });
//       } else {
//         _showErrorDialog('Failed to fetch tanker data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   Future<void> _addTankerData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://0.0.0.0:3000/tanker'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({
//           'date': _dateController.text,
//           'tanker_no': _tankerNoController.text,
//           'meter_provided': _meterProvidedController.text,
//           'in': double.parse(_inController.text),
//           'out': double.parse(_outController.text),
//           'water_consumed': double.parse(_outController.text) - double.parse(_inController.text),
//         }),
//       );

//       if (response.statusCode == 201) {
//         await _fetchTankerData();
//         Navigator.of(context).pop();

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Data added successfully')),
//         );
//       } else {
//         _showErrorDialog('Failed to add tanker data');
//       }
//     } catch (e) {
//       _showErrorDialog('Error: ${e.toString()}');
//     }
//   }

//   void _showAddDataDialog() {
//     _dateController.text = DateTime.now().toIso8601String().split('T')[0];
//     _tankerNoController.clear();
//     _meterProvidedController.clear();
//     _inController.clear();
//     _outController.clear();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Tanker Data'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: _dateController,
//                   decoration: const InputDecoration(
//                     labelText: 'Date',
//                     hintText: 'YYYY-MM-DD',
//                   ),
//                   keyboardType: TextInputType.datetime,
//                 ),
//                 TextField(
//                   controller: _tankerNoController,
//                   decoration: const InputDecoration(
//                     labelText: 'Tanker Number',
//                   ),
//                 ),
//                 TextField(
//                   controller: _meterProvidedController,
//                   decoration: const InputDecoration(
//                     labelText: 'Meter Provided (Yes/No)',
//                   ),
//                 ),
//                 TextField(
//                   controller: _inController,
//                   decoration: const InputDecoration(
//                     labelText: 'In (KLD)',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextField(
//                   controller: _outController,
//                   decoration: const InputDecoration(
//                     labelText: 'Out (KLD)',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_dateController.text.isEmpty ||
//                     _tankerNoController.text.isEmpty ||
//                     _meterProvidedController.text.isEmpty ||
//                     _inController.text.isEmpty ||
//                     _outController.text.isEmpty) {
//                   _showErrorDialog('Please fill all fields');
//                   return;
//                 }

//                 _addTankerData();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       await _fetchTankerData();
//     }
//   }

//   void _showSearchDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final searchController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Search'),
//           content: TextField(
//             controller: searchController,
//             decoration: const InputDecoration(hintText: 'Enter search query'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _searchQuery = searchController.text;
//                 });
//                 Navigator.pop(context);
//                 _fetchTankerData();
//               },
//               child: const Text('Search'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tanker Water Data'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: _showSearchDialog,
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               setState(() {
//                 _selectedDate = null;
//                 _searchQuery = null;
//               });
//               _fetchTankerData();
//             },
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Filter Chips
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     children: [
//                       if (_selectedDate != null)
//                         Chip(
//                           label: Text(
//                             'Date: ${_selectedDate!.toIso8601String().split('T')[0]}',
//                           ),
//                           onDeleted: () {
//                             setState(() => _selectedDate = null);
//                             _fetchTankerData();
//                           },
//                         ),
//                       if (_searchQuery != null)
//                         Chip(
//                           label: Text('Search: $_searchQuery'),
//                           onDeleted: () {
//                             setState(() => _searchQuery = null);
//                             _fetchTankerData();
//                           },
//                         ),
//                     ],
//                   ),
//                 ),
                
//                 // Responsive Data Table
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minWidth: constraints.maxWidth,
//                     ),
//                     child: DataTable(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.teal.shade100),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       headingRowColor: MaterialStateColor.resolveWith(
//                         (states) => Colors.teal.shade50,
//                       ),
//                       columns: [
//                         _buildDataColumn('No'),
//                         _buildDataColumn('Date'),
//                         _buildDataColumn('Tanker No'),
//                         _buildDataColumn('Meter\nProvided'),
//                         _buildDataColumn('In\n(KLD)'),
//                         _buildDataColumn('Out\n(KLD)'),
//                         _buildDataColumn('Water\nConsumed'),
//                       ],
//                       rows: _data.map((item) => _buildDataRow(item)).toList(),
//                     ),
//                   ),
//                 ),
                
//                 // Add some bottom padding
//                 const SizedBox(height: 80),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   // Helper method to create styled data columns
//   DataColumn _buildDataColumn(String label) {
//     return DataColumn(
//       label: Text(
//         label,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.teal.shade900,
//           fontSize: 14,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   // Helper method to create data rows
//   DataRow _buildDataRow(Map<String, dynamic> item) {
//     return DataRow(
//       cells: [
//         DataCell(Text(item['slno']?.toString() ?? '')),
//         DataCell(Text(item['date']?.toString() ?? '')),
//         DataCell(Text(item['tanker_no']?.toString() ?? '')),
//         DataCell(Text(item['meter_provided']?.toString() ?? '')),
//         DataCell(Text(item['in']?.toString() ?? '')),
//         DataCell(Text(item['out']?.toString() ?? '')),
//         DataCell(Text(
//           ((item['out'] ?? 0) - (item['in'] ?? 0)).toStringAsFixed(2)
//         )),
//       ],
//     );
//   }
// }


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
      String url = 'http://0.0.0.0:3000/tanker';
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
          Uri.parse('http://0.0.0.0:3000/tanker'),
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