import 'package:url_launcher/url_launcher.dart';

Future<void> launchAppUri(String raw) async {
  var value = raw.trim();
  if (value.startsWith('+') || RegExp(r'^\d').hasMatch(value.replaceAll(' ', ''))) {
    value = 'tel:${value.replaceAll(' ', '')}';
  } else if (value.contains('@') && !value.contains('://')) {
    value = 'mailto:$value';
  } else if (!value.contains('://')) {
    value = 'https://$value';
  }
  final uri = Uri.parse(value);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
