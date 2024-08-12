import '../../../core/app_exports.dart';

Future<void> SelectableListDialog(
  BuildContext context, {
  required String title,
  required List<String> items,
  required void Function(int index)? onSelect,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Bank',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(items[index]),
                    onTap: () => onSelect != null ? onSelect(index) : null,
                  ),
                  const Divider()
                ],
              );
            },
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll<Color>(Colors.black),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Close the dialog without selecting any item
            },
            child: const Text('Cancel',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      );
    },
  );
}
