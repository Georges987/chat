import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  const LoginInput(
      {super.key,
      required this.label,
      required this.init,
      required this.type,
      required this.onTextChanged});

  final String label;
  final String init;
  final TextInputType type;
  final void Function(String) onTextChanged;
  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final TextEditingController _editingController = TextEditingController();

  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController.text = widget.init;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 0, left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: _editingController,
        onChanged: widget.onTextChanged,
        //initialValue: widget.init ?? '',
        obscureText:
            widget.type == TextInputType.visiblePassword && _obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: widget.type == TextInputType.visiblePassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Color(0xFF2F51A2)),
          ),
        ),
        validator: (value) {
          switch (widget.type) {
            case TextInputType.emailAddress:
              {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              }
            case TextInputType.visiblePassword:
              {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              }
            default:
              return null;
          }
        },
      ),
    );
  }
}
