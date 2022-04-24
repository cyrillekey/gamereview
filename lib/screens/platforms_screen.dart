import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gamereview/controllers/platform_provider.dart';
import 'package:gamereview/screens/platform_details.dart';
import 'package:gamereview/utils/images.dart';
import 'package:paginable/paginable.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_drawer/slide_drawer.dart';

class Platforms extends StatefulWidget {
  const Platforms({Key? key}) : super(key: key);

  @override
  State<Platforms> createState() => _PlatformsState();
}

class _PlatformsState extends State<Platforms> {
  @override
  void initState() {
    super.initState();
    Provider.of<PlatformProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          SlideDrawer.of(context)?.open();
                        },
                        icon: Icon(Icons.menu)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<PlatformProvider>(
                  builder: (context, platformProvider, child) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: PaginableListView.builder(
                      loadMore: platformProvider.loadMore,
                      progressIndicatorWidget: Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorIndicatorWidget: (err, r) => Center(
                            child: Text("Something went wrong"),
                          ),
                      itemCount: platformProvider.platforms.length,
                      itemBuilder: (context, index) => !platformProvider
                              .isLoading
                          ? InkWell(
                              child: Card(
                                child: Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                            height: 60,
                                            width: 60,
                                            image: CachedNetworkImageProvider(
                                                platformProvider
                                                    .platforms[index]
                                                    .image_background),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Text(platformProvider
                                            .platforms[index].name),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlatformDetails(
                                                          platform:
                                                              platformProvider
                                                                      .platforms[
                                                                  index],
                                                        )));
                                          },
                                          icon: Icon(Icons.arrow_forward_ios))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Shimmer.fromColors(
                              child: Card(
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[100]!)),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
