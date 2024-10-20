import 'package:flutter/material.dart';
import 'package:quiz_app/accueil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _score = 0;
  int _currentQuestionIndex = 0;

  // List of questions with options and correct answer
  final List<Map<String, dynamic>> _quizQuestions = [
    {
      'question': 'Quelle est la capitale de la France ?',
      'options': ['A. Berlin', 'B. Paris', 'C. Madrid'],
      'correctIndex': 1, // Paris is the correct answer (index 1)
    },
    {
      'question': 'Quelle planète est la plus grande du système solaire ?',
      'options': ['A. Earth', 'B. Jupiter', 'C. Mars'],
      'correctIndex': 1, // Jupiter is the correct answer (index 1)
    },
    {
      'question': 'Quelle langue est la plus parlée dans le monde ?',
      'options': ['A. English', 'B. Spanish', 'C. Chinese'],
      'correctIndex': 2, // Chinese is the correct answer (index 2)
    },
    {
      'question': 'Quel est le plus grand océan de la Terre ?',
      'options': ['A. Atlantic', 'B. Pacific', 'C. Indian'],
      'correctIndex': 1, // Pacific is the correct answer (index 1)
    },
    {
      'question': 'Quel pays est connu comme le Pays du Soleil Levant ?',
      'options': ['A. China', 'B. Japan', 'C. Thailand'],
      'correctIndex': 1, // Japan is the correct answer (index 1)
    },
  ];

  // Function to handle answer selection
  void _selectAnswer(int selectedIndex) {
    if (selectedIndex ==
        _quizQuestions[_currentQuestionIndex]['correctIndex']) {
      setState(() {
        _score++; // Increment score for the correct answer
      });
    }

    // Move to the next question or show final score
    if (_currentQuestionIndex < _quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      // Quiz is over, show the final score
      _showScoreDialog();
    }
  }

  // Show a dialog to display the final score
  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quiz termine'),
        content: Text('Ton score: $_score / ${_quizQuestions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _score = 0;
                _currentQuestionIndex = 0; // Reset the quiz
              });
            },
            child: const Text('Recommencer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Set background to sky blue
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        // Center the content
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: [
              // Display the current question in a card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _quizQuestions[_currentQuestionIndex]['question'],
                    textAlign: TextAlign.center, // Center the text
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Display the options as buttons, with space between them
              ..._quizQuestions[_currentQuestionIndex]['options']
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String option = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0), // Add space between buttons
                  child: ElevatedButton(
                    onPressed: () => _selectAnswer(index),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(option),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
