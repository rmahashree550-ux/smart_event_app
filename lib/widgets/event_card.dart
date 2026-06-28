import 'package:flutter/material.dart';
import '../models/event.dart';

class EventCard extends StatefulWidget {
  final Event event;
  final bool isHorizontal;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.isHorizontal,
    required this.onTap,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 120));
    _scale = Tween<double>(begin: 1.0, end: 0.96)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _networkImage({required double width, required double height, BoxFit fit = BoxFit.cover}) {
    final scheme = Theme.of(context).colorScheme;
    return Image.network(
      widget.event.imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : Container(
              width: width,
              height: height,
              color: scheme.primaryContainer,
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2))),
      errorBuilder: (_, __, ___) => Container(
          width: width,
          height: height,
          color: scheme.primaryContainer,
          child: const Icon(Icons.image, size: 36)),
    );
  }

  String _formatPrice(double price) {
    if (price == 0) return 'FREE';
    return '₹${price.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTapDown: (_) => _ctrl.forward(),
        onTapUp: (_) { _ctrl.reverse(); widget.onTap(); },
        onTapCancel: () => _ctrl.reverse(),
        child: widget.isHorizontal ? _horizontal() : _vertical(),
      ),
    );
  }

  Widget _horizontal() {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                _networkImage(width: double.infinity, height: 115),
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(widget.event.category,
                        style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.event.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Row(children: [
                  Icon(Icons.calendar_today, size: 11, color: scheme.primary),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(widget.event.date,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: scheme.onSurface.withValues(alpha: 0.6))),
                  ),
                ]),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    const Icon(Icons.star, size: 12, color: Colors.amber),
                    const SizedBox(width: 2),
                    Text(widget.event.rating.toString(),
                        style: const TextStyle(fontSize: 11)),
                  ]),
                  Text(_formatPrice(widget.event.ticketPrice),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: widget.event.ticketPrice == 0
                            ? Colors.green
                            : scheme.primary),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _vertical() {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full-width image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                _networkImage(width: double.infinity, height: 130),
                // Category badge
                Positioned(
                  top: 10, left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(widget.event.category,
                        style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
                // Price badge
                Positioned(
                  top: 10, right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                        color: widget.event.ticketPrice == 0
                            ? Colors.green
                            : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(_formatPrice(widget.event.ticketPrice),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.event.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    Row(children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(widget.event.rating.toString(),
                          style: const TextStyle(fontSize: 12)),
                    ]),
                  ],
                ),
                const SizedBox(height: 5),
                // Short Description
                Text(widget.event.shortDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        color: scheme.onSurface.withValues(alpha: 0.6),
                        height: 1.4)),
                const SizedBox(height: 8),
                Row(children: [
                  Icon(Icons.calendar_today, size: 12, color: scheme.primary),
                  const SizedBox(width: 4),
                  Text(widget.event.date,
                      style: TextStyle(
                          fontSize: 11,
                          color: scheme.onSurface.withValues(alpha: 0.6))),
                  const SizedBox(width: 12),
                  Icon(Icons.location_on, size: 12, color: scheme.primary),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(widget.event.location,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 11,
                            color: scheme.onSurface.withValues(alpha: 0.6))),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatPrice(widget.event.ticketPrice),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: widget.event.ticketPrice == 0
                              ? Colors.green
                              : scheme.primary),
                    ),
                    ElevatedButton(
                      onPressed: widget.onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: scheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('View Details'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}