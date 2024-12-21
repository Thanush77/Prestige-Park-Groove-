// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class StackMonitoringData {
//   final String source;
//   final String asPerConsent;
//   final String provided;
//   final String controlSystem;

//   StackMonitoringData({
//     required this.source,
//     required this.asPerConsent,
//     required this.provided,
//     required this.controlSystem,
//   });

//   factory StackMonitoringData.fromJson(Map<String, dynamic> json) {
//     return StackMonitoringData(
//       source: json['source'],
//       asPerConsent: json['asPerConsent'],
//       provided: json['provided'],
//       controlSystem: json['controlSystem'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'source': source,
//       'asPerConsent': asPerConsent,
//       'provided': provided,
//       'controlSystem': controlSystem,
//     };
//   }
// }

// class AmbientAirQualityStandardsPage extends StatelessWidget {
//   const AmbientAirQualityStandardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ambient Air Quality Standards'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           _StandardCard(
//             title: 'Particulate Matter (PM)',
//             standards: [
//               'PM2.5: 35 µg/m³ (24-hour), 12 µg/m³ (annual)',
//               'PM10: 150 µg/m³ (24-hour)',
//             ],
//           ),
//           _StandardCard(
//             title: 'Gaseous Pollutants',
//             standards: [
//               'NO2: 100 ppb (1-hour), 53 ppb (annual)',
//               'SO2: 75 ppb (1-hour)',
//               'CO: 9 ppm (8-hour), 35 ppm (1-hour)',
//               'O3: 70 ppb (8-hour)',
//             ],
//           ),
//           _StandardCard(
//             title: 'Other Pollutants',
//             standards: [
//               'Lead (Pb): 0.15 µg/m³ (3-month average)',
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Stack Emission Standards Page
// class StackEmissionStandardsPage extends StatelessWidget {
//   const StackEmissionStandardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stack Emission Standards'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           _StandardCard(
//             title: 'Particulate Emissions',
//             standards: [
//               'Coal-based Plants: 50 mg/Nm³',
//               'Gas-based Plants: 30 mg/Nm³',
//             ],
//           ),
//           _StandardCard(
//             title: 'Gaseous Emissions',
//             standards: [
//               'SO2: 100 mg/Nm³',
//               'NOx: 50-100 mg/Nm³ (depending on plant type)',
//               'CO: 75 mg/Nm³',
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Noise Standards Page
// class NoiseStandardsPage extends StatelessWidget {
//   const NoiseStandardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Noise Standards'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           _StandardCard(
//             title: 'Industrial Areas',
//             standards: [
//               'Day Time: 75 dB(A)',
//               'Night Time: 70 dB(A)',
//             ],
//           ),
//           _StandardCard(
//             title: 'Commercial Areas',
//             standards: [
//               'Day Time: 65 dB(A)',
//               'Night Time: 55 dB(A)',
//             ],
//           ),
//           _StandardCard(
//             title: 'Residential Areas',
//             standards: [
//               'Day Time: 55 dB(A)',
//               'Night Time: 45 dB(A)',
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Air Pollution Sources Page
// class AirPollutionSourcesPage extends StatelessWidget {
//   const AirPollutionSourcesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Air Pollution Sources'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           _StandardCard(
//             title: 'Industrial Sources',
//             standards: [
//               'Power Plants',
//               'Manufacturing Facilities',
//               'Chemical Processing Plants',
//               'Refineries',
//             ],
//           ),
//           _StandardCard(
//             title: 'Transportation Sources',
//             standards: [
//               'Vehicles (Cars, Trucks, Buses)',
//               'Two-wheelers',
//               'Diesel Generators',
//             ],
//           ),
//           _StandardCard(
//             title: 'Agricultural Sources',
//             standards: [
//               'Crop Burning',
//               'Livestock',
//               'Agricultural Machinery',
//             ],
//           ),
//           _StandardCard(
//             title: 'Residential Sources',
//             standards: [
//               'Cooking with Solid Fuels',
//               'Heating',
//               'Waste Burning',
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Reusable Standard Card Widget
// class _StandardCard extends StatelessWidget {
//   final String title;
//   final List<String> standards;

//   const _StandardCard({
//     required this.title,
//     required this.standards,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal.shade700,
//               ),
//             ),
//             const SizedBox(height: 10),
//             ...standards.map((standard) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4.0),
//               child: Text(
//                 '• $standard',
//                 style: const TextStyle(fontSize: 16),
//               ),
//             )).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Modified Air Pollution Monitoring Page
// class AirPollutionMonitoringPage extends StatelessWidget {
//   const AirPollutionMonitoringPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Environmental Monitoring'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.teal.shade50, Colors.white],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Standards Buttons
//                 _buildStandardButton(
//                   context,
//                   'Ambient Air Quality Standards',
//                   const AmbientAirQualityStandardsPage(),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildStandardButton(
//                   context,
//                   'Stack Emission Standards',
//                   const StackEmissionStandardsPage(),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildStandardButton(
//                   context,
//                   'Noise Standards',
//                   const NoiseStandardsPage(),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildStandardButton(
//                   context,
//                   'Air Pollution Sources',
//                   const AirPollutionSourcesPage(),
//                 ),
//                 const SizedBox(height: 32),

//                 // Monitoring Buttons
//                 _buildMonitoringButton(
//                   context,
//                   'Stack Monitoring',
//                   const StackMonitoringPage(),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildMonitoringButton(
//                   context,
//                   'Ambient Air Monitoring',
//                   const AmbientAirMonitoringPage(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Utility method to build standard buttons
//   Widget _buildStandardButton(
//     BuildContext context, 
//     String title, 
//     Widget page
//   ) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.teal.shade400,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   // Utility method to build monitoring buttons
//   Widget _buildMonitoringButton(
//     BuildContext context, 
//     String title, 
//     Widget page
//   ) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.teal.shade600,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 16,
// class StackMonitoringPage extends StatefulWidget {
//   const StackMonitoringPage({super.key});

//   @override
//   _StackMonitoringPageState createState() => _StackMonitoringPageState();
// }

// class _StackMonitoringPageState extends State<StackMonitoringPage> {
//   // List to store monitoring data
//   List<StackMonitoringData> _monitoringData = <StackMonitoringData>[];
//   List<StackMonitoringData> _filteredData = <StackMonitoringData>[];

//   // API Base URL (replace with your actual server URL)
//   final String _baseUrl = 'http://localhost:3000';

//   final TextEditingController _sourceController = TextEditingController();
//   final TextEditingController _asPerConsentController = TextEditingController();
//   final TextEditingController _providedController = TextEditingController();
//   final TextEditingController _controlSystemController = TextEditingController();
//   final TextEditingController _searchController = TextEditingController();

//   // Sorting variables
//   String _sortColumn = 'source';
//   bool _isAscending = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchMonitoringData();
//   }

//   // Fetch monitoring data from API
//   Future<void> _fetchMonitoringData() async {
//     try {
//       final response = await http.get(Uri.parse('$_baseUrl/stack-monitoring'));
      
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(response.body)['data'];
//         setState(() {
//           _monitoringData = responseData
//               .map((data) => StackMonitoringData.fromJson(data))
//               .toList();
//           _filteredData = _monitoringData;
//         });
//       } else {
//         _showErrorSnackBar('Failed to load monitoring data');
//       }
//     } catch (e) {
//       _showErrorSnackBar('Error connecting to server');
//     }
//   }

//   // Method to add new monitoring data
//   Future<void> _addMonitoringData() async {
//     if (_validateInputs()) {
//       final newData = StackMonitoringData(
//         source: _sourceController.text.trim(),
//         asPerConsent: _asPerConsentController.text.trim(),
//         provided: _providedController.text.trim(),
//         controlSystem: _controlSystemController.text.trim(),
//       );

//       try {
//         final response = await http.post(
//           Uri.parse('$_baseUrl/stack-monitoring'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode(newData.toJson()),
//         );

//         if (response.statusCode == 201) {
//           final addedData = StackMonitoringData.fromJson(
//             json.decode(response.body)['data']
//           );
          
//           setState(() {
//             _monitoringData.add(addedData);
//             _filteredData = _monitoringData;
//             _clearInputFields();
//           });
          
//           Navigator.of(context).pop();
//           _showSuccessSnackBar('Monitoring data added successfully');
//         } else {
//           final errorMessage = json.decode(response.body)['error'];
//           _showErrorSnackBar(errorMessage ?? 'Failed to add monitoring data');
//         }
//       } catch (e) {
//         _showErrorSnackBar('Error connecting to server');
//       }
//     }
//   }

//   // Input validation method
//   bool _validateInputs() {
//     if (_sourceController.text.trim().isEmpty ||
//         _asPerConsentController.text.trim().isEmpty ||
//         _providedController.text.trim().isEmpty ||
//         _controlSystemController.text.trim().isEmpty) {
//       _showErrorSnackBar('All fields are required');
//       return false;
//     }
//     return true;
//   }

//   // Show success snackbar
//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   // Show error snackbar
//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   // Clear input fields
//   void _clearInputFields() {
//     _sourceController.clear();
//     _asPerConsentController.clear();
//     _providedController.clear();
//     _controlSystemController.clear();
//   }

//   // Search and filter method
//   void _filterData(String query) {
//     setState(() {
//       _filteredData = _monitoringData.where((data) {
//         return data.source.toLowerCase().contains(query.toLowerCase()) ||
//             data.asPerConsent.toLowerCase().contains(query.toLowerCase()) ||
//             data.provided.toLowerCase().contains(query.toLowerCase()) ||
//             data.controlSystem.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }

//   // Sorting method
//   void _sortData(String columnName) {
//     setState(() {
//       _isAscending = !_isAscending;
//       _sortColumn = columnName;

//       _filteredData.sort((a, b) {
//         switch (columnName) {
//           case 'source':
//             return _isAscending
//                 ? a.source.compareTo(b.source)
//                 : b.source.compareTo(a.source);
//           case 'asPerConsent':
//             return _isAscending
//                 ? a.asPerConsent.compareTo(b.asPerConsent)
//                 : b.asPerConsent.compareTo(a.asPerConsent);
//           case 'provided':
//             return _isAscending
//                 ? a.provided.compareTo(b.provided)
//                 : b.provided.compareTo(a.provided);
//           case 'controlSystem':
//             return _isAscending
//                 ? a.controlSystem.compareTo(b.controlSystem)
//                 : b.controlSystem.compareTo(a.controlSystem);
//           default:
//             return 0;
//         }
//       });
//     });
//   }

//   // Method to show add data dialog
//   void _showAddDataDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Monitoring Data'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _sourceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Source of Air Pollution',
//                   ),
//                 ),
//                 TextField(
//                   controller: _asPerConsentController,
//                   decoration: const InputDecoration(
//                     labelText: 'Chimney (As per Consent)',
//                   ),
//                 ),
//                 TextField(
//                   controller: _providedController,
//                   decoration: const InputDecoration(
//                     labelText: 'Chimney (Provided)',
//                   ),
//                 ),
//                 TextField(
//                   controller: _controlSystemController,
//                   decoration: const InputDecoration(
//                     labelText: 'Air Pollution Control System',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: _addMonitoringData,
//               child: const Text('Add Data'),
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
//         title: const Text('Stack Airflow Monitoring'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _fetchMonitoringData,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onChanged: _filterData,
//             ),
//           ),

//           // Data Table
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: _filteredData.isEmpty
//                   ? const Center(child: Text('No monitoring data found'))
//                   : DataTable(
//                       sortColumnIndex: _getSortColumnIndex(_sortColumn),
//                       sortAscending: _isAscending,
//                       columns: [
//                         _buildDataColumn('Source', 'source'),
//                         _buildDataColumn('Chimney (As per Consent)', 'asPerConsent'),
//                         _buildDataColumn('Chimney (Provided)', 'provided'),
//                         _buildDataColumn('Air Pollution Control System', 'controlSystem'),
//                       ],
//                       rows: _filteredData.map((data) {
//                         final bool isRed = int.tryParse(data.asPerConsent) != null &&
//                             int.tryParse(data.provided) != null &&
//                             int.parse(data.asPerConsent) > int.parse(data.provided);
//                         return DataRow(
//                           cells: [
//                             DataCell(Text(data.source)),
//                             DataCell(Text(data.asPerConsent)),
//                             DataCell(
//                               Text(
//                                 data.provided,
//                                 style: TextStyle(
//                                   color: isRed ? Colors.red : Colors.black,
//                                 ),
//                               ),
//                             ),
//                             DataCell(Text(data.controlSystem)),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   // Helper method to get sort column index
//   int _getSortColumnIndex(String columnName) {
//     switch (columnName) {
//       case 'source':
//         return 0;
//       case 'asPerConsent':
//         return 1;
//       case 'provided':
//         return 2;
//       case 'controlSystem':
//         return 3;
//       default:
//         return 0;
//     }
//   }

//   // Method to build sortable data column
//   DataColumn _buildDataColumn(String label, String columnName) {
//     return DataColumn(
//       label: Text(label),
//       onSort: (columnIndex, ascending) => _sortData(columnName),
//     );
//   }
// }
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// // Placeholder for Ambient Air Monitoring Page
// class AmbientAirMonitoringPage extends StatelessWidget {
//   const AmbientAirMonitoringPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ambient Air Monitoring'),
//         backgroundColor: Colors.teal,
//       ),
//       body: const Center(
//         child: Text(
//       final response = await http.get(Uri.parse('$_baseUrl/stack-monitoring'));
//           style: TextStyle(fontSize: 20),
//         ),
//         final List<dynamic> responseData = json.decode(response.body)['data'];
//     );
//   }
//               .map((data) => StackMonitoringData.fromJson(data))






// class _StackMonitoringPageState extends State<StackMonitoringPage> {
//   // List to store monitoring data
//   List<StackMonitoringData> _monitoringData = <StackMonitoringData>[];
//   List<StackMonitoringData> _filteredData = <StackMonitoringData>[];

//   // API Base URL (replace with your actual server URL)
//   final String _baseUrl = 'http://localhost:3000';

//       final newData = StackMonitoringData(
//   final TextEditingController _sourceController = TextEditingController();
//   final TextEditingController _asPerConsentController = TextEditingController();
//   final TextEditingController _providedController = TextEditingController();
//   final TextEditingController _controlSystemController = TextEditingController();
//   final TextEditingController _searchController = TextEditingController();

//   // Sorting variables
//         final response = await http.post(
//   String _sortColumn = 'source';

//           body: json.encode(newData.toJson()),
//   void initState() {
//     super.initState();
//     _fetchMonitoringData();
//           final addedData = StackMonitoringData.fromJson(
//             json.decode(response.body)['data']
//   // Fetch monitoring data from API
//   Future<void> _fetchMonitoringData() async {
//     try {
//       final response = await http.get(Uri.parse('$_baseUrl/stack-monitoring'));
      
//       if (response.statusCode == 200) {
//         final List<dynamic> responseData = json.decode(response.body)['data'];
//         setState(() {
//           _monitoringData = responseData
//               .map((data) => StackMonitoringData.fromJson(data))
//               .toList();
//           final errorMessage = json.decode(response.body)['error'];
//         });
//       } else {
//         _showErrorSnackBar('Failed to load monitoring data');
//       }
//     } catch (e) {
//       _showErrorSnackBar('Error connecting to server');
//     }
//   }

//   // Method to add new monitoring data
//   Future<void> _addMonitoringData() async {
//     if (_validateInputs()) {
//       final newData = StackMonitoringData(
//         source: _sourceController.text.trim(),
//         asPerConsent: _asPerConsentController.text.trim(),
//         provided: _providedController.text.trim(),
//         controlSystem: _controlSystemController.text.trim(),
//       );

//       try {
//         final response = await http.post(
//           Uri.parse('$_baseUrl/stack-monitoring'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode(newData.toJson()),
//         );

//         if (response.statusCode == 201) {
//           final addedData = StackMonitoringData.fromJson(
//             json.decode(response.body)['data']
//           );
          
//           setState(() {
//             _monitoringData.add(addedData);
//             _filteredData = _monitoringData;
//             _clearInputFields();
//           });
          
//           Navigator.of(context).pop();
//           _showSuccessSnackBar('Monitoring data added successfully');
//         } else {
//           final errorMessage = json.decode(response.body)['error'];
//           _showErrorSnackBar(errorMessage ?? 'Failed to add monitoring data');
//         }
//       } catch (e) {
//         _showErrorSnackBar('Error connecting to server');
//       }
//     }
//   }

//   // Input validation method
//   bool _validateInputs() {
//     if (_sourceController.text.trim().isEmpty ||
//         return data.source.toLowerCase().contains(query.toLowerCase()) ||
//             data.asPerConsent.toLowerCase().contains(query.toLowerCase()) ||
//             data.provided.toLowerCase().contains(query.toLowerCase()) ||
//             data.controlSystem.toLowerCase().contains(query.toLowerCase());
//       return false;
//     }
//     return true;
//   }

//   // Show success snackbar
//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
//                 ? a.source.compareTo(b.source)
//                 : b.source.compareTo(a.source);
//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//                 ? a.asPerConsent.compareTo(b.asPerConsent)
//                 : b.asPerConsent.compareTo(a.asPerConsent);
//         backgroundColor: Colors.red,
//       ),
//                 ? a.provided.compareTo(b.provided)
//                 : b.provided.compareTo(a.provided);

//   // Clear input fields
//                 ? a.controlSystem.compareTo(b.controlSystem)
//                 : b.controlSystem.compareTo(a.controlSystem);
//     _asPerConsentController.clear();
//     _providedController.clear();
//     _controlSystemController.clear();
//   }

//   // Search and filter method
//   void _filterData(String query) {
//     setState(() {
//       _filteredData = _monitoringData.where((data) {
//         return data.source.toLowerCase().contains(query.toLowerCase()) ||
//             data.asPerConsent.toLowerCase().contains(query.toLowerCase()) ||
//             data.provided.toLowerCase().contains(query.toLowerCase()) ||
//             data.controlSystem.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }

//   // Sorting method
//   void _sortData(String columnName) {
//     setState(() {
//       _isAscending = !_isAscending;
//       _sortColumn = columnName;

//       _filteredData.sort((a, b) {
//         switch (columnName) {
//           case 'source':
//             return _isAscending
//                 ? a.source.compareTo(b.source)
//                 : b.source.compareTo(a.source);
//           case 'asPerConsent':
//             return _isAscending
//                 ? a.asPerConsent.compareTo(b.asPerConsent)
//                 : b.asPerConsent.compareTo(a.asPerConsent);
//           case 'provided':
//             return _isAscending
//                 ? a.provided.compareTo(b.provided)
//                 : b.provided.compareTo(a.provided);
//           case 'controlSystem':
//             return _isAscending
//                 ? a.controlSystem.compareTo(b.controlSystem)
//                 : b.controlSystem.compareTo(a.controlSystem);
//           default:
//             return 0;
//         }
//       });
//     });
//   }

//   // Method to show add data dialog
//   void _showAddDataDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Monitoring Data'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _sourceController,
//                   decoration: const InputDecoration(
//                     labelText: 'Source of Air Pollution',
//                   ),
//                 ),
//                 TextField(
//                   controller: _asPerConsentController,
//                   decoration: const InputDecoration(
//                     labelText: 'Chimney (As per Consent)',
//                   ),
//                 ),
//                 TextField(
//                   controller: _providedController,
//                   decoration: const InputDecoration(
//                     labelText: 'Chimney (Provided)',
//                   ),
//                 ),
//                 TextField(
//                   controller: _controlSystemController,
//                   decoration: const InputDecoration(
//                     labelText: 'Air Pollution Control System',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: _addMonitoringData,
//               child: const Text('Add Data'),
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
//         title: const Text('Stack Airflow Monitoring'),
//         backgroundColor: Colors.teal,
//                         final bool isRed = int.tryParse(data.asPerConsent) != null &&
//                             int.tryParse(data.provided) != null &&
//                             int.parse(data.asPerConsent) > int.parse(data.provided);
//             onPressed: _fetchMonitoringData,
//           ),
//                             DataCell(Text(data.source)),
//                             DataCell(Text(data.asPerConsent)),
//       body: Column(
//         children: [
//                                 data.provided,
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                             DataCell(Text(data.controlSystem)),
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onChanged: _filterData,
//             ),
//           ),

//           // Data Table
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: _filteredData.isEmpty
//                   ? const Center(child: Text('No monitoring data found'))
//                   : DataTable(
//                       sortColumnIndex: _getSortColumnIndex(_sortColumn),
//                       sortAscending: _isAscending,
//                       columns: [
//                         _buildDataColumn('Source', 'source'),
//                         _buildDataColumn('Chimney (As per Consent)', 'asPerConsent'),
//                         _buildDataColumn('Chimney (Provided)', 'provided'),
//                         _buildDataColumn('Air Pollution Control System', 'controlSystem'),
//                       ],
//                       rows: _filteredData.map((data) {
//                         final bool isRed = int.tryParse(data.asPerConsent) != null &&
//                             int.tryParse(data.provided) != null &&
//                             int.parse(data.asPerConsent) > int.parse(data.provided);
//                         return DataRow(
//                           cells: [
//                             DataCell(Text(data.source)),
//                             DataCell(Text(data.asPerConsent)),
//                             DataCell(
//                               Text(
//                                 data.provided,
//                                 style: TextStyle(
//                                   color: isRed ? Colors.red : Colors.black,
//                                 ),
//                               ),
//                             ),
//                             DataCell(Text(data.controlSystem)),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDataDialog,
//         backgroundColor: Colors.teal,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   // Helper method to get sort column index
//   int _getSortColumnIndex(String columnName) {
//     switch (columnName) {
//       case 'source':
//         return 0;
//       case 'asPerConsent':
//         return 1;
//       case 'provided':
//         return 2;
//       case 'controlSystem':
//         return 3;
//       default:
//         return 0;
//     }
//   }

//   // Method to build sortable data column
//   DataColumn _buildDataColumn(String label, String columnName) {
//     return DataColumn(
//       label: Text(label),
//       onSort: (columnIndex, ascending) => _sortData(columnName),
//     );
//   }
// }