import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
void _navigateToCDWasteDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CDWasteDetailsPage(),
      ),
    );
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 20),
              _buildDetailButton(
                context: context,
                title: 'Project',
                onPressed: () {
                  // Navigate to Project page (to be implemented)
                },
              ),
            ],
          ),
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
}

class LabourColonyWastePage extends StatefulWidget {
  const LabourColonyWastePage({Key? key}) : super(key: key);

  @override
  _LabourColonyWastePageState createState() => _LabourColonyWastePageState();
}

class _LabourColonyWastePageState extends State<LabourColonyWastePage> {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _fetchWasteData();
  }

  Future<void> _fetchWasteData() async {
    setState(() => _isLoading = true);
    try {
      // Replace with your API endpoint
      String url = 'http://0.0.0.0:3000/labour-colony-waste';
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
        title: const Text('Labour Colony Waste Data'),
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Quantity (kg)')),
                    DataColumn(label: Text('Mode of Storage')),
                    DataColumn(label: Text('Mode of Disposal')),
                  ],
                  rows: _data.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item['no'].toString())),
                      DataCell(Text(DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(item['date'])))),
                      DataCell(Text(item['quantity'].toString())),
                      DataCell(Text(item['storage_mode'])),
                      DataCell(Text(item['disposal_mode'])),
                    ]);
                  }).toList(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new waste data
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}


class CDWasteDetailsPage extends StatefulWidget {
  const CDWasteDetailsPage({Key? key}) : super(key: key);

  @override
  _CDWasteDetailsPageState createState() => _CDWasteDetailsPageState();
}

class _CDWasteDetailsPageState extends State<CDWasteDetailsPage> {
  final TextEditingController _projectAreaController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  double? _expectedWasteGeneration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C&D Waste Details'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Components of C&D Waste
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Components of C&D Waste:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildComponentItem('Concrete Waste'),
                    _buildComponentItem('Wood Waste'),
                    _buildComponentItem('Metal Scrap'),
                    _buildComponentItem('Ceramic and Tile Waste'),
                    _buildComponentItem('Packaging Materials'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Waste Generation Calculation
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                    const SizedBox(height: 12),
                    TextField(
                      controller: _projectAreaController,
                      decoration: InputDecoration(
                        labelText: 'Project Area (m²)',
                        border: OutlineInputBorder(),
                        suffixText: 'm²',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: _calculateExpectedWaste,
                    ),
                    const SizedBox(height: 12),
                    if (_expectedWasteGeneration != null)
                      Text(
                        'Expected Total Generation: ${_expectedWasteGeneration?.toStringAsFixed(2)} Tons',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[700],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Date Range for C&D Waste
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'C&D Waste Generated',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _startDateController,
                            decoration: InputDecoration(
                              labelText: 'Start Date',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context, true),
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _endDateController,
                            decoration: InputDecoration(
                              labelText: 'End Date',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context, false),
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _fetchWasteData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[700],
                      ),
                      child: Text('Fetch Waste Data'),
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

  Widget _buildComponentItem(String component) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: Colors.teal[700]),
          const SizedBox(width: 8),
          Text(
            component,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _calculateExpectedWaste(String value) {
    if (value.isNotEmpty) {
      double area = double.tryParse(value) ?? 0;
      setState(() {
        _expectedWasteGeneration = area * 0.05; // 50 kg/m²
      });
    } else {
      setState(() {
        _expectedWasteGeneration = null;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDateController.text = picked.toString().split(' ')[0];
        } else {
          _endDateController.text = picked.toString().split(' ')[0];
        }
      });
    }
  }

  Future<void> _fetchWasteData() async {
    // Implement API call to fetch waste data for the selected date range
    // This would be similar to the Labour Colony Waste data fetching
    if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both start and end dates')),
      );
      return;
    }

    try {
      // Replace with your actual API endpoint
      final response = await http.get(Uri.parse(
          'http://0.0.0.0:3000/cd-waste?start_date=${_startDateController.text}&end_date=${_endDateController.text}'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Handle the data, potentially show in a dialog or navigate to a new page
        _showWasteDataDialog(data);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch waste data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _showWasteDataDialog(dynamic data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('C&D Waste Data'),
        content: SingleChildScrollView(
          child: Text(json.encode(data)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _projectAreaController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}


class CDWasteTablePage extends StatefulWidget {
  const CDWasteTablePage({Key? key}) : super(key: key);

  @override
  _CDWasteTablePageState createState() => _CDWasteTablePageState();
}

class _CDWasteTablePageState extends State<CDWasteTablePage> {
  List<CDWasteEntry> wasteEntries = [];
  bool isLoading = false;
  double totalWaste = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _disposalController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    fetchWasteData();
  }

  Future<void> fetchWasteData() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(
        Uri.parse('http://your-api-endpoint/cd-waste'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        setState(() {
          wasteEntries = data.map((e) => CDWasteEntry.fromJson(e)).toList();
          calculateTotal();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void calculateTotal() {
    totalWaste = wasteEntries.fold(
      0, (sum, entry) => sum + entry.quantity);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Entry'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                  ),
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: 'Quantity (kg)'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Required field' : null,
                ),
                TextFormField(
                  controller: _storageController,
                  decoration: InputDecoration(labelText: 'Mode of Storage'),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Required field' : null,
                ),
                TextFormField(
                  controller: _disposalController,
                  decoration: InputDecoration(labelText: 'Mode of Disposal'),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Required field' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a date')),
        );
        return;
      }

      try {
        final response = await http.post(
          Uri.parse('http://your-api-endpoint/cd-waste'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'date': DateFormat('yyyy-MM-dd').format(_selectedDate!),
            'quantity': double.parse(_quantityController.text),
            'storage_mode': _storageController.text,
            'disposal_mode': _disposalController.text,
          }),
        );

        if (response.statusCode == 201) {
          Navigator.pop(context);
          fetchWasteData();
          _resetForm();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding entry: $e')),
        );
      }
    }
  }

  void _resetForm() {
    _selectedDate = null;
    _quantityController.clear();
    _storageController.clear();
    _disposalController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C&D Waste Data'),
        backgroundColor: Colors.teal[700],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  DataTable(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    headingRowColor: MaterialStateProperty.all(
                      Colors.teal.shade50,
                    ),
                    columns: [
                      DataColumn(label: Text('No.')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Quantity (kg)')),
                      DataColumn(label: Text('Mode of Storage')),
                      DataColumn(label: Text('Mode of Disposal')),
                    ],
                    rows: [
                      ...wasteEntries.map((entry) => DataRow(
                            cells: [
                              DataCell(Text(entry.id.toString())),
                              DataCell(Text(DateFormat('yyyy-MM-dd')
                                  .format(entry.date))),
                              DataCell(Text(entry.quantity.toString())),
                              DataCell(Text(entry.storageMode)),
                              DataCell(Text(entry.disposalMode)),
                            ],
                          )),
                      DataRow(
                        color: MaterialStateProperty.all(Colors.grey.shade200),
                        cells: [
                          DataCell(Text('Total',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text(totalWaste.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text('')),
                          DataCell(Text('')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal[700],
      ),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _storageController.dispose();
    _disposalController.dispose();
    super.dispose();
  }
}

class CDWasteEntry {
  final int id;
  final DateTime date;
  final double quantity;
  final String storageMode;
  final String disposalMode;

  CDWasteEntry({
    required this.id,
    required this.date,
    required this.quantity,
    required this.storageMode,
    required this.disposalMode,
  });

  factory CDWasteEntry.fromJson(Map<String, dynamic> json) {
    return CDWasteEntry(
      id: json['id'],
      date: DateTime.parse(json['date']),
      quantity: json['quantity_kg'].toDouble(),
      storageMode: json['storage_mode'],
      disposalMode: json['disposal_mode'],
    );
  }
}