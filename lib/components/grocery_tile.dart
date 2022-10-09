import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatefulWidget {
  
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete,})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  State<GroceryTile> createState() => _GroceryTileState();
}

class _GroceryTileState extends State<GroceryTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                color: widget.item.color,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.title,
                    style: GoogleFonts.lato(
                      decoration: widget.textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  buildDate(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  buildImportance()
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: widget.textDecoration,
                  fontSize: 21.0,
                ),
              ),
              buildCheckBox(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (widget.item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration: widget.textDecoration),
      );
    } else if (widget.item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
          color: Colors.blue,
          fontWeight: FontWeight.w800,
          decoration: widget.textDecoration,
        ),
      );
    } else if (widget.item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: widget.textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist!');
    }
  }

  Widget buildDate() {
    final dateString = DateFormat('MMMM dd h:mm a').format(widget.item.date);
    return Text(
      dateString,
      style: TextStyle(
        decoration: widget.textDecoration,
      ),
    );
  }

  Widget buildCheckBox() {
    return Checkbox(
        value: widget.item.isComplete,
        onChanged: widget.onComplete,
        );
  }
}
