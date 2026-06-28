class Event {
  final String id;
  final String name;
  final String category;
  final String date;
  final String location;
  final double ticketPrice;
  final double rating;
  final String shortDescription;
  final String fullDescription;
  final String organizer;
  final String time;
  final int availableSeats;
  final String venue;
  final List<String> schedule;
  final String imageUrl;
  final List<String> gallery;

  const Event({
    required this.id,
    required this.name,
    required this.category,
    required this.date,
    required this.location,
    required this.ticketPrice,
    required this.rating,
    required this.shortDescription,
    required this.fullDescription,
    required this.organizer,
    required this.time,
    required this.availableSeats,
    required this.venue,
    required this.schedule,
    required this.imageUrl,
    required this.gallery,
  });
}

final List<Event> sampleEvents = [
 const Event(
    id: '1',
    name: 'Chennai Tech Summit 2025',
    category: 'Technology',
    date: 'Jul 15, 2025',
    time: '9:00 AM',
    location: 'Chennai, Tamil Nadu',
    ticketPrice: 599.0,
    rating: 4.8,
    shortDescription: 'Join top tech leaders from Chennai for 3 days of innovation, AI, and cloud computing.',
    fullDescription: 'The Chennai Tech Summit brings together over 2,000 technology professionals, entrepreneurs, and innovators for three days of keynotes, workshops, and networking. Explore the latest in AI, blockchain, and cloud computing.',
    organizer: 'Chennai Tech Foundation',
    availableSeats: 320,
    venue: 'IIT Madras Research Park, Chennai',
    schedule: ['09:00 - Opening Keynote', '11:00 - AI Workshop', '14:00 - Panel Discussion', '17:00 - Networking'],
    imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1515187029135-18ee286d815b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1591115765373-5207764f72e7?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1475721027785-f74eccf877e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
  const Event(
    id: '2',
    name: 'Madurai Music Festival',
    category: 'Music',
    date: 'Aug 3, 2025',
    time: '4:00 PM',
    location: 'Madurai, Tamil Nadu',
    ticketPrice: 0.0,
    rating: 4.6,
    shortDescription: 'A weekend of classical and folk music under the stars. 30+ artists, celebrating Tamil culture.',
    fullDescription: 'Experience the best of Carnatic and folk music with 30+ artists performing across multiple stages near the Meenakshi Temple. This free festival celebrates the rich musical heritage of Madurai with food, art, and culture.',
    organizer: 'Madurai Arts Foundation',
    availableSeats: 999,
    venue: 'Avaniyapuram Grounds, Madurai',
    schedule: ['16:00 - Gates Open', '17:00 - Local Artists', '19:00 - Headliner Set', '22:00 - Finale'],
    imageUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
  const Event(
    id: '3',
    name: 'Coimbatore Marathon 2025',
    category: 'Sports',
    date: 'Sep 21, 2025',
    time: '6:00 AM',
    location: 'Coimbatore, Tamil Nadu',
    ticketPrice: 399.0,
    rating: 4.9,
    shortDescription: 'Run through the textile city streets with 10,000 runners. All levels welcome.',
    fullDescription: 'The Coimbatore Marathon is one of South India\'s biggest marathons, taking runners through the heart of the textile city. All skill levels welcome with marathon, half-marathon, and 5K options.',
    organizer: 'Coimbatore Sports Council',
    availableSeats: 1500,
    venue: 'Racecourse Complex, Coimbatore',
    schedule: ['05:00 - Registration', '06:00 - Race Start', '11:00 - Finish Line Ceremony', '12:30 - Awards'],
    imageUrl: 'https://images.unsplash.com/photo-1452626038306-9aae5e071dd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1513593771513-7b58b6c4af38?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
  const Event(
    id: '4',
    name: 'Startup Pitch Night - Tiruchirappalli',
    category: 'Business',
    date: 'Jul 28, 2025',
    time: '6:00 PM',
    location: 'Tiruchirappalli, Tamil Nadu',
    ticketPrice: 299.0,
    rating: 4.5,
    shortDescription: 'Watch 15 startups compete for ₹50 lakhs in funding from Tamil Nadu VCs.',
    fullDescription: 'Fifteen of the most promising early-stage startups from Tamil Nadu pitch to a panel of top VCs and angel investors. Open to founders, investors, and aspiring entrepreneurs.',
    organizer: 'Trichy Startup Hub',
    availableSeats: 200,
    venue: 'Thapasya Convention Center, Trichy',
    schedule: ['18:00 - Networking', '19:00 - Pitches Begin', '21:00 - Judging', '22:00 - Winner Announced'],
    imageUrl: 'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1559136555-9303baea8ebd?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1551836022-d5d88e9218df?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
  const Event(
    id: '5',
    name: 'Flutter Dev Workshop - Bangalore',
    category: 'Education',
    date: 'Aug 10, 2025',
    time: '10:00 AM',
    location: 'Bangalore (Near TN Border)',
    ticketPrice: 0.0,
    rating: 4.7,
    shortDescription: 'Master Flutter from widgets to deployment in one hands-on session.',
    fullDescription: 'A hands-on 8-hour workshop covering Flutter fundamentals, state management, animations, and app deployment. Includes live coding and Q&A with senior Flutter engineers from Tamil Nadu startups.',
    organizer: 'TN Dev Academy',
    availableSeats: 500,
    venue: 'Tech Park, Whitefield, Bangalore',
    schedule: ['10:00 - Flutter Basics', '12:00 - State Management', '14:00 - Animations', '16:00 - Deployment'],
    imageUrl: 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1504639725590-34d0984388bd?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
  const Event(
    id: '6',
    name: 'Salem Food Festival 2025',
    category: 'Entertainment',
    date: 'Jul 19, 2025',
    time: '5:00 PM',
    location: 'Salem, Tamil Nadu',
    ticketPrice: 199.0,
    rating: 4.4,
    shortDescription: 'Experience authentic Tamil cuisine and street food from Salem. Live performances & cooking demos.',
    fullDescription: 'Salem Food Festival celebrates the culinary heritage of the city with 50+ food stalls, cooking demonstrations, live music, and cultural performances. All material is family-friendly.',
    organizer: 'Salem Food Committee',
    availableSeats: 350,
    venue: 'Mahaveera Park, Salem',
    schedule: ['17:00 - Doors Open', '17:30 - Food Stalls Live', '19:00 - Cooking Demo', '20:30 - Live Music'],
    imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561e1f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80',
    gallery: [
      'https://images.unsplash.com/photo-1567521464027-f127ff144326?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1495521821757-a1efb6729352?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ],
  ),
];

const List<String> categories = [
  'All', 'Music', 'Sports', 'Technology',
  'Business', 'Education', 'Entertainment',
  'Free Events', 'Paid Events',
];