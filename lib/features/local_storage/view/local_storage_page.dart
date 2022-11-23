import 'package:fake_shop/features/local_storage/bloc/local_storage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalStoragePage extends StatefulWidget {
  const LocalStoragePage({super.key});
  static const routeName = '/localStorage';

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  final TextEditingController foodNameController = TextEditingController();

  @override
  void dispose() {
    foodNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(),
                ),
                Flexible(
                  flex: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Food Name',
                        hintStyle: Theme.of(context).textTheme.bodyText1,
                        labelText: 'Food Name',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        contentPadding: const EdgeInsets.all(18),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person_outlined),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      controller: foodNameController,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(),
                ),
                Flexible(
                  flex: 12,
                  child: SizedBox(
                    height: 46,
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        BlocProvider.of<LocalStorageBloc>(context)
                            .add(AddFoodOnTap(food: foodNameController.text));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).secondaryHeaderColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.add_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Add Food',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(),
                ),
                Flexible(
                  flex: 12,
                  child: SizedBox(
                    height: 46,
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        BlocProvider.of<LocalStorageBloc>(context)
                            .add(const ViewFoodOnTap());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).secondaryHeaderColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.lunch_dining_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'View Food',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            BlocConsumer<LocalStorageBloc, LocalStorageState>(
              builder: (context, state) {
                if (state is FoodNameLoaded) {
                  return Text(state.food);
                }
                return Container();
              },
              listener: (context, state) {
                if (state is FoodNameSaved) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Food added successfully!'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
