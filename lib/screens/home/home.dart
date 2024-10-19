import 'package:flutter/material.dart';
import 'package:technoprise/helpers/conf.dart' as conf;
import 'add.dart';
import 'data.dart' as d_datum;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = <d_datum.Datum>[
    d_datum.Datum(
        title: 'Rainforest Ecosystems',
        description:
            'Discover the rich biodiversity found in rainforests, from towering trees to unique wildlife species.'),
    d_datum.Datum(
        title: 'Space Exploration',
        description:
            "Learn about humanity's journey to explore the cosmos, from the first moon landing to Mars missions"),
    d_datum.Datum(
        title: 'Ancient Civilizations',
        description:
            'Explore the mysteries and achievements of ancient civilizations like the Egyptians, Greeks, and Mayans.'),
    d_datum.Datum(
        title: 'Renewable Energy',
        description:
            'Understand the importance of renewable energy sources like solar, wind, and hydro power in combating climate change'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conf.Palette.white1,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Material(
            elevation: 1,
            child: Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  const Text(
                    'Test App',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: conf.Palette.blue1,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'New',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      d_datum.Datum? d = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              maintainState: true,
                              builder: (BuildContext context) => const Add()));
                      if (d != null) {
                        setState(() {
                          data.insert(0, d);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: data.isEmpty
                            ? const Center(
                                child: Text(
                                  'No Items to display',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemBuilder: (ctx, i) {
                                  d_datum.Datum d = data[i];
                                  return Container(
                                    padding: const EdgeInsets.all(20.0),
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, bottom: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              d.title,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              child: const Icon(
                                                Icons.delete_outlined,
                                                color: Colors.redAccent,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  data.removeAt(i);
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                d.description,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: data.length,
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
