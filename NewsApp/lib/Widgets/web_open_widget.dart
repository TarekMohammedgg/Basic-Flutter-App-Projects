import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebOpenView extends StatefulWidget {
  const WebOpenView({super.key, required this.openNew});
  final ArticleModel openNew;

  @override
  State<WebOpenView> createState() => _WebOpenViewState();
}

class _WebOpenViewState extends State<WebOpenView> {
  late final WebViewController controller;
  bool isLoading = true; // Set initially to true to show the loading indicator

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading =
                  true; // Show loading indicator when page starts loading
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading =
                  false; // Hide loading indicator when page finishes loading
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.openNew.url ?? " "),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.openNew.title),
        ),
        body: isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator()),
              )
            : WebViewWidget(
                controller: controller,
              ));
  }
}
