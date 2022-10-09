import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  Size get size => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 3,
              height: size.height / 3,
              child: const Image(
                image: AssetImage('assets/fooderlich_asset/empty_list.png'),
              ),
            ),
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Shopping for ingredients? Write them down!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            MaterialButton(
                onPressed: () {
                  Provider.of<AppStateManager>(context, listen: false)
                      .goToRecipe();
                },
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Browse Recipes'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))
          ],
        ),
      ),
    );
  }
}
