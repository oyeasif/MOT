import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRatingBar extends StatefulWidget {
  final int starCount;
  final double rating;
  final double size;
  final Color color;
  final Function(double) onRatingChanged;

  CustomRatingBar({
    required this.starCount,
    required this.rating,
    this.size = 24.0,
    this.color = Colors.amber,
    required this.onRatingChanged,
  });

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            double newRating = (index + 1).toDouble();
            widget.onRatingChanged(newRating);
          },
          child: Icon(
            Icons.star,
            size: widget.size,
            color: (index < widget.rating) ? widget.color : Colors.grey,
          ),
        );
      }),
    );
  }
}
