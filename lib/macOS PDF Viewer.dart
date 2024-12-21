// import 'dart:io';
// import 'dart:ui' as ui show Image, instantiateImageCodec, MemoryImage;

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

// class MacOSPDFViewer extends StatefulWidget {
//   final String filePath;
//   final String title;

//   const MacOSPDFViewer({
//     super.key,
//     required this.filePath,
//     required this.title,
//   });

//   @override
//   _MacOSPDFViewerState createState() => _MacOSPDFViewerState();
// }

// class _MacOSPDFViewerState extends State<MacOSPDFViewer> {
//   ui.Image? _pdfImage;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadPdfImage();
//   }

//   Future<void> _loadPdfImage() async {
//     final bytes = await File(widget.filePath).readAsBytes();
//     final codec = await ui.instantiateImageCodec(bytes);
//     final frame = await codec.getNextFrame();
//     setState(() {
//       _pdfImage = frame.image;
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Center(
//               child: _pdfImage != null
//                   ? Image(
//                       image: ui.MemoryImage(_pdfImage!),
//                       fit: BoxFit.contain,
//                     )
//                   : const Text('Failed to load PDF'),
//             ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     title: 'macOS PDF Viewer',
//     home: FutureBuilder<String>(
//       future: _getTempPdfPath(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return MacOSPDFViewer(
//             filePath: snapshot.data!,
//             title: 'My PDF Document',
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     ),
//   ));
// }

// Future<String> _getTempPdfPath() async {
//   final tempDir = await getTemporaryDirectory();
//   final pdfFile = File('${tempDir.path}/example.pdf');
//   await pdfFile.writeAsBytes(await rootBundle.load('assets/example.pdf').then((data) => data.buffer.asUint8List()));
//   return pdfFile.path;
// }