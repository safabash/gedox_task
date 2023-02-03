import 'package:flutter/material.dart';
import 'package:gedox_task/controller/controller.dart';
import 'package:gedox_task/view/single_movie_page.dart';
import 'package:gedox_task/view/widgets/button_widget.dart';

import 'package:gedox_task/view/widgets/list_item.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        provider.getAll();
      },
    );
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Consumer<Controller>(
        builder: (context, value, child) {
          return value.isLoading == true
              ? const CircularProgressIndicator(strokeWidth: 2)
              : Scaffold(
                  backgroundColor: const Color(0xFF121212),
                  appBar: AppBar(
                    backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                    bottom: TabBar(
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.white,
                      tabs: <Widget>[
                        Tab(
                          text: provider.model!.genres[0].name,
                        ),
                        Tab(
                          text: provider.model!.genres[1].name,
                        ),
                        Tab(
                          text: provider.model!.genres[2].name,
                        ),
                      ],
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //let's start by building our carousel slider
                        children: [
                          const Text(
                            "Coming Soon",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    fit: BoxFit.fill,
                                    height: 400,
                                    width: 400,
                                    'https://image.tmdb.org/t/p/original/${provider.model!.posterPath}'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                Button_widget(
                                  text: 'All',
                                  color: Colors.red,
                                ),
                                Button_widget(
                                  width: 100,
                                  text: 'Action',
                                ),
                                Button_widget(
                                  width: 100,
                                  text: 'Comedy',
                                ),
                                Button_widget(
                                  width: 100,
                                  text: 'Romance',
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("Trending Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.0,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 360.0,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                listItem(
                                    'https://image.tmdb.org/t/p/original/${provider.model!.posterPath}',
                                    provider.model!.title),
                                listItem(
                                    'https://image.tmdb.org/t/p/original/${provider.model!.posterPath}',
                                    provider.model!.title),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SingleMovie()));
                                  },
                                  child: listItem(
                                      'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg',
                                      "Mulan"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Now let's create our bottom navigation menu
                );
        },
      ),
    );
  }
}
