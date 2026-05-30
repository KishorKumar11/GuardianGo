import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guardiago/features/documents/presentation/result_screen.dart';
import 'package:guardiago/features/documents/presentation/widgets/doc_theme.dart';
import 'package:guardiago/features/documents/providers/documents_providers.dart';
import 'package:guardiago/l10n/app_localizations.dart';

class DocumentsScreen extends ConsumerStatefulWidget {
  const DocumentsScreen({super.key});

  @override
  ConsumerState<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends ConsumerState<DocumentsScreen> {
  bool _isProcessing = false;
  String? _statusLabel;
  String? _error;

  Future<void> _scan() async {
    setState(() {
      _isProcessing = true;
      _error = null;
      _statusLabel = 'Opening camera…';
    });

    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
      );
      if (picked == null) {
        setState(() {
          _isProcessing = false;
          _statusLabel = null;
        });
        return;
      }

      setState(() => _statusLabel = 'Reading the text…');
      final imageFile = File(picked.path);
      final ocrService = ref.read(ocrServiceProvider);
      final explainRepo = ref.read(explainRepositoryProvider);

      final ocrResult = await ocrService.recognizeFromFile(imageFile);

      if (!ocrResult.isUsable || ocrResult.isEmpty) {
        setState(() {
          _isProcessing = false;
          _statusLabel = null;
          _error = AppLocalizations.of(context)!.scanRetry;
        });
        return;
      }

      setState(() => _statusLabel = 'Explaining…');
      final docResult = await explainRepo.explain(ocrResult, hashedNric: null);

      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ResultScreen(result: docResult),
        ),
      );
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'Something went wrong. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _statusLabel = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF2F6), DocPalette.surface],
          ),
        ),
        child: SafeArea(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOutCubic,
            builder: (context, t, child) => Opacity(
              opacity: t,
              child: Transform.translate(
                offset: Offset(0, (1 - t) * 16),
                child: child,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _brandHeader(l10n),
                  const SizedBox(height: 28),
                  if (_error != null) ...[
                    _errorBanner(_error!),
                    const SizedBox(height: 18),
                  ],
                  _scanHero(l10n),
                  const SizedBox(height: 22),
                  _privacyCard(l10n),
                  const SizedBox(height: 16),
                  _momFooter(l10n),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _brandHeader(AppLocalizations l10n) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: DocPalette.deep,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(Icons.shield_rounded, color: Colors.white, size: 26),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.appName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: DocPalette.ink,
                letterSpacing: -0.5,
              ),
            ),
            const Text(
              'Understand your documents',
              style: TextStyle(fontSize: 14, color: DocPalette.muted),
            ),
          ],
        ),
      ],
    );
  }

  Widget _scanHero(AppLocalizations l10n) {
    return Semantics(
      button: true,
      label: l10n.scanDocument,
      child: GestureDetector(
        onTap: _isProcessing ? null : _scan,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [DocPalette.deep, DocPalette.blue],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: DocPalette.deep.withValues(alpha: 0.35),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.30),
                    width: 2,
                  ),
                ),
                child: _isProcessing
                    ? const Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(
                        Icons.document_scanner_rounded,
                        size: 52,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(height: 22),
              Text(
                _isProcessing
                    ? (_statusLabel ?? 'Working…')
                    : l10n.scanDocument,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              if (!_isProcessing) ...[
                const SizedBox(height: 8),
                Text(
                  'Point your camera at the letter',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _errorBanner(String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DocPalette.amber.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DocPalette.amber),
      ),
      child: Row(
        children: [
          const Icon(Icons.wb_sunny_rounded, color: DocPalette.caution),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: DocPalette.ink,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _privacyCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DocPalette.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DocPalette.cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: DocPalette.teal.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(Icons.lock_rounded,
                color: DocPalette.teal, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.sensitiveWarning,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
                color: DocPalette.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _momFooter(AppLocalizations l10n) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: DocPalette.deep.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.call_rounded, size: 18, color: DocPalette.deep),
            const SizedBox(width: 8),
            Text(
              l10n.momHotline,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: DocPalette.deep,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
