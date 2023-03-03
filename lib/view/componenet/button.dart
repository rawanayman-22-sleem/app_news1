import 'package:flutter/material.dart';

class FilterTopicCard extends StatefulWidget {

  var text , textColor , backgroundColor , borderColor;
  @override
  State<FilterTopicCard> createState() => _FilterTopicCardState();

  FilterTopicCard({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor, });
}

class _FilterTopicCardState extends State<FilterTopicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 42,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: widget.borderColor), ),
      child: Center(
        child: Text(
          '${widget.text}',
          style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}