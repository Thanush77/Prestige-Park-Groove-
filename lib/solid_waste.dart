import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'LabourColonyWastePage.dart';
import 'CDWasteDetailsPage.dart';

class SolidWastePage extends StatelessWidget {
  const SolidWastePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solid Waste Management'),
        backgroundColor: Colors.teal[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal[700]!, Colors.teal[200]!],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Card
                _buildHeaderCard(),
                const SizedBox(height: 24),

                // Main Options
                _buildWasteButton(
                  context: context,
                  title: 'Construction & Demolition Waste',
                  icon: Icons.construction,
                  onTap: () => _navigateToCDWasteDetailsPage(context),
                ),

                const SizedBox(height: 12),

                _buildWasteButton(
                  context: context,
                  title: 'Municipal Solid Waste',
                  icon: Icons.delete_outline,
                  onTap: () => _navigateToWastePage(context, 'MSW'),
                ),

                const SizedBox(height: 24),

                // Statistics Card
                _buildStatisticsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[300]!, Colors.teal[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.recycling, size: 64, color: Colors.teal[800]),
            const SizedBox(height: 12),
            Text(
              'Solid Waste Management',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Efficient waste tracking and management system',
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWasteButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 24),
      label: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal[700],
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
    );
  }

  Widget _buildStatisticsCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waste Statistics',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 16),
            _buildStatisticRow('Total Waste Generated', '1200 kg', Colors.teal[700]!),
            _buildStatisticRow('Waste Recycled', '800 kg', Colors.green[700]!),
            _buildStatisticRow('Waste to Landfill', '400 kg', Colors.red[700]!),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToWastePage(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WasteDetailsPage(wasteType: type),
      ),
    );
  }

  void _navigateToCDWasteDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CDWasteDetailsPage(),
      ),
    );
  }
}

class WasteDetailsPage extends StatelessWidget {
  final String wasteType;

  const WasteDetailsPage({super.key, required this.wasteType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$wasteType Waste Details'),
        backgroundColor: Colors.teal[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal[700]!, Colors.teal[200]!],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildWasteTypeHeader(),
                const SizedBox(height: 24),
                _buildDetailButton(
                  context: context,
                  title: 'Labour Colony',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LabourColonyWastePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildDetailButton(
                  context: context,
                  title: 'Project',
                  onPressed: () {
                    // Navigate to Project page (to be implemented)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectWastePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildStatisticsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWasteTypeHeader() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[300]!, Colors.teal[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.home, color: Colors.teal[700], size: 32.0),
            const SizedBox(height: 12),
            Text(
              '$wasteType Waste Management',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Efficient tracking and management',
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailButton({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal[700],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatisticsCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$wasteType Waste Statistics',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 16),
            _buildStatisticRow('Total Waste Generated', '170 Tons', Colors.teal[700]!),
            _buildStatisticRow('Waste Recycled', '80 Tons', Colors.green[700]!),
            _buildStatisticRow('Waste to Landfill', '400 kg', Colors.red[700]!),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectWastePage extends StatelessWidget {
  const ProjectWastePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Waste'),
        backgroundColor: Colors.teal[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal[700]!, Colors.teal[200]!],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Add your Project waste details content here
              ],
            ),
          ),
        ),
      ),
    );
  }
}












// class CDWasteDetailsPage extends StatefulWidget {
//   const CDWasteDetailsPage({Key? key}) : super(key: key);

//   @override
//   _CDWasteDetailsPageState createState() => _CDWasteDetailsPageState();
// }

// class _CDWasteDetailsPageState extends State<CDWasteDetailsPage> {
//   final TextEditingController _projectAreaController = TextEditingController();
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _endDateController = TextEditingController();

//   double? _expectedWasteGeneration;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('C&D Waste Details'),
//         backgroundColor: Colors.teal[700],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Components of C&D Waste
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Components of C&D Waste:',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     _buildComponentItem('Concrete Waste'),
//                     _buildComponentItem('Wood Waste'),
//                     _buildComponentItem('Metal Scrap'),
//                     _buildComponentItem('Ceramic and Tile Waste'),
//                     _buildComponentItem('Packaging Materials'),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Waste Generation Calculation
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Waste Generation Estimation',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     TextField(
//                       controller: _projectAreaController,
//                       decoration: InputDecoration(
//                         labelText: 'Project Area (m²)',
//                         border: OutlineInputBorder(),
//                         suffixText: 'm²',
//                       ),
//                       keyboardType: TextInputType.number,
//                       onChanged: _calculateExpectedWaste,
//                     ),
//                     const SizedBox(height: 12),
//                     if (_expectedWasteGeneration != null)
//                       Text(
//                         'Expected Total Generation: ${_expectedWasteGeneration?.toStringAsFixed(2)} Tons',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.teal[700],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Date Range for C&D Waste
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'C&D Waste Generated',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal[700],
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: _startDateController,
//                             decoration: InputDecoration(
//                               labelText: 'Start Date',
//                               border: OutlineInputBorder(),
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.calendar_today),
//                                 onPressed: () => _selectDate(context, true),
//                               ),
//                             ),
//                             readOnly: true,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextField(
//                             controller: _endDateController,
//                             decoration: InputDecoration(
//                               labelText: 'End Date',
//                               border: OutlineInputBorder(),
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.calendar_today),
//                                 onPressed: () => _selectDate(context, false),
//                               ),
//                             ),
//                             readOnly: true,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     ElevatedButton(
//                       onPressed: _fetchWasteData,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal[700],
//                       ),
//                       child: Text('Fetch Waste Data'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildComponentItem(String component) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(Icons.circle, size: 10, color: Colors.teal[700]),
//           const SizedBox(width: 8),
//           Text(
//             component,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }

//   void _calculateExpectedWaste(String value) {
//     if (value.isNotEmpty) {
//       double area = double.tryParse(value) ?? 0;
//       setState(() {
//         _expectedWasteGeneration = area * 0.05; // 50 kg/m²
//       });
//     } else {
//       setState(() {
//         _expectedWasteGeneration = null;
//       });
//     }
//   }

//   Future<void> _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartDate) {
//           _startDateController.text = picked.toString().split(' ')[0];
//         } else {
//           _endDateController.text = picked.toString().split(' ')[0];
//         }
//       });
//     }
//   }

//   Future<void> _fetchWasteData() async {
//     // Implement API call to fetch waste data for the selected date range
//     // This would be similar to the Labour Colony Waste data fetching
//     if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please select both start and end dates')),
//       );
//       return;
//     }

//     try {
//       // Replace with your actual API endpoint
//       final response = await http.get(Uri.parse(
//           'http://54.146.215.18:3000/cd-waste?start_date=${_startDateController.text}&end_date=${_endDateController.text}'));
      
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         // Handle the data, potentially show in a dialog or navigate to a new page
//         _showWasteDataDialog(data);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to fetch waste data')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }

//   void _showWasteDataDialog(dynamic data) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('C&D Waste Data'),
//         content: SingleChildScrollView(
//           child: Text(json.encode(data)),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _projectAreaController.dispose();
//     _startDateController.dispose();
//     _endDateController.dispose();
//     super.dispose();
//   }
// }



// class CDWastePage extends StatefulWidget {
//   @override
//   _CDWastePageState createState() => _CDWastePageState();
// }

// class _CDWastePageState extends State<CDWastePage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   List<CDWasteEntry> _wasteEntries = [];
//   Map<String, dynamic> _statistics = {};

//   // Controllers
//   final _dateController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _storageController = TextEditingController();
//   final _disposalController = TextEditingController();

//   DateTime? _selectedStartDate;
//   DateTime? _selectedEndDate;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//     _fetchStatistics();
//   }

//   Future<void> _fetchData() async {
//     setState(() => _isLoading = true);
//     try {
//       String url = 'http://your-server-address:3000/cd-waste';
//       if (_selectedStartDate != null && _selectedEndDate != null) {
//         url += '?start_date=${DateFormat('yyyy-MM-dd').format(_selectedStartDate!)}'
//             '&end_date=${DateFormat('yyyy-MM-dd').format(_selectedEndDate!)}';
//       }

//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _wasteEntries = (data['data'] as List)
//               .map((e) => CDWasteEntry.fromJson(e))
//               .toList();
//         });
//       }
//     } catch (e) {
//       _showError('Error fetching data: $e');
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _fetchStatistics() async {
//     try {
//       String url = 'http://your-server-address:3000/cd-waste/stats';
//       if (_selectedStartDate != null && _selectedEndDate != null) {
//         url += '?start_date=${DateFormat('yyyy-MM-dd').format(_selectedStartDate!)}'
//             '&end_date=${DateFormat('yyyy-MM-dd').format(_selectedEndDate!)}';
//       }

//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         setState(() {
//           _statistics = json.decode(response.body)['data'];
//         });
//       }
//     } catch (e) {
//       _showError('Error fetching statistics: $e');
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   Widget _buildStatisticsCard() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       color: Colors.teal[50],
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Statistics',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal[800],
//                 )),
//             SizedBox(height: 16),
//             _buildStatRow(
//                 'Total Entries:', _statistics['total_entries']?.toString() ?? '0'),
//             _buildStatRow(
//                 'Total Quantity:',
//                 '${_statistics['total_quantity']?.toStringAsFixed(2) ?? '0'} kg'),
//             _buildStatRow(
//                 'Average Quantity:',
//                 '${_statistics['avg_quantity']?.toStringAsFixed(2) ?? '0'} kg'),
//             _buildStatRow(
//                 'Min Quantity:',
//                 '${_statistics['min_quantity']?.toStringAsFixed(2) ?? '0'} kg'),
//             _buildStatRow(
//                 'Max Quantity:',
//                 '${_statistics['max_quantity']?.toStringAsFixed(2) ?? '0'} kg'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 16)),
//           Text(value,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }

//   Widget _buildDataTable() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columnSpacing: 12,
//         headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal[100]!),
//         columns: [
//           DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
//           DataColumn(label: Text('Quantity (kg)', style: TextStyle(fontWeight: FontWeight.bold))),
//           DataColumn(label: Text('Storage Mode', style: TextStyle(fontWeight: FontWeight.bold))),
//           DataColumn(label: Text('Disposal Mode', style: TextStyle(fontWeight: FontWeight.bold))),
//           DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
//         ],
//         rows: _wasteEntries
//             .map((entry) => DataRow(cells: [
//                   DataCell(Text(DateFormat('yyyy-MM-dd').format(entry.date))),
//                   DataCell(Text(entry.quantity.toString())),
//                   DataCell(Text(entry.storageMode)),
//                   DataCell(Text(entry.disposalMode)),
//                   DataCell(Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit, color: Colors.blue),
//                         onPressed: () => _showEditDialog(entry),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () => _deleteEntry(entry.id),
//                       ),
//                     ],
//                   )),
//                 ]))
//             .toList(),
//       ),
//     );
//   }

//   Widget _buildDateRangeSelector() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       color: Colors.teal[50],
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextButton.icon(
//                 icon: Icon(Icons.calendar_today, color: Colors.teal[700]),
//                 label: Text(
//                   _selectedStartDate == null
//                       ? 'Start Date'
//                       : DateFormat('yyyy-MM-dd').format(_selectedStartDate!),
//                   style: TextStyle(color: Colors.teal[800]),
//                 ),
//                 onPressed: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: _selectedStartDate ?? DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime.now(),
//                   );
//                   if (date != null) {
//                     setState(() => _selectedStartDate = date);
//                     _fetchData();
//                     _fetchStatistics();
//                   }
//                 },
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: TextButton.icon(
//                 icon: Icon(Icons.calendar_today, color: Colors.teal[700]),
//                 label: Text(
//                   _selectedEndDate == null
//                       ? 'End Date'
//                       : DateFormat('yyyy-MM-dd').format(_selectedEndDate!),
//                   style: TextStyle(color: Colors.teal[800]),
//                 ),
//                 onPressed: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: _selectedEndDate ?? DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime.now(),
//                   );
//                   if (date != null) {
//                     setState(() => _selectedEndDate = date);
//                     _fetchData();
//                     _fetchStatistics();
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildChart() {
//     if (_wasteEntries.isEmpty) return SizedBox.shrink();

//     List<FlSpot> spots = [];
//     List<String> dates = [];
//     for (int i = 0; i < _wasteEntries.length; i++) {
//       spots.add(FlSpot(i.toDouble(), _wasteEntries[i].quantity));
//       dates.add(DateFormat('MM/dd').format(_wasteEntries[i].date));
//     }

//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       color: Colors.teal[50],
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Waste Quantity Trend',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal[800],
//               ),
//             ),
//             SizedBox(height: 16),
//             SizedBox(
//               height: 200,
//               child: LineChart(
//                 LineChartData(
//                   gridData: FlGridData(show: true),
//                   titlesData: FlTitlesData(
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: true),
//                     ),
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         getTitlesWidget: (value, meta) {
//                           int index = value.toInt();
//                           if (index >= 0 && index < dates.length) {
//                             return Text(dates[index]);
//                           }
//                           return Text('');
//                         },
//                       ),
//                     ),
//                   ),
//                   borderData: FlBorderData(show: true),
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: spots,
//                       isCurved: true,
//                       color: Colors.teal,
//                       barWidth: 3,
//                       dotData: FlDotData(show: true),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddDialog() {
//     _resetForm();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add New C&D Waste Entry'),
//         content: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     labelText: 'Date',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () async {
//                         final date = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime.now(),
//                         );
//                         if (date != null) {
//                           _dateController.text =
//                               DateFormat('yyyy-MM-dd').format(date);
//                         }
//                       },
//                     ),
//                   ),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
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
//                   decoration: InputDecoration(labelText: 'Storage Mode'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//                 TextFormField(
//                   controller: _disposalController,
//                   decoration: InputDecoration(labelText: 'Disposal Mode'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _resetForm();
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: _submitForm,
//             child: Text('Add'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showEditDialog(CDWasteEntry entry) {
//     _dateController.text = DateFormat('yyyy-MM-dd').format(entry.date);
//     _quantityController.text = entry.quantity.toString();
//     _storageController.text = entry.storageMode;
//     _disposalController.text = entry.disposalMode;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Edit C&D Waste Entry'),
//         content: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     labelText: 'Date',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () async {
//                         final date = await showDatePicker(
//                           context: context,
//                           initialDate: entry.date,
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime.now(),
//                         );
//                         if (date != null) {
//                           _dateController.text =
//                               DateFormat('yyyy-MM-dd').format(date);
//                         }
//                       },
//                     ),
//                   ),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
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
//                   decoration: InputDecoration(labelText: 'Storage Mode'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//                 TextFormField(
//                   controller: _disposalController,
//                   decoration: InputDecoration(labelText: 'Disposal Mode'),
//                   validator: (value) =>
//                       value?.isEmpty ?? true ? 'Required field' : null,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _resetForm();
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () => _updateEntry(entry.id),
//             child: Text('Update'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       try {
//         final response = await http.post(
//           Uri.parse('http://54.146.215.18:3000/cd-waste'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode({
//             'date': _dateController.text,
//             'quantity_kg': double.parse(_quantityController.text),
//             'storage_mode': _storageController.text,
//             'disposal_mode': _disposalController.text,
//           }),
//         );

//         if (response.statusCode == 201) {
//           Navigator.pop(context);
//           _fetchData();
//           _fetchStatistics();
//           _resetForm();
//         } else {
//           _showError('Failed to add entry');
//         }
//       } catch (e) {
//         _showError('Error adding entry: $e');
//       }
//     }
//   }

//   Future<void> _updateEntry(int id) async {
//     if (_formKey.currentState?.validate() ?? false) {
//       try {
//         final response = await http.put(
//           Uri.parse('http://your-server-address:3000/cd-waste/$id'),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode({
//             'date': _dateController.text,
//             'quantity_kg': double.parse(_quantityController.text),
//             'storage_mode': _storageController.text,
//             'disposal_mode': _disposalController.text,
//           }),
//         );

//         if (response.statusCode == 200) {
//           Navigator.pop(context);
//           _fetchData();
//           _fetchStatistics();
//           _resetForm();
//         } else {
//           _showError('Failed to update entry');
//         }
//       } catch (e) {
//         _showError('Error updating entry: $e');
//       }
//     }
//   }

//   Future<void> _deleteEntry(int id) async {
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Confirm Delete'),
//         content: Text('Are you sure you want to delete this entry?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context, false),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context, true),
//             child: Text('Delete'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );

//     if (confirmed ?? false) {
//       try {
//         final response =
//             await http.delete(Uri.parse('http://your-server-address:3000/cd-waste/$id'));
//         if (response.statusCode == 200) {
//           _fetchData();
//           _fetchStatistics();
//         } else {
//           _showError('Failed to delete entry');
//         }
//       } catch (e) {
//         _showError('Error deleting entry: $e');
//       }
//     }
//   }

//   void _resetForm() {
//     _dateController.clear();
//     _quantityController.clear();
//     _storageController.clear();
//     _disposalController.clear();
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//     _quantityController.dispose();
//     _storageController.dispose();
//     _disposalController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('C&D Waste Management'),
//         backgroundColor: Colors.teal[700],
//         elevation: 0,
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.teal[100]!, Colors.white],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   await _fetchData();
//                   await _fetchStatistics();
//                 },
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       _buildDateRangeSelector(),
//                       SizedBox(height: 16),
//                       _buildStatisticsCard(),
//                       SizedBox(height: 16),
//                       if (_wasteEntries.isNotEmpty) _buildChart(),
//                       SizedBox(height: 16),
//                       _buildDataTable(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddDialog,
//         child: Icon(Icons.add),
//         backgroundColor: Colors.teal[700],
//       ),
//     );
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