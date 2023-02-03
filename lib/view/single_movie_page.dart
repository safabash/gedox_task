import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gedox_task/view/widgets/button_widget.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class SingleMovie extends StatelessWidget {
  const SingleMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        provider.getAll();
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              color: Colors.black,
              child: Expanded(
                child: Image.network(
                  'https://image.tmdb.org/t/p/original/${provider.model!.posterPath}',
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: const [
                Button_widget(text: '18+', fontSize: 15),
                Button_widget(text: 'Action', fontSize: 15),
                Button_widget(text: '5.0', fontSize: 15),
                Spacer(),
                Icon(Icons.crop_square_sharp, color: Colors.white),
                SizedBox(width: 20),
                Icon(Icons.share, color: Colors.white),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.right,
                    provider.model!.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    provider.model!.overview,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 150, 149, 149),
                        fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    textAlign: TextAlign.right,
                    "Actor",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          height: 110.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${provider.model!.productionCompanies[0].logoPath}'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
