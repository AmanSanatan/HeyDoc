import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MeetingWebView extends StatefulWidget {
  final String meetingUrl;
  const MeetingWebView({Key? key, required this.meetingUrl}) : super(key: key);

  @override
  State<MeetingWebView> createState() => _MeetingWebViewState();
}

class _MeetingWebViewState extends State<MeetingWebView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    if (widget.meetingUrl == '') {
      Navigator.of(context).pop();
    }
    return Scaffold(
      body: SafeArea(
          child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://${widget.meetingUrl}'),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                ),
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadError: (controller, url, code, message) {
                print('shittt');
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              })),
    );
  }
}
