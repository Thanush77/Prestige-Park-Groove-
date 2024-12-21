import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:namer_app/auth_service.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:excel/excel.dart' as xl;
import 'package:http/http.dart' as http;
import 'package:namer_app/registration_page.dart';
import 'package:namer_app/airpollution.dart';
import 'package:namer_app/login_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prestige Park Groove',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 174, 184)),
      ),
      home: const LoginPage(),
    );
  }
}

class ApprovalsPage extends StatelessWidget {
  const ApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Approvals',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Header Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.approval_rounded,
                      size: 32,
                      color: Color.fromARGB(255, 1, 115, 115),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Project Approvals & Documentation',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 108, 98),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Access all project-related approvals and documentation',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Approval Buttons Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildApprovalCard(
                  context: context,
                  title: 'KSPCB',
                  icon: Icons.eco,
                  color: Colors.green,
                  onTap: () => _handleKSPCBApproval(context),
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'Environmental Clearances',
                  icon: Icons.nature_people,
                  color: Colors.blue,
                  assetPath: 'assets/ENvironmental.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'BBMP Plan Sanction',
                  icon: Icons.architecture,
                  color: Colors.orange,
                  assetPath: 'assets/Conversion Certificate.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'Land Document',
                  icon: Icons.landscape,
                  color: Colors.brown,
                  assetPath: 'assets/Conversion Certificate.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'SGWA',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  assetPath: 'assets/SGWA.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'Fire NOC',
                  icon: Icons.local_fire_department,
                  color: Colors.red,
                  assetPath: 'assets/FIRE_NOC.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'Airport Clearance',
                  icon: Icons.flight_takeoff,
                  color: Colors.indigo,
                  assetPath: 'assets/Airport.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'BESCOM Clearances',
                  icon: Icons.electric_bolt,
                  color: Colors.amber,
                  assetPath: 'assets/BESCOM.pdf',
                ),
                _buildApprovalCard(
                  context: context,
                  title: 'Land Conversion',
                  icon: Icons.transform,
                  color: Colors.purple,
                  assetPath: 'assets/Conversion Certificate.pdf',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // KSPCB Approval Specific Handler
  Future<void> _handleKSPCBApproval(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'KSPCB Approvals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildKSPCBButton(
                    context: context,
                    title: 'CFE',
                    onTap: () {
                      Navigator.pop(context);
                      _handlePDFOpen(context, 'CFE', 'assets/cfe1.pdf');
                    },
                  ),
                  _buildKSPCBButton(
                    context: context,
                    title: 'CFO',
                    onTap: () {
                      Navigator.pop(context);
                      _showCFOStatus(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // KSPCB Button Builder
  Widget _buildKSPCBButton({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 43, 171, 150),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // CFO Status Dialog
  void _showCFOStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('CFO Status'),
          content: const Text(
            'Yet to apply project under Implementation',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  // Approval Card Builder with Optional Custom Tap
  Widget _buildApprovalCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
    String? assetPath,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap ?? () => _handlePDFOpen(context, title, assetPath!),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.7),
                color.withOpacity(0.4),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 28,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // PDF Open Handler
  Future<void> _handlePDFOpen(
      BuildContext context, String title, String assetPath) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      final dir = await getApplicationDocumentsDirectory();
      final filename = assetPath.split('/').last;
      final file = File('${dir.path}/$filename');

      if (!file.existsSync()) {
        final byteData = await rootBundle.load(assetPath);
        final bytes = byteData.buffer.asUint8List();
        await file.writeAsBytes(bytes);
      }

      if (context.mounted) Navigator.pop(context);

      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Open $title',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOpenButton(
                        icon: Icons.open_in_browser,
                        label: 'View in App',
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnhancedPDFViewPage(
                                filePath: file.path,
                                title: title,
                              ),
                            ),
                          );
                        },
                      ),
                      _buildOpenButton(
                        icon: Icons.open_in_new,
                        label: 'External App',
                        onTap: () async {
                          Navigator.pop(context);
                          await OpenFile.open(file.path);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to load PDF: $e'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // Open Button Builder
  Widget _buildOpenButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 43, 171, 150),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// class PDFViewPage extends StatelessWidget {
//   final String filePath;
//   final String title;

//   const PDFViewPage({
//     super.key,
//     required this.filePath,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: PDFView(
//         filePath: filePath,
//         enableSwipe: true,
//         swipeHorizontal: false,
//         autoSpacing: true,
//         pageSnap: true,
//         onError: (error) {
//           if (context.mounted) {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Error'),
//                   content: Text('Failed to load PDF: $error'),
//                   actions: [
//                     TextButton(
//                       child: const Text('OK'),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
class EnhancedPDFViewPage extends StatefulWidget {
  final String filePath;
  final String title;

  const EnhancedPDFViewPage({
    super.key,
    required this.filePath,
    required this.title,
  });

  @override
  _EnhancedPDFViewPageState createState() => _EnhancedPDFViewPageState();
}

class _EnhancedPDFViewPageState extends State<EnhancedPDFViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isReady = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.filePath,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageSnap: true,
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages!;
                _isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                _errorMessage = error.toString();
              });
            },
            onPageChanged: (page, total) {
              setState(() {
                _currentPage = page!;
              });
            },
          ),
          if (!_isReady)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_errorMessage.isNotEmpty)
            Center(
              child: Text(_errorMessage),
            ),
        ],
      ),
      floatingActionButton: _isReady
          ? FloatingActionButton.extended(
              onPressed: () {
                // Implement additional features here
              },
              label: Text('Page $_currentPage/$_totalPages'),
              icon: const Icon(Icons.book),
            )
          : null,
    );
  }
}


class BlankPage extends StatelessWidget {
  const BlankPage({super.key, required String message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: const Center(
        child: Text('This is a blank page'),
      ),
    );
  }
}



class ExcelViewPage extends StatefulWidget {
  final String excelPath;

  const ExcelViewPage({super.key, required this.excelPath});

  @override
  _ExcelViewPageState createState() => _ExcelViewPageState();
}

class _ExcelViewPageState extends State<ExcelViewPage>
    with SingleTickerProviderStateMixin {
  List<List<dynamic>>? _data;
  String? _error;
  List<String> _sheets = [];
  String? _selectedSheet;
  bool _isLoading = true;
  String _searchQuery = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Sorting state
  int? _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _loadExcelData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadExcelData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final ByteData data = await rootBundle.load(widget.excelPath);
      var bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = xl.Excel.decodeBytes(bytes);

      _sheets = excel.tables.keys.toList();

      if (_sheets.isEmpty) {
        throw Exception('No sheets found in the Excel file');
      }

      _selectedSheet = _sheets.first;
      _loadSheetData(excel, _selectedSheet!);
      _animationController.forward();
    } catch (e) {
      setState(() {
        _error = 'Error loading Excel file: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  void _loadSheetData(xl.Excel excel, String sheetName) {
    try {
      var sheet = excel.tables[sheetName];
      if (sheet == null) throw Exception('Sheet not found');

      _data = sheet.rows.map((row) {
        return row.map((cell) => cell?.value ?? '').toList();
      }).toList();

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _error = 'Error loading sheet data: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  List<List<dynamic>> _getFilteredData() {
    if (_data == null || _data!.isEmpty) return [];

    var filteredData = _data!.where((row) {
      if (row.isEmpty) return false;
      return row.any((cell) =>
          cell.toString().toLowerCase().contains(_searchQuery.toLowerCase()));
    }).toList();

    if (_sortColumnIndex != null && filteredData.length > 1) {
      filteredData.sublist(1).sort((a, b) {
        var aValue = a[_sortColumnIndex!];
        var bValue = b[_sortColumnIndex!];
        return _sortAscending
            ? aValue.toString().compareTo(bValue.toString())
            : bValue.toString().compareTo(aValue.toString());
      });
    }

    return filteredData;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Theme.of(context).brightness,
        ),
      ),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFAB(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(_getFileName(),
          style: const TextStyle(fontWeight: FontWeight.bold)),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _showSearchDialog(),
        ),
        if (_sheets.length > 1)
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String sheet) {
              setState(() {
                _selectedSheet = sheet;
                _isLoading = true;
              });
              _loadExcelData();
            },
            itemBuilder: (context) => _sheets.map((sheet) {
              return PopupMenuItem<String>(
                value: sheet,
                child: Text(sheet),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Loading Excel data...',
                style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(_error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadExcelData,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    var filteredData = _getFilteredData();
    if (filteredData.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }

    return Column(
      children: [
        if (_searchQuery.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('Search: $_searchQuery'),
              onDeleted: () => setState(() => _searchQuery = ''),
            ),
          ),
        if (_selectedSheet != null)
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.teal.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.table_chart, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Sheet: $_selectedSheet',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  child: DataTable(
                    headingRowColor:
                        MaterialStateProperty.all(Colors.teal.shade50),
                    dataRowColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.selected)
                          ? Colors.teal.shade50
                          : Colors.white,
                    ),
                    columns: _buildColumns(filteredData),
                    rows: _buildRows(filteredData),
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildFAB() {
    if (_data == null || _data!.isEmpty) return null;

    return FloatingActionButton(
      onPressed: _exportData,
      tooltip: 'Export Data',
      child: const Icon(Icons.download),
    );
  }

  List<DataColumn> _buildColumns(List<List<dynamic>> data) {
    if (data.isEmpty) return [];
    return List.generate(data[0].length, (index) {
      return DataColumn(
        label: Text(
          data[0][index].toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      );
    });
  }

  List<DataRow> _buildRows(List<List<dynamic>> data) {
    if (data.length < 2) return [];
    return data.sublist(1).map((row) {
      return DataRow(
        cells: row.map((cell) {
          return DataCell(
            Text(cell.toString()),
            onTap: () => _showCellDetail(cell.toString()),
          );
        }).toList(),
      );
    }).toList();
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search Data'),
          content: TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: const InputDecoration(
              hintText: 'Enter search term...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }

  void _showCellDetail(String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cell Content'),
          content: SingleChildScrollView(
            child: SelectableText(content),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: content));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
              child: const Text('Copy'),
            ),
          ],
        );
      },
    );
  }

  void _exportData() {
    // Add export functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature coming soon!')),
    );
  }

  String _getFileName() {
    return widget.excelPath
        .split('/')
        .last
        .replaceAll('.xlsx', '')
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}



// class RainWaterPage extends StatefulWidget {
//   @override
//   _RainWaterPageState createState() => _RainWaterPageState();
// }

// class _RainWaterPageState extends State<RainWaterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Rain Water Harvesting'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Rain Water Harvesting',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Rainwater harvesting is the collection and storage of rain, rather than allowing it to run off.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Icon(Icons.water_drop, size: 100, color: Colors.blue),
//             // Add more content and features here
//           ],
//         ),
//       ),
//     );
//   }
// }
