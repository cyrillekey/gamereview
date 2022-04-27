import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/search_provider.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/screens/single_game.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    Provider.of<SearchProvider>(context, listen: false).dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchProvider>(builder: (context, searchProvider, child) {
        return Column(children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onSubmitted: (value) {
                searchProvider.search(value.trim());
              },
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                  border: InputBorder.none,

                  // OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide:
                  //         BorderSide(width: 0, color: Colors.grey.shade100)),
                  hintText: "Search ...",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      onPressed: () {
                        controller.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            child: searchProvider.searching == true
                ? ListView.builder(
                    itemBuilder: (context, index) => Shimmer.fromColors(
                        child: Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            color: Colors.grey,
                          ),
                        ),
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[100]!))
                : searchProvider.games.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          Game game = searchProvider.games[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleGame(
                                            game_id: game.id,
                                          )));
                            },
                            child: Card(
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          height: 130,
                                          width: 90,
                                          imageUrl: game.background_image,
                                          errorWidget: (context, string, d) =>
                                              Image(
                                                  image: AssetImage(
                                                      Images.gaming)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height: 130,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              game.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Wrap(
                                              children: game.genres.map((e) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: Text(e.name),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: RatingBarIndicator(
                                                itemCount: 5,
                                                itemSize: 20,
                                                rating: game.rating,
                                                itemBuilder: ((context, index) {
                                                  return Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  );
                                                })),
                                          )
                                        ],
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     favouritesProvider.deleteFavoutire(game.id);
                                    //   },
                                    //   child: Icon(
                                    //     Icons.favorite,
                                    //     color: Colors.red,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: searchProvider.games.length,
                      )
                    : Container(),
          )
        ]);
      }),
    );
  }
}
