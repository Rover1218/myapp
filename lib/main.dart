import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primaryColor: Colors.blueAccent,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMV4Tl-Aaafrmi-L8EPzD1244MK43q9suRxQ&s'),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Anindya Kanti Das",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Student",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildCard(
                title: "About Me",
                content: const Text(
                  "Lazy Coder who loves to learn new things. Basic knowledge of Flutter and made some projects with HTML, CSS, Express.js, etc.",
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              buildCard(
                title: "Skills",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.android, color: Color.fromARGB(255, 0, 255, 247)),
                      title: Text("Flutter Development", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.cloud, color: Color.fromARGB(255, 0, 255, 242)),
                      title: Text("Firebase Integration, SQL, MongoDB", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.api, color: Color.fromARGB(255, 0, 242, 255)),
                      title: Text("Node.js Backend", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.code, color: Color.fromARGB(255, 0, 234, 255)),
                      title: Text("HTML, CSS, Express, C, Python", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                icon: Icons.lightbulb,
              ),
              const SizedBox(height: 20),
              buildCard(
                title: "Contact",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.email, color: Color.fromARGB(255, 0, 234, 255)),
                        SizedBox(width: 10),
                        Text("anindyakanti2020@gmail.com", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone, color: Color.fromARGB(255, 0, 234, 255)),
                        SizedBox(width: 10),
                        Text("xxx-xxx-xxx-x", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                icon: Icons.contact_mail,
              ),
              const SizedBox(height: 30),
              buildCard(
                title: "Projects",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.code, color: Color.fromARGB(255, 0, 255, 251)),
                      title: Text("Personal Portfolio", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.code, color: Color.fromARGB(255, 0, 255, 251)),
                      title: Text("Weather App", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.code, color: Color.fromARGB(255, 0, 255, 251)),
                      title: Text("3D Train Map App", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                icon: Icons.work,
              ),
              const SizedBox(height: 20),
              buildCard(
                title: "Achievements",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.star, color: Color.fromARGB(255, 0, 255, 242)),
                      title: Text("Top 20 in SBH", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.star, color: Color.fromARGB(255, 0, 255, 242)),
                      title: Text("Completed Intenrnship in Prodigy", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                icon: Icons.emoji_events,
              ),
              const SizedBox(height: 20),
              buildCard(
                title: "Testimonials",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person, color: Color.fromARGB(255, 0, 255, 242)),
                      title: Text("John Doe: \"Anindya is a skilled developer with a great attitude.\"", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Color.fromARGB(255, 0, 255, 242)),
                      title: Text("Jane Smith: \"A dedicated and passionate individual. Highly recommend.\"", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                icon: Icons.comment,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(
      {required String title,
      required Widget content,
      required IconData icon}) {
    return Card(
      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Color.fromARGB(255, 0, 255, 251), size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
