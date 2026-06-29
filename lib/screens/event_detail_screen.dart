import 'package:flutter/material.dart';
import '../models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  String _formatPrice(double price) {
    if (price == 0) return 'FREE';
    return '₹${price.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ─── Hero Banner ──────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: scheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'event-img-${event.id}',
                    child: Image.network(
                      event.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (_, child, progress) => progress == null
                          ? child
                          : Container(
                              color: scheme.primaryContainer,
                              child: const Center(
                                  child: CircularProgressIndicator())),
                      errorBuilder: (_, __, ___) => Container(
                        color: scheme.primaryContainer,
                        child: const Icon(Icons.image, size: 80),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: scheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            event.category,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          event.eventName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Quick Info Row ──────────────────────────────────
                  Row(
                    children: [
                      _InfoChip(
                          icon: Icons.star,
                          label: event.rating.toString(),
                          color: Colors.amber),
                      const SizedBox(width: 10),
                      _InfoChip(
                          icon: Icons.event_seat,
                          label: '${event.availableSeats} seats',
                          color: scheme.primary),
                      const SizedBox(width: 10),
                      _InfoChip(
                          icon: Icons.attach_money,
                          label: _formatPrice(event.ticketPrice),
                          color: event.ticketPrice == 0
                              ? Colors.green
                              : scheme.tertiary),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ─── Details Grid ────────────────────────────────
                  _DetailRow(
                      icon: Icons.calendar_today,
                      label: 'Date & Time',
                      value: '${event.date} at ${event.time}'),
                  _DetailRow(
                      icon: Icons.location_on,
                      label: 'Venue',
                      value: event.venueDetails),
                  _DetailRow(
                      icon: Icons.place,
                      label: 'Location',
                      value: event.location),
                  _DetailRow(
                      icon: Icons.person,
                      label: 'Organizer',
                      value: event.organizer),
                  if (event.organizerInformation.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(event.organizerInformation,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurface.withValues(alpha: 0.7))),
                  ],
                  const SizedBox(height: 20),

                  // ─── Full Description ────────────────────────────────
                  Text('About this Event',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(event.fullDescription,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.6)),
                  const SizedBox(height: 24),

                  // ─── Event Schedule ──────────────────────────────────
                  Text('Event Schedule',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...event.eventSchedule.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: scheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(item,
                                style:
                                    Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),

                  // ─── Photo Gallery ───────────────────────────────────
                  Text('Photo Gallery',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: event.photoGallery.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, i) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          event.photoGallery[i],
                          width: 160,
                          height: 120,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, progress) => progress == null
                              ? child
                              : Container(
                                  width: 160,
                                  color: scheme.primaryContainer,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2))),
                          errorBuilder: (_, __, ___) => Container(
                            width: 160,
                            color: scheme.primaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ─── Location Map Placeholder ────────────────────────
                  Text('Location Map',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 160,
                      color: scheme.primaryContainer,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map,
                                size: 40,
                                color:
                                    scheme.onPrimaryContainer.withValues(alpha: 0.5)),
                            const SizedBox(height: 8),
                            Text(event.location,
                                style: TextStyle(
                                    color: scheme.onPrimaryContainer)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // ─── Book Now Button ─────────────────────────────────────────────
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ticket Price',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(
                    _formatPrice(event.ticketPrice),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: event.ticketPrice == 0
                          ? Colors.green
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
                  Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booking ${event.eventName}…'),
                        backgroundColor:
                            Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Book Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _DetailRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              size: 20,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 11, color: Colors.grey)),
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}