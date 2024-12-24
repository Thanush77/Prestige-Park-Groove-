import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'TankerPage.dart';
import 'BorewellPage.dart';
import 'ConsumptionPage.dart';
import 'package:fl_chart/fl_chart.dart';


class WaterConsumptionData {
  final int total;
  final int thisMonth;
  final int today;
  final List<double> weeklyData;
  final List<double> monthlyData;

  WaterConsumptionData({
    required this.total,
    required this.thisMonth,
    required this.today,
    required this.weeklyData,
    required this.monthlyData,
  });

  factory WaterConsumptionData.fromJson(Map<String, dynamic> json) {
    return WaterConsumptionData(
      total: json['total'] ?? 0,
      thisMonth: json['thisMonth'] ?? 0,
      today: json['today'] ?? 0,
      weeklyData: List<double>.from(json['weeklyData'] ?? [100, 150, 200, 180, 220, 250, 190]),
      monthlyData: List<double>.from(json['monthlyData'] ?? [1000, 1200, 1500, 1300, 1600, 1400]),
    );
  }
}

class WaterConsumptionPage extends StatefulWidget {
  const WaterConsumptionPage({super.key});

  @override
  _WaterConsumptionPageState createState() => _WaterConsumptionPageState();
}

class _WaterConsumptionPageState extends State<WaterConsumptionPage> {
  late int currentYear = DateTime.now().year;
  int startYear = 2024;
  late WaterConsumptionData _consumptionData;
  bool _isLoading = false;
  String _errorMessage = '';
  int _selectedTab = 0;

  List<Map<String, String>> _data = [];
  DateTime? _selectedDate;

  final _dateController = TextEditingController();
  final _sourceController = TextEditingController();
  final _consumptionController = TextEditingController();
  final _dischargeController = TextEditingController();
  final _dischargedToController = TextEditingController();
  final _modeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
    _consumptionData = WaterConsumptionData(
      total: 5000,
      thisMonth: 1500,
      today: 50,
      weeklyData: [100, 150, 200, 180, 220, 250, 190],
      monthlyData: [1000, 1200, 1500, 1300, 1600, 1400],
    );
    _fetchWaterConsumptionData();
  }

  Future<void> _fetchWaterConsumptionData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.get(
        Uri.parse('http://54.146.215.18:3000/water-consumption'),
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
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Water Consumption Dashboard'),
      backgroundColor: Colors.teal,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _fetchWaterConsumptionData,
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Add settings functionality
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: _fetchWaterConsumptionData,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeaderCard(),
          const SizedBox(height: 16),
          _buildConsumptionOverview(),
          const SizedBox(height: 16),
          _buildChartSection(),
          const SizedBox(height: 16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Water Management Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Current Year: $currentYear',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsumptionOverview() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consumption Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConsumptionMetric('Today', _consumptionData.today, Colors.blue),
                _buildConsumptionMetric('This Month', _consumptionData.thisMonth, Colors.green),
                _buildConsumptionMetric('Total', _consumptionData.total, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsumptionMetric(String label, int value, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              '$value L',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildChartSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consumption Trends',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: _selectedTab == 0
                  ? _buildWeeklyChart()
                  : _buildMonthlyChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() < days.length) {
                  return Text(days[value.toInt()]);
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: _consumptionData.weeklyData.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value);
            }).toList(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyChart() {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                if (value.toInt() < months.length) {
                  return Text(months[value.toInt()]);
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        barGroups: _consumptionData.monthlyData.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value,
                color: Colors.teal,
                width: 16,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          'Project Water',
          Icons.water_drop,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProjectOptionsPage()),
          ),
        ),
        _buildActionButton(
          'Labour Colony',
          Icons.home_work,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LabourColonyPage()),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (index) {
        setState(() {
          _selectedTab = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Weekly',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Monthly',
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

