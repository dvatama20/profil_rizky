import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ganti_tema.dart';

class TiktokProfilScreen extends StatelessWidget {
  const TiktokProfilScreen({super.key});

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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/itachi.jpg'),
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
            "@Hawi",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "HawiAnugrah",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatColumn(label: "Followers", value: "1k", isDarkMode: isDarkMode),
              const SizedBox(width: 20),
              _StatColumn(label: "Following", value: "100", isDarkMode: isDarkMode),
              const SizedBox(width: 20),
              _StatColumn(label: "Likes", value: "100k", isDarkMode: isDarkMode),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _gantiTema(context),
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
