import 'package:material_ui/material_ui.dart';
import 'package:nebengkui_mobile/reservasi/screens/chat_detail_page.dart';
import 'package:nebengkui_mobile/widgets/left_drawer.dart';

class InboxReservasiPage extends StatelessWidget {
  const InboxReservasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data placeholder sementara sebelum integrasi JSON di Checkpoint 2
    final List<Map> dummyReservasi = [
      {
        'id': 1,
        'partner': 'Budi Santoso (Driver)',
        'rute': 'Stasiun UI → Fasilkom UI',
        'titik_jemput': 'Pintu Keluar Stasiun UI',
        'waktu_jemput': '20 Nov 2026, 07:30',
        'status': 'DITERIMA',
        'chat_unlocked': true,
      },
      {
        'id': 2,
        'partner': 'Siti Aminah (Penumpang)',
        'rute': 'Margonda → Stasiun Pondok Cina',
        'titik_jemput': 'Halte D\'Mall',
        'waktu_jemput': '20 Nov 2026, 17:00',
        'status': 'MENUNGGU',
        'chat_unlocked': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservasi & Obrolan'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyReservasi.length,
        itemBuilder: (context, index) {
          final item = dummyReservasi[index];
          final bool isUnlocked = item['chat_unlocked'] as bool;

          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['partner'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Chip(
                        label: Text(
                          item['status'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor:
                            isUnlocked ? Colors.green : Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Rute: ${item['rute']}'),
                  Text('Titik Jemput: ${item['titik_jemput']}'),
                  Text('Waktu: ${item['waktu_jemput']}'),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: isUnlocked
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatDetailPage(
                                    reservasiId: item['id'],
                                    partnerName: item['partner'],
                                  ),
                                ),
                              );
                            }
                          : null,
                      icon: Icon(isUnlocked ? Icons.chat : Icons.lock),
                      label: Text(
                        isUnlocked ? 'Buka Obrolan' : 'Chat Terkunci',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}