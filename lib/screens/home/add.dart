import 'package:flutter/material.dart';
import 'package:technoprise/helpers/conf.dart' as conf;
import 'data.dart' as d_datum;

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  bool isTitleError = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: conf.Palette.white1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Material(
                elevation: 1,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Add Item',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                            ),
                            children: [
                          TextSpan(
                              text: 'indicates required fields',
                              style: TextStyle(
                                color: Colors.black,
                              ))
                        ])),
                    const SizedBox(
                      height: 15.0,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: 'Item Title',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal))
                        ])),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      key: const ValueKey('titleField'),
                      style: const TextStyle(
                          // fontSize: widget.fontSize,
                          // color: widget.textColor
                          ),
                      focusNode: titleFocusNode,
                      controller: titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: isTitleError
                                  ? Colors.redAccent
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        labelText: 'Enter a title for the item',
                        // labelStyle: TextStyle(),
                        hintText: 'title',
                        // hintStyle: TextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      key: const ValueKey('descriptionField'),
                      style: const TextStyle(
                          // fontSize: widget.fontSize,
                          // color: widget.textColor
                          ),
                      maxLines: 10,
                      focusNode: descriptionFocusNode,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        labelText: 'Enter a description for the item',
                        // labelStyle: TextStyle(),
                        hintText: 'description',
                        // hintStyle: TextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    width: 2, color: conf.Palette.blue1)),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 17.0, color: conf.Palette.blue1),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(),
                        GestureDetector(
                          child: Container(
                            key: const ValueKey('addItemButton'),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: conf.Palette.blue1,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Text(
                              'Add Item',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                          ),
                          onTap: () {
                            if (titleController.text.isEmpty) {
                              setState(() => isTitleError = true);
                            } else {
                              d_datum.Datum d = d_datum.Datum(
                                  title: titleController.text.trim(),
                                  description:
                                      descriptionController.text.trim());
                              Navigator.pop(context, d);
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        titleFocusNode.unfocus();
        descriptionFocusNode.unfocus();
      },
    );
  }
}
