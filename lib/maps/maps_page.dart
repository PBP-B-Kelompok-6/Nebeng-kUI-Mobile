import 'package:material_ui/material_ui.dart';
import 'package:nebengkui_mobile/widgets/left_drawer.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peta & Titik Kumpul'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        //TODO
        child: const Text('Maps goes here brrr.'),
      ),
    );
  }
}