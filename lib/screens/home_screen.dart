import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/hero_carousel.dart';
import 'event_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Event> get _filteredEvents {
    return sampleEvents.where((event) {
      bool matchesCategory;
      if (_selectedCategory == 'Free Events') {
        matchesCategory = event.ticketPrice == 0;
      } else if (_selectedCategory == 'Paid Events') {
        matchesCategory = event.ticketPrice > 0;
      } else {
        matchesCategory =
            _selectedCategory == 'All' || event.category == _selectedCategory;
      }
      final q = _searchQuery.toLowerCase();
      final matchesSearch = q.isEmpty ||
          event.name.toLowerCase().contains(q) ||
          event.category.toLowerCase().contains(q) ||
          event.location.toLowerCase().contains(q) ||
          event.organizer.toLowerCase().contains(q);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openDetail(Event event) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final filtered = _filteredEvents;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        backgroundColor: scheme.primary,
        elevation: 0,
        title: Row(children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.confirmation_num_rounded,
                color: Colors.white, size: 22),
          ),
          const SizedBox(width: 10),
          const Text('EventHub',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white)),
        ]),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar stuck below AppBar
            Container(
              color: scheme.primary,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _searchQuery = v),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search events, categories, locations…',
                  hintStyle:
                      TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.white),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          })
                      : null,
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Carousel
                    if (_searchQuery.isEmpty && _selectedCategory == 'All') ...[
                      const SizedBox(height: 20),
                      const HeroCarousel(),
                      const SizedBox(height: 24),
                    ],

                    // Category chips
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Browse by Category',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 42,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, i) {
                          final cat = categories[i];
                          return CategoryChip(
                            label: cat,
                            isSelected: _selectedCategory == cat,
                            onTap: () =>
                                setState(() => _selectedCategory = cat),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Featured Events
                    if (_searchQuery.isEmpty && _selectedCategory == 'All') ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Featured Events',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            TextButton(
                                onPressed: () {},
                                child: const Text('See All')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 250,
                        child: ListView.separated(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: sampleEvents.take(4).length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 14),
                          itemBuilder: (context, i) {
                            final event = sampleEvents[i];
                            return EventCard(
                              event: event,
                              isHorizontal: true,
                              onTap: () => _openDetail(event),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // All / Filtered Events
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        _searchQuery.isNotEmpty
                            ? 'Results (${filtered.length})'
                            : _selectedCategory == 'All'
                                ? 'All Events'
                                : '$_selectedCategory (${filtered.length})',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    filtered.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(40),
                            child: Center(
                              child: Column(children: [
                                Icon(Icons.search_off,
                                    size: 60,
                                    color: scheme.onSurface.withValues(alpha: 0.3)),
                                const SizedBox(height: 16),
                                Text('No events found',
                                    style: TextStyle(
                                        color: scheme.onSurface
                                            .withValues(alpha: 0.5))),
                              ]),
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filtered.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 14),
                            itemBuilder: (context, i) {
                              final event = filtered[i];
                              return EventCard(
                                event: event,
                                isHorizontal: false,
                                onTap: () => _openDetail(event),
                              );
                            },
                          ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}