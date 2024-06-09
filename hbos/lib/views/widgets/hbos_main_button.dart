import 'package:flutter/material.dart'; 

class HbosMainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const HbosMainButton(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:const Color(0xFF3DD39B),
        //KancaConsts.mainColor,
        elevation: 0.0,
        side: const BorderSide(color: Colors.transparent, width: .5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
