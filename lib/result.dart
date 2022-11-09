import 'package:flutter/material.dart';
import 'package:q_tip/question_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.pickedOptions, {Key? key}) : super(key: key);
  final List<UserResponse> pickedOptions;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.pickedOptions.length,
          itemBuilder: (context, index) {
            final pickedOption = widget.pickedOptions[index];
            return Card(
              child: ListTile(
                title: Text(pickedOption.questionText),
                subtitle: Text(
                    'Correct Answer: ${pickedOption.correctOption} \n Your Answer: ${pickedOption.userPickedOption}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
