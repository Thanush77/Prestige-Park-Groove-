// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ExcelViewPage extends StatelessWidget {
//   final String excelPath;

//   const ExcelViewPage({super.key, required this.excelPath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Excel Data'),
//       ),
//       body: Center(
//         child: Text('Displaying data from $excelPath'),
//       ),
//     );
//   }
// }
// class AirPollutionPage extends StatelessWidget {
//   const AirPollutionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Air Pollution Data',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.teal,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.teal.shade50, Colors.white],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Title Card
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       const Icon(Icons.air, size: 40, color: Colors.teal),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Air Quality Monitoring',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.teal.shade700,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Environmental Impact Assessment',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Info Cards in Grid
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 1.1,
//                 children: [
//                   _buildInfoCard('NMHC', 'Non-Methane Hydrocarbon', 'kPa'),
//                   _buildInfoCard('NO2', 'Nitrogen Dioxide', 'µg/m³'),
//                   _buildInfoCard('NOx', 'Oxides of Nitrogen', 'ppb'),
//                   _buildInfoCard('O2', 'Oxygen', '%'),
//                   _buildInfoCard('CO', 'Carbon Monoxide', 'mg/Nm³'),
//                   _buildInfoCard('SO2', 'Sulphur Dioxide', 'ppb'),
//                   _buildInfoCard('PM2.5', 'Fine Particulate Matter', 'µg/m³'),
//                   _buildInfoCard('PM10', 'Coarse Particulate Matter', 'µg/m³'),
//                 ],
//               ),

//               const SizedBox(height: 24),

//               // View Excel Button
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.table_chart, color: Colors.white),
//                 label: const Text(
//                   'View Detailed Data',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                 ),
//                 onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ExcelViewPage(
//                       excelPath: 'assets/Air_pollution.xlsx',
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Footer Card
//               Card(
//                 elevation: 2,
//                 color: Colors.teal.shade50,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.update, size: 16, color: Colors.grey),
//                           SizedBox(width: 8),
//                           Text(
//                             'Last Updated: Daily',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.science, size: 16, color: Colors.grey),
//                           SizedBox(width: 8),
//                           Text(
//                             'Source: Air Quality Monitoring Station',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard(String title, String subtitle, String unit) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.cloud_outlined, size: 28, color: Colors.teal),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               'Unit: $unit',
//               style: const TextStyle(
//                 fontSize: 11,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AirPollutionMonitoringPage extends StatefulWidget {
//   const AirPollutionMonitoringPage({super.key});

//   @override
//   _AirPollutionMonitoringPageState createState() => _AirPollutionMonitoringPageState();
// }

// class _AirPollutionMonitoringPageState extends State<AirPollutionMonitoringPage> {
//   // List of environmental monitoring icons with URLs
//   final List<MonitoringIcon> _environmentIcons = [
//     MonitoringIcon(
//       title: 'PM2.5 Monitor',
//       icon: Icons.air,
//       description: 'Fine Particulate Monitoring',
//       url: 'https://www.epa.gov/pm-pollution',
//     ),
//     MonitoringIcon(
//       title: 'CO2 Tracker',
//       icon: Icons.cloud_outlined,
//       description: 'Carbon Dioxide Levels',
//       url: 'https://climate.nasa.gov/vital-signs/carbon-dioxide/',
//     ),
//     MonitoringIcon(
//       title: 'Ozone Level',
//       icon: Icons.wb_sunny,
//       description: 'Atmospheric Ozone',
//       url: 'https://www.epa.gov/ozone-pollution',
//     ),
//     MonitoringIcon(
//       title: 'Air Quality Index',
//       icon: Icons.analytics_outlined,
//       description: 'Real-time Air Quality',
//       url: 'https://www.airnow.gov/',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Environmental Monitoring',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.teal,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.teal.shade50, Colors.white],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Main Monitoring Type Buttons
//                 _buildMonitoringTypeButtons(),

//                 const SizedBox(height: 24),

//                 // Environmental Monitoring Icons Grid
//                 _buildEnvironmentalMonitoringGrid(),

//                 const SizedBox(height: 24),

//                 // Detailed Information Cards
//                 _buildDetailedInformationCards(),

//                 const SizedBox(height: 16),

//                 // Footer Information
//                 _buildFooterInformation(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMonitoringTypeButtons() {
//     return Column(
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade400,
//             minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           onPressed: () {
//             // Navigate to Ambient Air Monitoring Page
//             _launchURL('https://www.epa.gov/air-trends/ambient-air-monitoring');
//           },
//           child: const Text(
//             'Ambient Air Monitoring',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           onPressed: () {
//             // Navigate to Stack Airflow Monitoring Page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const StackMonitoringPage(),
//               ),
//             );
//           },
//           child: const Text(
//             'Stack Airflow Monitoring',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildEnvironmentalMonitoringGrid() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1.0,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: _environmentIcons.length,
//       itemBuilder: (context, index) {
//         return _buildMonitoringIconCard(_environmentIcons[index]);
//       },
//     );
//   }

//   Widget _buildMonitoringIconCard(MonitoringIcon monitoringIcon) {
//     return GestureDetector(
//       onTap: () => _launchURL(monitoringIcon.url),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 monitoringIcon.icon,
//                 size: 40,
//                 color: Colors.teal.shade600,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 monitoringIcon.title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 monitoringIcon.description,
//                 style: const TextStyle(
//                   fontSize: 10,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailedInformationCards() {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Monitoring Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal.shade700,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildDetailRow(
//               Icons.location_on,
//               'Monitoring Stations',
//               '24/7 Active Monitoring',
//             ),
//             _buildDetailRow(
//               Icons.science,
//               'Precision Instruments',
//               'High-Accuracy Sensors',
//             ),
//             _buildDetailRow(
//               Icons.cloud_upload,
//               'Real-time Data',
//               'Instant Environmental Insights',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(IconData icon, String title, String subtitle) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.teal.shade600),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterInformation() {
//     return Card(
//       color: Colors.teal.shade50,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.update, color: Colors.teal.shade600),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Last Updated: Real-time',
//                   style: TextStyle(color: Colors.teal),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Environmental Monitoring Network',
//               style: TextStyle(
//                 color: Colors.teal.shade700,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Utility method to launch URLs
//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Could not launch $url'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

// // Custom class to represent monitoring icons
// class MonitoringIcon {
//   final String title;
//   final IconData icon;
//   final String description;
//   final String url;

//   MonitoringIcon({
//     required this.title,
//     required this.icon,
//     required this.description,
//     required this.url,
//   });
// }

// class StackMonitoringPage extends StatefulWidget {
//   const StackMonitoringPage({super.key});

//   @override
//   _StackMonitoringPageState createState() => _StackMonitoringPageState();
// }

// class _StackMonitoringPageState extends State<StackMonitoringPage> {
//   final List<Map<String, dynamic>> _data = [];
//   final TextEditingController _sourceController = TextEditingController();
//   final TextEditingController _asPerConsentController = TextEditingController();
//   final TextEditingController _providedController = TextEditingController();
//   final TextEditingController _controlSystemController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stack Airflow Monitoring'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildInputForm(),
//             const SizedBox(height: 16),
//             _buildDataTable(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputForm() {
//     return Column(
//       children: [
//         TextField(
//           controller: _sourceController,
//           decoration: const InputDecoration(labelText: 'Source of Air Pollution'),
//         ),
//         TextField(
//           controller: _asPerConsentController,
//           decoration: const InputDecoration(labelText: 'Chimney Provided (As per Consent)'),
//         ),
//         TextField(
//           controller: _providedController,
//           decoration: const InputDecoration(labelText: 'Chimney Provided (Provided)'),
//         ),
//         TextField(
//           controller: _controlSystemController,
//           decoration: const InputDecoration(labelText: 'Air Pollution Control System'),
//         ),
//         const SizedBox(height: 16),
//         ElevatedButton(
//           onPressed: _addData,
//           child: const Text('Add Data'),
//         ),
//       ],
//     );
//   }

//   void _addData() {
//     setState(() {
//       _data.add({
//         'source': _sourceController.text,
//         'asPerConsent': _asPerConsentController.text,
//         'provided': _providedController.text,
//         'controlSystem': _controlSystemController.text,
//       });
//       _sourceController.clear();
//       _asPerConsentController.clear();
//       _providedController.clear();
//       _controlSystemController.clear();
//     });
//   }

//   Widget _buildDataTable() {
//     return Expanded(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columns: const [
//             DataColumn(label: Text('Source of Air Pollution')),
//             DataColumn(label: Text('Chimney Provided (As per Consent)')),
//             DataColumn(label: Text('Chimney Provided (Provided)')),
//             DataColumn(label: Text('Air Pollution Control System')),
//           ],
//           rows: _data.map((data) {
//             return DataRow(cells: [
//               DataCell(Text(data['source'])),
//               DataCell(Text(data['asPerConsent'])),
//               DataCell(Text(data['provided'])),
//               DataCell(Text(data['controlSystem'])),
//             ]);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// class AirPollutionMonitoringPage extends StatefulWidget {
//   const AirPollutionMonitoringPage({super.key});

//   @override
//   _AirPollutionMonitoringPageState createState() => _AirPollutionMonitoringPageState();
// }

// class _AirPollutionMonitoringPageState extends State<AirPollutionMonitoringPage> {
//   // List of environmental monitoring types with their URLs
//   final List<MonitoringType> _monitoringTypes = [
//     MonitoringType(
//       title: 'MW Monitering',
//       url: 'https://www.epa.gov/pm-pollution',
//     ),
//     MonitoringType(
//       title: 'NOx Monitoring',
//       url: 'https://climate.nasa.gov/vital-signs/carbon-dioxide/',
//     ),
//     MonitoringType(
//       title: 'NO2 Monitoring',
//       url: 'https://www.epa.gov/ozone-pollution',
//     ),
//     MonitoringType(
//       title: 'O2',
//       url: 'https://www.airnow.gov/',
//     ),
//     MonitoringType(
//       title: 'NMHC',
//       url: 'https://www.airnow.gov/',
//     ),
//     MonitoringType(
//       title: 'C',
//       url: 'https://www.airnow.gov/',
//     ),
//     MonitoringType(
//       title: 'PM',
//       url: 'https://www.airnow.gov/',
//     ),
//     MonitoringType(
//       title: 'CO',
//       url: 'https://www.airnow.gov/',
//     ),
//     MonitoringType(
//       title: 'SO2',
//       url: 'https://www.airnow.gov/',
//     ),
//   ];
//   // Method to show ambient air quality standards
//   void _showAirQualityStandards() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Ambient Air Quality Standards'),
//           content: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text('PM2.5: 35 µg/m³ (24-hour), 12 µg/m³ (annual)'),
//                 Text('PM10: 150 µg/m³ (24-hour)'),
//                 Text('NO2: 100 ppb (1-hour), 53 ppb (annual)'),
//                 Text('SO2: 75 ppb (1-hour)'),
//                 Text('CO: 9 ppm (8-hour), 35 ppm (1-hour)'),
//                 Text('O3: 70 ppb (8-hour)'),
//                 Text('Pb: 0.15 µg/m³ (3-month average)'),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
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
//         title: const Text(
//           'Environmental Monitoring',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.teal,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.teal.shade50, Colors.white],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Main Monitoring Type Buttons
//                 _buildMonitoringTypeButtons(),

//                 const SizedBox(height: 24),

//                 // Environmental Monitoring Grid
//                 _buildEnvironmentalMonitoringGrid(),

//                 const SizedBox(height: 24),

//                 // Ambient Air Quality Standards Button
//                 ElevatedButton(
//                   onPressed: _showAirQualityStandards,
//                   child: const Text('Ambient Air Quality Standards'),
//                 ),

//                 const SizedBox(height: 24),

//                 // Detailed Information Cards
//                 _buildDetailedInformationCards(),

//                 const SizedBox(height: 16),

//                 // Footer Information
//                 _buildFooterInformation(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//       //Icons 
//   Widget _buildEnvironmentalMonitoringGrid() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Wrap(
//         spacing: 8,
//         runSpacing: 8,
//         children: _monitoringTypes.map((monitoringType) {
//           return _buildMonitoringTypeItem(monitoringType);
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildMonitoringTypeItem(MonitoringType monitoringType) {
//     return GestureDetector(
//       onTap: () => _launchURL(monitoringType.url),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.4,
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Text(
//           monitoringType.title,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
//   Widget _buildMonitoringTypeButtons() {
//     return Column(
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade400,
//             minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           onPressed: () {
//             // Navigate to Ambient Air Monitoring Page
//             _launchURL('https://www.epa.gov/air-trends/ambient-air-monitoring');
//           },
//           child: const Text(
//             'Ambient Air Monitoring',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           onPressed: () {
//             // Navigate to Stack Airflow Monitoring Page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const StackMonitoringPage(),
//               ),
//             );
//           },
//           child: const Text(
//             'Stack Monitoring',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailedInformationCards() {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Monitoring Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal.shade700,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _buildDetailRow(
//               Icons.location_on,
//               'Monitoring Stations',
//               '24/7 Active Monitoring',
//             ),
//             _buildDetailRow(
//               Icons.science,
//               'Precision Instruments',
//               'High-Accuracy Sensors',
//             ),
//             _buildDetailRow(
//               Icons.cloud_upload,
//               'Real-time Data',
//               'Instant Environmental Insights',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(IconData icon, String title, String subtitle) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.teal.shade600),
//           const SizedBox(width: 7),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterInformation() {
//     return Card(
//       color: Colors.teal.shade50,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.update, color: Colors.teal.shade600),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Last Updated: Real-time',
//                   style: TextStyle(color: Colors.teal),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Environmental Monitoring Network',
//               style: TextStyle(
//                 color: Colors.teal.shade700,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Utility method to launch URLs
//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Could not launch $url'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

// // Custom class to represent monitoring types
// class MonitoringType {
//   final String title;
//   final String url;

//   MonitoringType({
//     required this.title,
//     required this.url,
//   });
// }






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
//                 // Standards Grid
//                 _buildStandardsGrid(context),
//                 const SizedBox(height: 32),

//                 // Monitoring Grid
//                 _buildMonitoringGrid(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Utility method to build standards grid
//   Widget _buildStandardsGrid(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//       childAspectRatio: 3,
//       children: [
//         _buildStandardButton(
//           context,
//           'Ambient Air Quality Standards',
//           const AmbientAirQualityStandardsPage(),
//         ),
//         _buildStandardButton(
//           context,
//           'Stack Emission Standards',
//           const StackEmissionStandardsPage(),
//         ),
//         _buildStandardButton(
//           context,
//           'Noise Standards',
//           const NoiseStandardsPage(),
//         ),
//         _buildStandardButton(
//           context,
//           'Air Pollution Sources',
//           const AirPollutionSourcesPage(),
//         ),
//       ],
//     );
//   }

//   // Utility method to build monitoring grid
//   Widget _buildMonitoringGrid(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//       childAspectRatio: 3,
//       children: [
//         _buildMonitoringButton(
//           context,
//           'Stack Monitoring',
//           const StackMonitoringPage(),
//         ),
//         _buildMonitoringButton(
//           context,
//           'Ambient Air Monitoring',
//           const AmbientAirMonitoringPage(),
//         ),
//       ],
//     );
//   }

//   // Utility method to build standard buttons
//   Widget _buildStandardButton(BuildContext context, String title, Widget page) {
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
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   // Utility method to build monitoring buttons
//   Widget _buildMonitoringButton(BuildContext context, String title, Widget page) {
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
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
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
//           'Ambient Air Monitoring Page',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

// class StackMonitoringPage extends StatefulWidget {
//   const StackMonitoringPage({super.key});

//   @override
//   _StackMonitoringPageState createState() => _StackMonitoringPageState();
// }

// class StackMonitoringData {
//   final int? id;
//   final String source;
//   final String asPerConsent;
//   final String provided;
//   final String controlSystem;

//   StackMonitoringData({
//     this.id,
//     required this.source,
//     required this.asPerConsent,
//     required this.provided,
//     required this.controlSystem,
//   });

//   // Factory constructor to create a StackMonitoringData from JSON
//   factory StackMonitoringData.fromJson(Map<String, dynamic> json) {
//     return StackMonitoringData(
//       id: json['id'],
//       source: json['source'],
//       asPerConsent: json['as_per_consent'],
//       provided: json['provided'],
//       controlSystem: json['control_system'],
//     );
//   }

//   // Method to convert StackMonitoringData to JSON
//   Map<String, dynamic> toJson() => {
//     'source': source,
//     'asPerConsent': asPerConsent,
//     'provided': provided,
//     'controlSystem': controlSystem,
//   };
// }

// class _StackMonitoringPageState extends State<StackMonitoringPage> {
//   // List to store monitoring data
//   List<StackMonitoringData> _monitoringData = <StackMonitoringData>[];
//   List<StackMonitoringData> _filteredData = <StackMonitoringData>[];

//   // API Base URL (replace with your actual server URL)
//   final String _baseUrl = 'http://localhost:3000';

//   // Controllers for input fields
//   final TextEditingController _sourceController = TextEditingController();
//   final TextEditingController _asPerConsentController = TextEditingController();
//   final TextEditingController _providedController = TextEditingController();
//   final TextEditingController _controlSystemController = TextEditingController();
//   final TextEditingController _searchController = TextEditingController();

//   // Sorting variables
//   bool _isAscending = true;
//   String _sortColumn = 'source';

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
//       _showErrorSnackBar('Please fill in all fields');
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
//           // Search and Filter Section
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Monitoring Data',
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

import 'dart:convert';

class AirPollutionMonitoringPage extends StatefulWidget {
  const AirPollutionMonitoringPage({super.key});

  @override
  State<AirPollutionMonitoringPage> createState() => _AirPollutionMonitoringPageState();
}

class _AirPollutionMonitoringPageState extends State<AirPollutionMonitoringPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isRealTimeMonitoring = false;
  DateTime _selectedDate = DateTime.now();
  final List<String> _notifications = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _simulateNotifications();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _simulateNotifications() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _notifications.insert(0, 'PM2.5 levels exceeded threshold at Stack 1');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
      endDrawer: _buildSettingsDrawer(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Air Pollution Control'),
      backgroundColor: Colors.teal,
      bottom: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Overview'),
          Tab(text: 'Analytics'),
          Tab(text: 'Alerts'),
        ],
      ),
      actions: [
        Builder(
          builder: (context) => Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _showNotifications,
              ),
              if (_notifications.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '${_notifications.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildOverviewTab(),
        _buildAnalyticsTab(),
        _buildAlertsTab(),
      ],
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentStatus(),
          const SizedBox(height: 24),
          _buildRealtimeChart(),
          const SizedBox(height: 24),
          _buildMonitoringGrids(),
        ],
      ),
    );
  }

  Widget _buildMonitoringGrids() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Monitoring Stations',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
              children: [
                _buildMonitoringGridItem(
                  context,
                  'Stack Monitoring',
                  Icons.analytics,
                  StackMonitoringPage(),
                ),
                _buildMonitoringGridItem(
                  context,
                  'Ambient Air Monitoring',
                  Icons.dashboard,
                  const PlaceholderPage(title: 'Ambient Air Monitoring'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildMonitoringGridItem(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal.shade600,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusIndicator('PM2.5', '35 µg/m³', Colors.orange),
                _buildStatusIndicator('PM10', '75 µg/m³', Colors.red),
                _buildStatusIndicator('SO2', '40 ppb', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRealtimeChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Real-time Monitoring',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: _isRealTimeMonitoring,
                  onChanged: (value) {
                    setState(() {
                      _isRealTimeMonitoring = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                _mainData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _mainData() {
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toInt()}h',
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toInt()}',
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 30),
            const FlSpot(4, 35),
            const FlSpot(8, 40),
            const FlSpot(12, 38),
            const FlSpot(16, 42),
            const FlSpot(20, 35),
            const FlSpot(24, 32),
          ],
          isCurved: true,
          color: Colors.teal,
          barWidth: 3,
          dotData: FlDotData(show: false),
        ),
      ],
    );
  }

  Widget _buildAnalyticsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSelector(),
          const SizedBox(height: 24),
          _buildPollutantDistribution(),
          const SizedBox(height: 24),
          _buildComparisonChart(),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Card(
      child: ListTile(
        title: Text(
          'Data for ${DateFormat('MMM d, yyyy').format(_selectedDate)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != _selectedDate) {
              setState(() {
                _selectedDate = picked;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildPollutantDistribution() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pollutant Distribution',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 35,
                      title: 'PM2.5',
                      color: Colors.blue,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      value: 25,
                      title: 'PM10',
                      color: Colors.green,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      value: 20,
                      title: 'SO2',
                      color: Colors.orange,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      value: 20,
                      title: 'NOx',
                      color: Colors.red,
                      radius: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historical Comparison',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 75, color: Colors.teal),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 85, color: Colors.teal),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 65, color: Colors.teal),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertsTab() {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.orange),
            title: Text(_notifications[index]),
            subtitle: Text(
              DateFormat('MMM d, yyyy HH:mm').format(DateTime.now()),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _notifications.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {
              // Implement notification settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Data Refresh Rate'),
            onTap: () {
              // Implement data refresh rate settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Theme Settings'),
            onTap: () {
              // Implement theme settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // Implement help & support
            },
          ),
        ],
      ),
    );
  }

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.notification_important),
              title: Text(_notifications[index]),
              subtitle: Text(
                DateFormat('MMM d, yyyy HH:mm').format(DateTime.now()),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          // Simulate new data refresh
          _notifications.insert(0, 'Data refreshed at ${DateFormat('HH:mm:ss').format(DateTime.now())}');
        });
      },
      backgroundColor: Colors.teal,
      child: const Icon(Icons.refresh),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          '$title\nComing Soon',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class AmbientAirMonitoringPage extends StatelessWidget {
  const AmbientAirMonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambient Air Monitoring'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Ambient Air Monitoring Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}



class StackMonitoringPage extends StatefulWidget {
  @override
  StackMonitoringPageState createState() => StackMonitoringPageState();
}
class StackMonitoringData {
  final String source;
  final String asPerConsent;
  final String provided;
  final DateTime timestamp;
  final String status;
  final String id;

  StackMonitoringData({
    required this.source,
    required this.asPerConsent,
    required this.provided,
    required this.timestamp,
    required this.status,
    required this.id,
  });

  factory StackMonitoringData.fromJson(Map<String, dynamic> json) {
    return StackMonitoringData(
      source: json['source']?.toString() ?? '',  // Convert to String and provide default
      asPerConsent: json['asPerConsent']?.toString() ?? '',
      provided: json['provided']?.toString() ?? '',
      timestamp: json['timestamp'] != null 
        ? DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now()
        : DateTime.now(),
      status: json['status']?.toString() ?? 'Active',
      id: json['id']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'asPerConsent': asPerConsent,
      'provided': provided,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'id': id,
    };
  }
}

class StackMonitoringPageState extends State<StackMonitoringPage> {
  List<StackMonitoringData> _monitoringData = [];
  List<StackMonitoringData> _filteredData = [];
  final String _baseUrl = 'http://54.146.215.18:3000';
  
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _chimneyConsentController = TextEditingController();
  final TextEditingController _statusProvidedController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  
  String _selectedStatus = 'Active';
  String _filterStatus = 'All';
  bool _isAscending = true;
  String _sortColumn = 'source';
  bool _isLoading = false;

  final List<String> _statusOptions = ['Active', 'Inactive', 'Maintenance', 'Critical'];

  @override
  void initState() {
    super.initState();
    _fetchMonitoringData();
  }

  @override
  void dispose() {
    _sourceController.dispose();
    _chimneyConsentController.dispose();
    _statusProvidedController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchMonitoringData() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse('$_baseUrl/stack-monitoring'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['data'];
        setState(() {
          _monitoringData = responseData
              .map((data) => StackMonitoringData.fromJson(data))
              .toList();
          _filteredData = _monitoringData;
        });
      } else {
        _showErrorSnackBar('Failed to load monitoring data');
      }
    } catch (e) {
      _showErrorSnackBar('Error connecting to server');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _addMonitoringData() async {
    if (_validateInputs()) {
      final newData = StackMonitoringData(
        source: _sourceController.text.trim(),
        asPerConsent: _chimneyConsentController.text.trim(),
        provided: _statusProvidedController.text.trim(),
        timestamp: DateTime.now(),
        status: _selectedStatus,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      try {
        setState(() => _isLoading = true);
        final response = await http.post(
          Uri.parse('$_baseUrl/stack-monitoring'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(newData.toJson()),
        );

        if (response.statusCode == 201) {
          setState(() {
            _monitoringData.add(newData);
            _filterData(_searchController.text);
            _clearInputFields();
          });

          if (mounted) {
            Navigator.of(context).pop();
          }
          _showSuccessSnackBar('Monitoring data added successfully');
        } else {
          final errorMessage = json.decode(response.body)['error'];
          _showErrorSnackBar(errorMessage ?? 'Failed to add monitoring data');
        }
      } catch (e) {
        _showErrorSnackBar('Error connecting to server');
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _updateMonitoringData(StackMonitoringData oldData) async {
    if (_validateInputs()) {
      final updatedData = StackMonitoringData(
        id: oldData.id,
        source: _sourceController.text.trim(),
        asPerConsent: _chimneyConsentController.text.trim(),
        provided: _statusProvidedController.text.trim(),
        timestamp: DateTime.now(),
        status: _selectedStatus,
      );

      try {
        setState(() => _isLoading = true);
        final response = await http.put(
          Uri.parse('$_baseUrl/stack-monitoring/${oldData.id}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(updatedData.toJson()),
        );

        if (response.statusCode == 200) {
          setState(() {
            final index = _monitoringData.indexWhere((item) => item.id == oldData.id);
            if (index != -1) {
              _monitoringData[index] = updatedData;
              _filterData(_searchController.text);
            }
            _clearInputFields();
          });

          if (mounted) {
            Navigator.of(context).pop();
          }
          _showSuccessSnackBar('Monitoring data updated successfully');
        } else {
          _showErrorSnackBar('Failed to update monitoring data');
        }
      } catch (e) {
        _showErrorSnackBar('Error connecting to server');
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _deleteMonitoringData(StackMonitoringData data) async {
    try {
      setState(() => _isLoading = true);
      final response = await http.delete(
        Uri.parse('$_baseUrl/stack-monitoring/${data.id}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _monitoringData.removeWhere((item) => item.id == data.id);
          _filterData(_searchController.text);
        });
        _showSuccessSnackBar('Monitoring data deleted successfully');
      } else {
        _showErrorSnackBar('Failed to delete monitoring data');
      }
    } catch (e) {
      _showErrorSnackBar('Error connecting to server');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  bool _validateInputs() {
    if (_sourceController.text.trim().isEmpty ||
        _chimneyConsentController.text.trim().isEmpty ||
        _statusProvidedController.text.trim().isEmpty) {
      _showErrorSnackBar('Please fill in all fields');
      return false;
    }
    return true;
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _clearInputFields() {
    _sourceController.clear();
    _chimneyConsentController.clear();
    _statusProvidedController.clear();
    _selectedStatus = 'Active';
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _monitoringData.where((data) {
        final matchesQuery = data.source.toLowerCase().contains(query.toLowerCase()) ||
               data.asPerConsent.toLowerCase().contains(query.toLowerCase()) ||
               data.provided.toLowerCase().contains(query.toLowerCase());
        
        final matchesStatus = _filterStatus == 'All' || data.status == _filterStatus;
        
        return matchesQuery && matchesStatus;
      }).toList();
    });
  }

  void _sortData(String columnName) {
    setState(() {
      if (_sortColumn == columnName) {
        _isAscending = !_isAscending;
      } else {
        _sortColumn = columnName;
        _isAscending = true;
      }

      _filteredData.sort((a, b) {
        var comparison = 0;
        switch (columnName) {
          case 'source':
            comparison = a.source.compareTo(b.source);
            break;
          case 'asPerConsent':
            comparison = a.asPerConsent.compareTo(b.asPerConsent);
            break;
          case 'provided':
            comparison = a.provided.compareTo(b.provided);
            break;
          case 'status':
            comparison = a.status.compareTo(b.status);
            break;
          case 'timestamp':
            comparison = a.timestamp.compareTo(b.timestamp);
            break;
        }
        return _isAscending ? comparison : -comparison;
      });
    });
  }

  void _showAddDataDialog() {
    _clearInputFields();
    showDialog(
      context: context,
      builder: (context) => _buildDataDialog('Add Monitoring Data', _addMonitoringData),
    );
  }

  void _showEditDialog(StackMonitoringData data) {
    _sourceController.text = data.source;
    _chimneyConsentController.text = data.asPerConsent;
    _statusProvidedController.text = data.provided;
    _selectedStatus = data.status;
    
    showDialog(
      context: context,
      builder: (context) => _buildDataDialog(
        'Edit Monitoring Data',
        () => _updateMonitoringData(data),
      ),
    );
  }

  Widget _buildDataDialog(String title, VoidCallback onSave) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_chart, color: Colors.teal),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _sourceController,
                decoration: InputDecoration(
                  labelText: 'Air Pollution Source',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.source),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _chimneyConsentController,
                decoration: InputDecoration(
                  labelText: 'Chimney and APCS As per Consent',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.architecture),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _statusProvidedController,
                decoration: InputDecoration(
                  labelText: 'Status Provided',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.info_outline),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.linear_scale),
                ),
                items: _statusOptions.map((String status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedStatus = newValue;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.cancel),
          label: Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: onSave,
          icon: Icon(Icons.save),
          label: Text('Save'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
          ),
        ),
      ],
    );
  }

  void _showDeleteConfirmation(StackMonitoringData data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Are you sure you want to delete this monitoring data?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteMonitoringData(data);
            },
            child: Text('Delete'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search Monitoring Data',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        onChanged: _filterData,
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _filterStatus,
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                items: ['All', ..._statusOptions].map((String status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _filterStatus = newValue;
                      _filterData(_searchController.text);
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stack Airflow Monitoring',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchMonitoringData,
            tooltip: 'Refresh Data',
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
            tooltip: 'Filter Data',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildDataTable(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDataDialog,
        backgroundColor: Colors.teal,
        icon: Icon(Icons.add),
        label: Text('Add Data'),
        tooltip: 'Add new monitoring data',
      ),
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _filteredData.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hourglass_empty, size: 48, color: Colors.grey), // Changed from no_data to hourglass_empty
                    SizedBox(height: 16),
                    Text(
                      'No monitoring data found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : DataTable(
              sortColumnIndex: _getSortColumnIndex(_sortColumn),
              sortAscending: _isAscending,
              headingRowColor: MaterialStateProperty.all(Colors.teal.shade50),
              headingTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
                fontSize: 14,
              ),
              dataRowColor: MaterialStateProperty.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.teal.shade50;
                  }
                  return null;
                },
              ),
              columns: [
                _buildDataColumn('No.', null),
                _buildDataColumn('Source', 'source'),
                _buildDataColumn('Consent', 'asPerConsent'),
                _buildDataColumn('Status Provided', 'provided'),
                _buildDataColumn('Current Status', 'status'),
                _buildDataColumn('Timestamp', 'timestamp'),
                _buildDataColumn('Actions', null),
              ],
              rows: _filteredData.asMap().entries.map((entry) {
                final int index = entry.key;
                final data = entry.value;
                return DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text(data.source)),
                    DataCell(Text(data.asPerConsent)),
                    DataCell(Text(data.provided)),
                    DataCell(_buildStatusCell(data.status)),
                    DataCell(Text(
                      DateFormat('yyyy-MM-dd HH:mm').format(data.timestamp)
                    )),
                    DataCell(_buildActionButtons(data)),
                  ],
                );
              }).toList(),
            ),
    );
  }

  Widget _buildStatusCell(String status) {
    Color statusColor;
    IconData statusIcon;
    
    switch (status.toLowerCase()) {
      case 'active':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'inactive':
        statusColor = Colors.grey;
        statusIcon = Icons.cancel;
        break;
      case 'maintenance':
        statusColor = Colors.orange;
        statusIcon = Icons.build;
        break;
      case 'critical':
        statusColor = Colors.red;
        statusIcon = Icons.warning;
        break;
      default:
        statusColor = Colors.blue;
        statusIcon = Icons.info;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, size: 16, color: statusColor),
          SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(StackMonitoringData data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _showEditDialog(data),
          tooltip: 'Edit',
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () => _showDeleteConfirmation(data),
          tooltip: 'Delete',
        ),
      ],
    );
  }

  DataColumn _buildDataColumn(String label, String? columnName) {
    return DataColumn(
      label: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onSort: columnName == null ? null : (columnIndex, ascending) => _sortData(columnName),
    );
  }

  int _getSortColumnIndex(String columnName) {
    switch (columnName) {
      case 'source':
        return 1;
      case 'asPerConsent':
        return 2;
      case 'provided':
        return 3;
      case 'status':
        return 4;
      case 'timestamp':
        return 5;
      default:
        return 1;
    }
  }
}
class AmbientAirQualityStandardsPage extends StatelessWidget {
  const AmbientAirQualityStandardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambient Air Quality Standards'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _StandardCard(
            title: 'PM 10 (ug/m3)',
            standards: [
              'PM2.5: 35 µg/m³ (24-hour), 12 µg/m³ (annual)',
              'PM10: 150 µg/m³ (24-hour)',
            ],
          ),
          _StandardCard(
            title: 'Gaseous Pollutants',
            standards: [
              'NO2: 100 ppb (1-hour), 53 ppb (annual)',
              'SO2: 75 ppb (1-hour)',
              'CO: 9 ppm (8-hour), 35 ppm (1-hour)',
              'O3: 70 ppb (8-hour)',
            ],
          ),
          _StandardCard(
            title: 'Other Pollutants',
            standards: [
              'Lead (Pb): 0.15 µg/m³ (3-month average)',
            ],
          ),
        ],
      ),
    );
  }
}

// Stack Emission Standards Page
class StackEmissionStandardsPage extends StatelessWidget {
  const StackEmissionStandardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Emission Standards'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _StandardCard(
            title: 'Particulate Emissions',
            standards: [
              'Coal-based Plants: 50 mg/Nm³',
              'Gas-based Plants: 30 mg/Nm³',
            ],
          ),
          _StandardCard(
            title: 'Gaseous Emissions',
            standards: [
              'SO2: 100 mg/Nm³',
              'NOx: 50-100 mg/Nm³ (depending on plant type)',
              'CO: 75 mg/Nm³',
            ],
          ),
        ],
      ),
    );
  }
}

// Noise Standards Page
class NoiseStandardsPage extends StatelessWidget {
  const NoiseStandardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noise Standards'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _StandardCard(
            title: 'Industrial Areas',
            standards: [
              'Day Time: 75 dB(A)',
              'Night Time: 70 dB(A)',
            ],
          ),
          _StandardCard(
            title: 'Commercial Areas',
            standards: [
              'Day Time: 65 dB(A)',
              'Night Time: 55 dB(A)',
            ],
          ),
          _StandardCard(
            title: 'Residential Areas',
            standards: [
              'Day Time: 55 dB(A)',
              'Night Time: 45 dB(A)',
            ],
          ),
          _StandardCard(
            title: 'Silence Zone',
            standards: [
              'Day Time: 50 dB(A)',
              'Night Time: 40 dB(A)',
            ],
          ),
        ],
      ),
    );
  }
}

class AirPollutionSourcesPage extends StatelessWidget {
  const AirPollutionSourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Pollution Sources'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _StandardCard(
            title: 'Industrial Sources',
            standards: [
              'Power Plants',
              'Manufacturing Facilities',
              'Chemical Processing Plants',
              'Refineries',
            ],
          ),
          _StandardCard(
            title: 'Transportation Sources',
            standards: [
              'Vehicles (Cars, Trucks, Buses)',
              'Two-wheelers',
              'Diesel Generators',
            ],
          ),
          _StandardCard(
            title: 'Agricultural Sources',
            standards: [
              'Crop Burning',
              'Livestock',
              'Agricultural Machinery',
            ],
          ),
          _StandardCard(
            title: 'Residential Sources',
            standards: [
              'Cooking with Solid Fuels',
              'Heating',
              'Waste Burning',
            ],
          ),
          
        ],
      ),
    );
  }
}

class _StandardCard extends StatelessWidget {
  final String title;
  final List<String> standards;

  const _StandardCard({
    required this.title,
    required this.standards,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 10),
            ...standards.map((standard) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '• $standard',
                style: const TextStyle(fontSize: 16),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}