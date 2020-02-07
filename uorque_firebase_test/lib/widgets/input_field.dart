import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  const InputField({this.hint, this.obscure, this.onChanged, this.stream});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 70,
        width: 260,
        child: StreamBuilder<String>(
          stream: stream,
          builder: (context, snapshot) {
            return TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      errorText: snapshot.hasError? snapshot.error : null,
                      ),
              style: TextStyle(color: Colors.black),
            );
          }
        ),
      ),
    );
  }
}
