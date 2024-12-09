import 'package:flutter/material.dart';
import 'package:navigation_codelab/first_screen.dart';


class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> screens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => FirstScreen()),
              (route) => false,  
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter number of screens',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _generateScreens,
                child: Text('Generate Screens'),
              ),
              if (screens.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  'Navigate through ${screens.length} screens!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _generateScreens() {
    final int numberOfScreens = int.tryParse(_controller.text) ?? 0;

    if (numberOfScreens <= 0) return;

    setState(() {
      screens = List.generate(
        numberOfScreens,
        (index) => {
          'title': 'Screen ${index + 1}',
          'description': 'This is dynamically generated content for screen ${index + 1}.',
        },
      );
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneratedScreen(
          screens: screens,
          initialIndex: 0,
        ),
      ),
    );
  }
}

class GeneratedScreen extends StatefulWidget {
  final List<Map<String, String>> screens;
  final int initialIndex;

  const GeneratedScreen({
    required this.screens,
    required this.initialIndex,
  });

  @override
  _GeneratedScreenState createState() => _GeneratedScreenState();
}

class _GeneratedScreenState extends State<GeneratedScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = widget.screens[currentIndex];

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0 && currentIndex < widget.screens.length - 1) {
          setState(() => currentIndex++);
        } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
          setState(() => currentIndex--);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentScreen['title']!),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => FirstScreen()),
              (route) => false,  
            );
          },
        ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'screen_${currentIndex}',
                child: Container(
                  color: Colors.primaries[currentIndex % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      currentScreen['description']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentIndex > 0)
                    ElevatedButton(
                      onPressed: () => setState(() => currentIndex--),
                      child: Text('Previous'),
                    ),
                  if (currentIndex < widget.screens.length - 1)
                    ElevatedButton(
                      onPressed: () => setState(() => currentIndex++),
                      child: Text('Next'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
