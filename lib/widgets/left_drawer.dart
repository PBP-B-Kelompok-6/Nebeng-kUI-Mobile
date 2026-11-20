import 'package:material_ui/material_ui.dart';
import 'package:nebengkui_mobile/maps/maps_page.dart';
import 'package:nebengkui_mobile/screens/menu.dart';
import 'package:nebengkui_mobile/reservasi/screens/inbox_reservasi_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nebeng-kUI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Berbagi tumpangan sesama sivitas UI',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Reservasi & Obrolan'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const InboxReservasiPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Peta & Titik Kumpul'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapsPage(),
                ),
              );
            },
          ),
          // TODO: Anggota tim lain dapat menambahkan menu modulnya di bawah ini
        ],
      ),
    );
  }
}
