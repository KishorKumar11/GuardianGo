import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/features/documents/domain/document_result.dart';
import 'package:guardiago/features/documents/presentation/widgets/doc_theme.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result});

  final DocumentResult result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _isSpeaking = false);
    });
  }

  Future<void> _toggleSpeak() async {
    if (_isSpeaking) {
      await _tts.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }
    final r = widget.result;
    final spoken = [
      r.documentType,
      r.plainSummary,
      if (r.actions.isNotEmpty) 'What you need to do: ${r.actions.join('. ')}',
    ].where((s) => s.trim().isNotEmpty).join('. ');
    if (spoken.isEmpty) return;
    setState(() => _isSpeaking = true);
    await _tts.speak(spoken);
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    return Scaffold(
      backgroundColor: DocPalette.surface,
      appBar: AppBar(
        backgroundColor: DocPalette.deep,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          r.documentType.isEmpty ? 'Document' : r.documentType,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      // Prominent read-aloud control for low-literacy users.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleSpeak,
        backgroundColor: _isSpeaking ? DocPalette.amber : DocPalette.teal,
        foregroundColor: Colors.white,
        icon: Icon(_isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded),
        label: Text(_isSpeaking ? 'Stop' : 'Read aloud'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          if (r.isPending) _pendingBanner(),
          SectionCard(
            title: 'What this is',
            icon: Icons.description_rounded,
            accent: DocPalette.deep,
            body: r.documentType.isEmpty ? 'Unknown document' : r.documentType,
          ),
          if (r.plainSummary.trim().isNotEmpty)
            SectionCard(
              title: 'What it means',
              icon: Icons.info_rounded,
              accent: DocPalette.blue,
              body: r.plainSummary,
            ),
          if (r.actions.isNotEmpty)
            SectionCard(
              title: 'What you need to do',
              icon: Icons.task_alt_rounded,
              accent: DocPalette.action,
              items: r.actions,
            ),
          if (r.deadlines.isNotEmpty)
            SectionCard(
              title: 'Deadlines',
              icon: Icons.event_rounded,
              accent: DocPalette.deadline,
              items: r.deadlines,
            ),
          if (r.rightsFlags.isNotEmpty)
            SectionCard(
              title: 'Your rights',
              icon: Icons.balance_rounded,
              accent: DocPalette.rights,
              items: r.rightsFlags,
            ),
          if (r.uncertainty != null && r.uncertainty!.trim().isNotEmpty)
            _uncertaintyCard(r.uncertainty!),
        ],
      ),
    );
  }

  Widget _pendingBanner() {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DocPalette.amber.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DocPalette.amber),
      ),
      child: const Row(
        children: [
          Icon(Icons.cloud_off_rounded, color: DocPalette.caution),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Explanation pending — connect to the internet to complete it. '
              'Your scan is saved.',
              style: TextStyle(
                fontSize: 15,
                height: 1.35,
                color: DocPalette.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uncertaintyCard(String uncertainty) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DocPalette.caution.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: DocPalette.caution.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.help_rounded, color: DocPalette.caution),
              SizedBox(width: 10),
              Text(
                'Not fully certain',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: DocPalette.caution,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            uncertainty,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              color: DocPalette.ink,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: DocPalette.deep,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.call_rounded, color: Colors.white, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Call MOM: ${AppConstants.momHotline}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
