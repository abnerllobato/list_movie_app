import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';

import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesCacheRepositoryDecorator(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        TextField(onChanged: _controller.onChanged),
                      ],
                    ),
                  );
                }),
            ValueListenableBuilder<Movies?>(
              valueListenable: _controller.movies,
              builder: (_, movies, __) {
                return movies != null
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const Divider(),
                        shrinkWrap: true,
                        itemCount: movies.listMovies.length,
                        itemBuilder: (_, index) => CustomListCardWidget(
                            movie: movies.listMovies[index]),
                      )
                    : Lottie.asset('assets/lottie.json');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
