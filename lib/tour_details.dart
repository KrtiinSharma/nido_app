import 'package:flutter/material.dart';

class TourDetailsScreen extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String duration;
  final String description;
  final String price;
  final String imagePath;

  const TourDetailsScreen({
    Key? key,
    required this.title,
    required this.location,
    required this.date,
    required this.duration,
    required this.description,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 10,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(location,
                        style: const TextStyle(color: Color(0xFF868686))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(date,
                        style: const TextStyle(color: Color(0xFF868686))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(duration,
                        style: const TextStyle(color: Color(0xFF868686))),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '• Flight from New Delhi to Tokyo - Narita Apt | Departing on 20 Mar, 11:10 PM | Arriving on 21 Mar, 05:30 PM | Includes Check In Baggage',
                  style: const TextStyle(color: Color(0xFF868686), height: 1.5),
                ),
                const SizedBox(height: 4),
                const Text(
                  '• Airport to hotel in Tokyo',
                  style: TextStyle(color: Color(0xFF868686), height: 1.5),
                ),
                const SizedBox(height: 4),
                const Text(
                  '• When data is in the form of dates, such as schedules, timetables, prices calendar, lunar calendar. This component also supports Year/Month switch.',
                  style: TextStyle(color: Color(0xFF868686), height: 1.5),
                ),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFF868686)),
                const SizedBox(height: 8),
                Text(
                  'About us',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'lib/images/profile.jpeg',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dunzo Tourism Pvt Ltd.',
                              style: TextStyle(color: Color(0xFF868686)),
                            ),
                            Text(
                              'Tour & Travel',
                              style: TextStyle(
                                  color: Color(0xFF868686), fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'more',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const Divider(color: Color(0xFF868686)),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A3A3A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          price,
                          style: const TextStyle(
                            fontSize: 16, // Adjusted text size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      _showBookingBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEB5757),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context) {
    int memberCount = 2; // Initial member count
    List<String> memberNames = []; // Initialize as an empty list

    // Pre-fill the list with empty strings for the initial member count
    for (int i = 0; i < memberCount; i++) {
      memberNames.add('');
    }

    showModalBottomSheet(
      context: context,
      backgroundColor:
          const Color(0xFF292929), // Set bottom sheet background color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Make the content scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Member count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Number of members:',
                        style: TextStyle(color: Colors.white)),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            if (memberCount > 1) {
                              memberCount--;
                              memberNames
                                  .removeLast(); // Remove last member name
                              (context as Element)
                                  .markNeedsBuild(); // Refresh the UI
                            }
                          },
                        ),
                        Text('$memberCount',
                            style: const TextStyle(color: Colors.white)),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            memberCount++;
                            memberNames.add(''); // Add a new empty member name
                            (context as Element)
                                .markNeedsBuild(); // Refresh the UI
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Spacing
                // Member input fields
                for (int i = 0; i < memberCount; i++)
                  Column(
                    children: [
                      _buildMemberInputField('Name of member ${i + 1}',
                          (value) {
                        if (i < memberNames.length) {
                          memberNames[i] = value; // Update the member name
                        } else {
                          memberNames
                              .add(value); // Add new member name if needed
                        }
                      }),
                      const SizedBox(
                          height: 10), // Spacing between input fields
                    ],
                  ),
                const SizedBox(height: 20), // Spacing before buttons
                // Book Tickets button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle booking logic with memberNames
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEB5757),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Book $memberCount tickets',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Spacing before close button
                // Close button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF292929), // Set background color to white
                      side: const BorderSide(
                          color: Color(0xFFEB5757),
                          width: 1), // Set border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Color(
                              0xFFEB5757)), // Set text color to match the border
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMemberInputField(String hint, Function(String) onChanged) {
    return Row(
      children: [
        Image.asset('lib/images/IdentificationBadge.png', height: 24), // Icon
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: const Color(0xFF3A3A3A), // Background color for input
            ),
            style: const TextStyle(color: Colors.white), // Text color
          ),
        ),
      ],
    );
  }
}
