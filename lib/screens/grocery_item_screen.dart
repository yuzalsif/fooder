import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fooderlich/components/components.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget {
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    this.originalItem,
  })  : isUpdating = originalItem != null,
        super(key: key);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  TextEditingController _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController = TextEditingController(text: originalItem.title);
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      _currentSliderValue = originalItem.quantity;
      final date = originalItem.date;
      _dueDate = date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryItemManager>(
      builder: (context, manager, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  final groceryItem = GroceryItem(
                    id: widget.originalItem?.id ?? const Uuid().v1(),
                    title: _name,
                    importance: _importance,
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _timeOfDay.hour,
                      _timeOfDay.minute,
                    ),
                    quantity: _currentSliderValue,
                    color: _currentColor,
                  );

                  if (widget.isUpdating) {
                    manager.updateItem(groceryItem);
                  } else {
                    manager.addItem(groceryItem);
                  }
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check),
              ),
            ],
            title: Center(
              child: Text(
                'Grocery Item',
                style: GoogleFonts.lato(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: ListView(
              children: [
                buildNameField(),
                const SizedBox(
                  height: 10,
                ),
                buildImportanceField(),
                const SizedBox(
                  height: 10,
                ),
                buildDateField(context),
                const SizedBox(
                  height: 10,
                ),
                buildTimeField(context),
                const SizedBox(
                  height: 10,
                ),
                buildColorpicker(),
                const SizedBox(
                  height: 10,
                ),
                buildQuantityField(),
                const SizedBox(
                  height: 10,
                ),
                GroceryTile(
                    item: GroceryItem(
                        id: 'previewMode',
                        title: _name,
                        importance: _importance,
                        date: DateTime(
                          _dueDate.year,
                          _dueDate.month,
                          _dueDate.day,
                          _timeOfDay.hour,
                          _timeOfDay.minute,
                        ),
                        quantity: _currentSliderValue,
                        color: _currentColor))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apple, Banana, 1 Bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        )
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.0,
          children: [
            ...<Importance>[
              Importance.low,
              Importance.medium,
              Importance.high,
            ].map(
              (chip) => ChoiceChip(
                // selectedColor: Colors.black,
                backgroundColor: Colors.black.withOpacity(0.3),
                label: Text(
                  chip.name,
                  // style: const TextStyle(color: Colors.white),
                ),
                selected: _importance == chip,
                onSelected: (selected) {
                  setState(() => _importance = chip);
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();

                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}'),
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if (selectedTime != null) {
                    _timeOfDay = selectedTime;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  Widget buildColorpicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              color: _currentColor,
              height: 50.0,
              width: 10.0,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) {
                        setState(() => _currentColor = color);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                });
          },
          child: const Text('Select'),
        )
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          value: _currentSliderValue.toDouble(),
          min: 0.0,
          max: 100.0,
          activeColor: _currentColor,
          inactiveColor: _currentColor.withOpacity(0.5),
          label: _currentSliderValue.toString(),
          onChanged: (value) {
            setState(() => _currentSliderValue = value.toInt());
          },
        ),
      ],
    );
  }
}
