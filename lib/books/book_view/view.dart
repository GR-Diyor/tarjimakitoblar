import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:tarjimakitoblar/utills/thememodal.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;
  PDFViewerPage({
    required this.file,
  });

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: pages >= 2
            ? [
          Center(child: Text(text)),
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 20),
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              controller.setPage(page);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, size: 20),
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              controller.setPage(page);
            },
          ),
        ]
            : null,
      ),
      body: Consumer(builder: (context, ThemeModal themeModal, child) {
      return PDFView(
        filePath: widget.file.path,
        autoSpacing: true,
         swipeHorizontal: true,
         pageSnap: true,
         pageFling: true,
        defaultPage: 0,
        enableSwipe: true,
        nightMode: themeModal.isdark?true:false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      );
    },
      ),
    );
  }
}