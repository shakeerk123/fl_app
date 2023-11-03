// ignore_for_file: must_be_immutable

import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchPage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String query = '';

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Center(
              child: TextFormField(
                key: formKey,
                onChanged: (value) {
                  query = value;
                },
                autofocus:
                    movieController.searchedMovies.isEmpty ? true : false,
                cursorColor:
                    Theme.of(context).primaryTextTheme.bodyLarge?.color,
                decoration: InputDecoration(
                  hintText: 'Enter Movie Name',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(IconlyLight.send),
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }
                      movieController.getMovieSearch(query);
                    },
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 20),
            child: Text1(text: 'Top Results'),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
              height: double.maxFinite,
              child: GetBuilder<MovieController>(builder: (controller) {
                return movieController.searchedMovies.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.52,
                        ),
                        itemCount: movieController.searchedMovies.length,
                        itemBuilder: (context, index) {
                          final movie = movieController.searchedMovies[index];
                          final hasPoster = movie.posterPath != null &&
                              movie.posterPath!.isNotEmpty;
                          return GestureDetector(
                            onTap: () {
                              movieController.getDetail(movieController
                                  .searchedMovies[index].id
                                  .toString());
                              movieController.getCastList(movieController
                                  .searchedMovies[index].id
                                  .toString());
                              movieController.getSimilar(movieController
                                  .searchedMovies[index].id
                                  .toString());
                              Get.toNamed('/deatils');
                            },
                            child: hasPoster
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: ApiConstants.baseImgUrl +
                                          movie.posterPath.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      // You can customize the placeholder color
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'No image Available',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                          );
                        },
                      )
                    : const Center(child: Text1(text: 'Search !'));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
