import 'package:flutter/material.dart';
import 'package:mini_orientailing/model/Targets.dart';

class AdminCategoryPicker extends StatefulWidget {
  @override
  _AdminCategoryPickerState createState() => _AdminCategoryPickerState();
}

class _AdminCategoryPickerState extends State<AdminCategoryPicker> {
  // initialize lists
  List targetElectricsNameLists = [];
  List targetElectricsEmojiLists = [];

  @override
  Widget build(BuildContext context) {
    var _selectedEmoji;
    var _selectedName;

    //Get electric category items.
    for (int i = 0; i < Targets.electrics.length; i++) {
      targetElectricsEmojiLists.add(Targets.electrics[i]['emoji']);
      targetElectricsNameLists.add(Targets.electrics[i]['name']);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('アイテムの選択')),
      body: targetElectricsEmojiLists.length > 0
          ? ListView.builder(
              itemCount: targetElectricsEmojiLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Text(targetElectricsEmojiLists[index] ?? null),
                    title: Text(targetElectricsNameLists[index] ?? null),
                    onTap: () {
                      setState(() {
                        _selectedName = targetElectricsNameLists[index];
                        _selectedEmoji = targetElectricsEmojiLists[index];
                      });
                      Navigator.pop(context, {
                        'emoji': _selectedEmoji,
                        'emojiName': _selectedName
                      });
                    },
                  ),
                );
              },
            )
          : Center(child: const Text('No items')),
    );
  }
}
