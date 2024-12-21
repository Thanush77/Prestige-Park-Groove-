// import 'package:flutter/material.dart';
// class RainWaterPage extends StatefulWidget {
//   const RainWaterPage({Key? key}) : super(key: key);

//   @override
//   RainWaterPageState createState() => RainWaterPageState();
// }

// class RainWaterPageState extends State<RainWaterPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String _searchQuery = '';

//     super.initState();
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//   final List<Map<String, dynamic>> _harvestingData = [
//     {
//       'title': 'Collection Pit 1',
//       'capacity': '5000L',
//       'status': 'Active',
//       'lastInspected': '2023-12-01',
//       'details': 'Main collection point near Block A'
//     },
//     {
//       'title': 'Storage Tank 1',
//       'capacity': '10000L',
//       'status': 'Active',
//       'lastInspected': '2023-12-05',
//       'details': 'Underground storage tank'
//     },
//     {
//       'title': 'Filter System',
//       'capacity': 'N/A',
//       'status': 'Maintenance',
//       'lastInspected': '2023-11-28',
//       'details': 'Primary filtration system'
//     }
//   ];

//   final List<Map<String, String>> _monthlyData = [
//     {
//       'month': 'January 2024',
//       'rainfall': '45mm',
//       'collected': '35000L',
//       'efficiency': '78%'
//     },
//     {
//       'month': 'December 2023',
//       'rainfall': '62mm',
//       'collected': '48000L',
//       'efficiency': '82%'
//     },
//     {
//       'month': 'November 2023',
//       'rainfall': '85mm',
//       'collected': '65000L',
//       'efficiency': '85%'
//     }
//   ];

//   List<Map<String, dynamic>> get _filteredHarvestingData {
//     return _harvestingData
//         .where((data) =>
//             data['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
//             data['status'].toLowerCase().contains(_searchQuery.toLowerCase()))
//         .toList();
//   }
//   @override
//   @override
//   Widget build(BuildContext context) {
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Rain Water Harvesting'),
//           backgroundColor: Colors.blue[800],
//             tabs: [
//           bottom: TabBar(
//             controller: _tabController,
//           bottom: TabBar(
//               Tab(text: 'Monthly Data'),
//               Tab(text: 'Analytics'),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) => setState(() => _searchQuery = value),
//                 decoration: InputDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                   fillColor: Colors.grey[100],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   fillColor: Colors.grey[100],
//                 ),
//               ),
//             ),

//             // Tab Content
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   _buildOverviewTab(),
//                   _buildMonthlyDataTab(),
//                   _buildAnalyticsTab(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//           child: Icon(Icons.add),
//           floatingActionButton: FloatingActionButton(
//             onPressed: _showAddDialog,
//             backgroundColor: Colors.blue[800],
//             child: const Icon(Icons.add),
//           ),
//       ),
//     );
//   }

//   Widget _buildOverviewTab() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: _filteredHarvestingData.length,
//       itemBuilder: (context, index) {
//         final data = _filteredHarvestingData[index];
//         return Card(
//           elevation: 4,
//           margin: const EdgeInsets.only(bottom: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//               child: ListTile(
//                 title: Text(
//                   data['title'],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text('Status: ${data['status']}'),
//                 leading: Icon(
//                   Icons.water_drop,
//                   color: data['status'] == 'Active' ? Colors.blue : Colors.grey,
//                 ),
//               ),
//             title: Text(
//               data['title'],
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text('Status: ${data['status']}'),
//             leading: Icon(
//               Icons.water_drop,
//               color: data['status'] == 'Active' ? Colors.blue : Colors.grey,
//             ),
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildDetailRow('Capacity', data['capacity']),
//                     _buildDetailRow('Last Inspected', data['lastInspected']),
//                     _buildDetailRow('Details', data['details']),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildMonthlyDataTab() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: _monthlyData.length,
//       itemBuilder: (context, index) {
//         final data = _monthlyData[index];
//         return Card(
//           elevation: 4,
//           margin: const EdgeInsets.only(bottom: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data['month']!,
//                   style: const TextStyle(
//                     fontSize: 18,
//                 Divider(),
//                   ),
//                 ),
//     return const Center(
//                 _buildDetailRow('Rainfall', data['rainfall']!),
//                 _buildDetailRow('Water Collected', data['collected']!),
//                 _buildDetailRow('Collection Efficiency', data['efficiency']!),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     return Center(

//   Widget _buildAnalyticsTab() {
//     return const Center(
//       child: Text(
//         'Analytics Coming Soon',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 16,
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           ),
//         ],
//       ),
//     );
//   }

//   void _showAddDialog() {
//         title: Text('Add New Harvesting System'),
//         content: SingleChildScrollView(
//       builder: (context) => AlertDialog(
//         title: const Text('Add New Harvesting System'),
//         content: const SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(labelText: 'System Name'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Add'),
//             ),
//           ],
//           ),
//         ),
//             child: Text('Cancel'),
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//             child: Text('Add'),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

class RainWaterPage extends StatefulWidget {
  const RainWaterPage({Key? key}) : super(key: key);

  @override
  RainWaterPageState createState() => RainWaterPageState();
}

class RainWaterPageState extends State<RainWaterPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _harvestingData = [
    {
      'title': 'Collection Pit 1',
      'capacity': '5000L',
      'status': 'Active',
      'lastInspected': '2023-12-01',
      'details': 'Main collection point near Block A'
    },
    {
      'title': 'Storage Tank 1',
      'capacity': '10000L',
      'status': 'Active',
      'lastInspected': '2023-12-05',
      'details': 'Underground storage tank'
    },
    {
      'title': 'Filter System',
      'capacity': 'N/A',
      'status': 'Maintenance',
      'lastInspected': '2023-11-28',
      'details': 'Primary filtration system'
    }
  ];

  final List<Map<String, String>> _monthlyData = [
    {
      'month': 'January 2024',
      'rainfall': '45mm',
      'collected': '35000L',
      'efficiency': '78%'
    },
    {
      'month': 'December 2023',
      'rainfall': '62mm',
      'collected': '48000L',
      'efficiency': '82%'
    },
    {
      'month': 'November 2023',
      'rainfall': '85mm',
      'collected': '65000L',
      'efficiency': '85%'
    }
  ];

  List<Map<String, dynamic>> get _filteredHarvestingData {
    return _harvestingData
        .where((data) =>
            data['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
            data['status'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rain Water Harvesting'),
        backgroundColor: Colors.blue[800],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Monthly Data'),
            Tab(text: 'Analytics'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                _buildMonthlyDataTab(),
                _buildAnalyticsTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredHarvestingData.length,
      itemBuilder: (context, index) {
        final data = _filteredHarvestingData[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: Text(
              data['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Status: ${data['status']}'),
            leading: Icon(
              Icons.water_drop,
              color: data['status'] == 'Active' ? Colors.blue : Colors.grey,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Capacity', data['capacity']),
                    _buildDetailRow('Last Inspected', data['lastInspected']),
                    _buildDetailRow('Details', data['details']),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMonthlyDataTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _monthlyData.length,
      itemBuilder: (context, index) {
        final data = _monthlyData[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['month']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                _buildDetailRow('Rainfall', data['rainfall']!),
                _buildDetailRow('Water Collected', data['collected']!),
                _buildDetailRow('Collection Efficiency', data['efficiency']!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnalyticsTab() {
    return const Center(
      child: Text(
        'Analytics Coming Soon',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Harvesting System'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TextField(
                decoration: InputDecoration(labelText: 'System Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Capacity'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Status'),
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
            onPressed: () => Navigator.pop(context),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}