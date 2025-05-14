import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../ganti_tema.dart';

class TiktokProfilScreen extends StatefulWidget {
  const TiktokProfilScreen({super.key});

  @override
  State<TiktokProfilScreen> createState() => _TiktokProfilScreenState();
}

class _TiktokProfilScreenState extends State<TiktokProfilScreen> {
  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.video_library,
    Icons.person,
  ];

  int _bottomNavIndex = 3; // default profil aktif

  void _gantiTema(BuildContext context) {
    Provider.of<TemaNotifier>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<TemaNotifier>(context).isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        title: Text(
          "Profil TikTok",
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: isDarkMode ? Colors.white : Colors.red,
        child: Icon(
          Icons.add,
          color: isDarkMode ? Colors.red : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? (isDarkMode ? Colors.white : Colors.black)
              : (isDarkMode ? Colors.white54 : Colors.black54);
          return Icon(iconList[index], size: 28, color: color);
        },
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profilrizky.jpg'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "@Dvatama",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Rizky Ardiva Dwitama P",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatColumn(label: "Followers", value: "5k", isDarkMode: isDarkMode),
              const SizedBox(width: 20),
              _StatColumn(label: "Following", value: "130", isDarkMode: isDarkMode),
              const SizedBox(width: 20),
              _StatColumn(label: "Likes", value: "160k", isDarkMode: isDarkMode),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _gantiTema(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? Colors.white : Colors.black,
              foregroundColor: isDarkMode ? Colors.black : Colors.white,
            ),
            child: const Text("Ganti Tema"),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black12),
          Expanded(
            child: Center(
              child: Text(
                "Belum ada video",
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final bool isDarkMode;

  const _StatColumn({
    required this.label,
    required this.value,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isDarkMode ? Colors.white60 : Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
