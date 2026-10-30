import 'package:flutter/material.dart';

/// Renders a CMS image: asset path today, https URL after admin upload.
class CmsImage extends StatelessWidget {
  const CmsImage({
    super.key,
    required this.source,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.fallback,
  });

  final String source;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;
  final Widget? fallback;

  bool get _isNetwork =>
      source.startsWith('http://') || source.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    Widget onError(
      BuildContext context,
      Object error,
      StackTrace? stackTrace,
    ) {
      return fallback ?? const SizedBox.shrink();
    }

    if (_isNetwork) {
      return Image.network(
        source,
        height: height,
        fit: fit,
        semanticLabel: semanticLabel,
        errorBuilder: onError,
      );
    }
    return Image.asset(
      source,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      errorBuilder: onError,
    );
  }
}
