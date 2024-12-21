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



import 'package:flutter/material.dart';
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


class AirPollutionMonitoringPage extends StatelessWidget {
  const AirPollutionMonitoringPage({super.key});

  static const _gridItemPadding = 16.0;
  static const _gridItemBorderRadius = 12.0;
  static const _gridItemTitleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Pollution Control Management'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(_gridItemPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStandardsGrid(context),
                const SizedBox(height: 32),
                _buildMonitoringGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardsGrid(BuildContext context) {
    return _buildGrid(
      [
        _buildStandardGridItem(
          context,
          'Ambient Air Quality Standards',
          const AmbientAirQualityStandardsPage(),
        ),
        _buildStandardGridItem(
          context,
          'Stack Emission Standards',
          const StackEmissionStandardsPage(),
        ),
        _buildStandardGridItem(
          context,
          'Noise Standards',
          const NoiseStandardsPage(),
        ),
        _buildStandardGridItem(
          context,
          'Air Pollution Sources',
          const AirPollutionSourcesPage(),
        ),
      ],
    );
  }

  Widget _buildMonitoringGrid(BuildContext context) {
    return _buildGrid(
      [
        _buildMonitoringGridItem(
          context,
          'Stack Monitoring',
          StackMonitoringPage(),
        ),
        _buildMonitoringGridItem(
          context,
          'Ambient Air Monitoring',
          const AmbientAirMonitoringPage(),
        ),
      ],
    );
  }

  Widget _buildGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: _gridItemPadding,
      crossAxisSpacing: _gridItemPadding,
      childAspectRatio: 3,
      children: children,
    );
  }

  Widget _buildStandardGridItem(
    BuildContext context,
    String title,
    Widget page,
  ) {
    return _buildGridItem(
      context,
      title,
      page,
      Colors.teal.shade400,
    );
  }

  Widget _buildMonitoringGridItem(
    BuildContext context,
    String title,
    Widget page,
  ) {
    return _buildGridItem(
      context,
      title,
      page,
      Colors.teal.shade600,
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    Widget page,
    Color backgroundColor,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: _gridItemPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_gridItemBorderRadius),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        title,
        style: _gridItemTitleTextStyle,
        textAlign: TextAlign.center,
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

  StackMonitoringData({
    required this.source,
    required this.asPerConsent,
    required this.provided,
  });

  factory StackMonitoringData.fromJson(Map<String, dynamic> json) {
    return StackMonitoringData(
      source: json['source'] ?? '',
      asPerConsent: json['asPerConsent'] ?? '',
      provided: json['provided'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'asPerConsent': asPerConsent,
      'provided': provided,
    };
  }
}

class StackMonitoringPageState extends State<StackMonitoringPage> {
  // List to store monitoring data
  List<StackMonitoringData> _monitoringData = <StackMonitoringData>[];
  List<StackMonitoringData> _filteredData = <StackMonitoringData>[];

  // API Base URL (replace with your actual server URL)
  final String _baseUrl = 'http://localhost:3000';

  // Controllers for input fields
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _chimneyConsentController = TextEditingController();
  final TextEditingController _statusProvidedController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  // Sorting variables
  bool _isAscending = true;
  String _sortColumn = 'source';

  @override
  void initState() {
    super.initState();
    _fetchMonitoringData();
  }

  // Fetch monitoring data from API
  Future<void> _fetchMonitoringData() async {
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
    }
  }

  // Method to add new monitoring data
  Future<void> _addMonitoringData() async {
    if (_validateInputs()) {
      final newData = StackMonitoringData(
        source: _sourceController.text.trim(),
        asPerConsent: _chimneyConsentController.text.trim(),
        provided: _statusProvidedController.text.trim(),
      );

      try {
        final response = await http.post(
          Uri.parse('$_baseUrl/stack-monitoring'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(newData.toJson()),
        );

        if (response.statusCode == 201) {
          final addedData = StackMonitoringData.fromJson(
            json.decode(response.body)['data']
          );

          setState(() {
            _monitoringData.add(addedData);
            _filteredData = _monitoringData;
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
      }
    }
  }

  // Input validation method
  bool _validateInputs() {
    if (_sourceController.text.trim().isEmpty ||
        _chimneyConsentController.text.trim().isEmpty ||
        _statusProvidedController.text.trim().isEmpty) {
      _showErrorSnackBar('Please fill in all fields');
      return false;
    }
    return true;
  }

  // Show success snackbar
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Show error snackbar
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Clear input fields
  void _clearInputFields() {
    _sourceController.clear();
    _chimneyConsentController.clear();
    _statusProvidedController.clear();
  }

  // Search and filter method
  void _filterData(String query) {
    setState(() {
      _filteredData = _monitoringData.where((data) {
        return data.source.toLowerCase().contains(query.toLowerCase()) ||
               data.asPerConsent.toLowerCase().contains(query.toLowerCase()) ||
               data.provided.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  // Sorting method
  void _sortData(String columnName) {
    setState(() {
      _isAscending = !_isAscending;
      _sortColumn = columnName;

      _filteredData.sort((a, b) {
        switch (columnName) {
          case 'source':
            return _isAscending
                ? a.source.compareTo(b.source)
                : b.source.compareTo(a.source);
          case 'asPerConsent':
            return _isAscending
                ? a.asPerConsent.compareTo(b.asPerConsent)
                : b.asPerConsent.compareTo(a.asPerConsent);
          case 'provided':
            return _isAscending
                ? a.provided.compareTo(b.provided)
                : b.provided.compareTo(a.provided);
          default:
            return 0;
        }
      });
    });
  }

  // Method to show add data dialog
  void _showAddDataDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Monitoring Data'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _sourceController,
                  decoration: const InputDecoration(
                    labelText: 'Air Pollution Source',
                  ),
                ),
                TextField(
                  controller: _chimneyConsentController,
                  decoration: const InputDecoration(
                    labelText: 'Chimney and APCS As per Consent',
                  ),
                ),
                TextField(
                  controller: _statusProvidedController,
                  decoration: const InputDecoration(
                    labelText: 'Status Provided',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _addMonitoringData,
              child: const Text('Add Data'),
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
        title: const Text('Stack Airflow Monitoring'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchMonitoringData,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Monitoring Data',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterData,
            ),
          ),

          // Data Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _filteredData.isEmpty
                  ? const Center(child: Text('No monitoring data found'))
                  : DataTable(
                      sortColumnIndex: _getSortColumnIndex(_sortColumn),
                      sortAscending: _isAscending,
                      columns: [
                        _buildDataColumn('No.', 'source'),
                        _buildDataColumn('Air Pollution Source', 'source'),
                        _buildDataColumn('Chimney and APCS As per Consent', 'asPerConsent'),
                        _buildDataColumn('Status Provided', 'provided'),
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
                          ],
                        );
                      }).toList(),
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

  // Helper method to get sort column index
  int _getSortColumnIndex(String columnName) {
    switch (columnName) {
      case 'source':
        return 1; // Adjusted to match new column order
      case 'asPerConsent':
        return 2;
      case 'provided':
        return 3;
      default:
        return 1;
    }
  }

  // Method to build sortable data column
  DataColumn _buildDataColumn(String label, String columnName) {
    return DataColumn(
      label: Text(label),
      onSort: columnName == 'source' ? null : (columnIndex, ascending) => _sortData(columnName),
    );
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