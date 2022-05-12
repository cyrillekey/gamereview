import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/favourites_provider.dart';
import 'package:gamereview/controllers/home_provider.dart';
import 'package:gamereview/models/game.dart';
import 'package:gamereview/screens/single_game.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';
import 'package:slide_drawer/slide_drawer.dart';

class Favouries extends StatefulWidget {
  const Favouries({Key? key}) : super(key: key);

  @override
  State<Favouries> createState() => _FavouriesState();
}

class _FavouriesState extends State<Favouries> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteProvider>(context, listen: false).getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavouriteProvider>(
          builder: (context, favouritesProvider, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        SlideDrawer.of(context)?.open();
                      },
                      icon: Icon(Icons.menu)),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.more_horiz),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.builder(
                  itemCount: favouritesProvider.favourites.length,
                  itemBuilder: (context, index) {
                    Game game = favouritesProvider.favourites[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleGame(
                                      game: game,
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
                                        Image(image: AssetImage(Images.gaming)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 130,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
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
                              InkWell(
                                onTap: () {
                                  favouritesProvider.deleteFavoutire(game.id);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
