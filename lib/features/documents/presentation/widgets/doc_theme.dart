import 'package:flutter/material.dart';

/// Visual language for the Documents module: a calm, trustworthy palette with
/// high contrast and meaning encoded by both colour AND icon (never colour
/// alone) so it stays legible for low-literacy and colour-blind users.
class DocPalette {
  DocPalette._();

  static const ink = Color(0xFF0B2A35); // near-black headings
  static const deep = Color(0xFF11506A); // deep teal
  static const blue = Color(0xFF1B6CA8); // brand blue
  static const teal = Color(0xFF1F9A8E); // accent
  static const amber = Color(0xFFE8A13C); // warm accent
  static const surface = Color(0xFFF5F8FA); // page background
  static const card = Colors.white;
  static const cardBorder = Color(0xFFE2EAF0);
  static const muted = Color(0xFF5C7484);

  // Semantic section colours.
  static const action = Color(0xFF2E8B57); // green — things to do
  static const deadline = Color(0xFFC0392B); // red — deadlines
  static const rights = Color(0xFF1B6CA8); // blue — your rights
  static const caution = Color(0xFFB07A12); // amber — uncertainty
}

/// A colour-coded, icon-led content card used to present one section of a
/// document explanation. Large text and a clear leading icon keep it readable.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.accent,
    this.body,
    this.items,
  }) : assert(
          body != null || items != null,
          'Provide either body text or a list of items',
        );

  final String title;
  final IconData icon;
  final Color accent;
  final String? body;
  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: DocPalette.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: DocPalette.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F11506A),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header strip with the accent colour and icon.
          Container(
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.10),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: accent,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: body != null
                ? Text(
                    body!,
                    style: const TextStyle(
                      fontSize: 17,
                      height: 1.45,
                      color: DocPalette.ink,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final item in items!)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  size: 22,
                                  color: accent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    height: 1.4,
                                    color: DocPalette.ink,
                                  ),
                                ),
                              ),
                            ],
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
