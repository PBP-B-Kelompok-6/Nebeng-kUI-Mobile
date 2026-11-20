import 'package:material_ui/material_ui.dart';
import 'package:nebengkui_mobile/widgets/left_drawer.dart';
import 'package:nebengkui_mobile/reservasi/screens/inbox_reservasi_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nebeng-kUI'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_car, size: 72, color: Colors.indigo),
              const SizedBox(height: 16),
              const Text(
                'Selamat Datang di Nebeng-kUI Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Pilih modul melalui menu drawer di kiri atas atau tombol di bawah.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InboxReservasiPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.chat),
                label: const Text('Buka Reservasi & Obrolan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
