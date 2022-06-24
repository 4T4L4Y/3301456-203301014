import 'package:flutter/material.dart';

class KVKK extends StatelessWidget {
  static String routeName = "kvkk";
  const KVKK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KVKK",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.81,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse luctus quis arcu facilisis aliquet. Maecenas turpis libero, vulputate sed ligula in, facilisis vehicula tellus. Curabitur sem ante, feugiat sed ullamcorper sed, dignissim vitae massa. Suspendisse ullamcorper eros eget metus mattis, sed blandit leo tincidunt. Etiam molestie mauris justo, a elementum libero luctus ac. Pellentesque non lorem vel orci interdum pharetra at non arcu. Curabitur ligula orci, aliquam et consequat sit amet, blandit sit amet turpis. Vivamus ut vestibulum tellus, in placerat mauris. Donec eget diam justo. Ut quis velit porttitor, fermentum felis vel, viverra turpis. Ut ultrices mi orci, fringilla rhoncus risus semper id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse luctus quis arcu facilisis aliquet. Maecenas turpis libero, vulputate sed ligula in, facilisis vehicula tellus. Curabitur sem ante, feugiat sed ullamcorper sed, dignissim vitae massa. Suspendisse ullamcorper eros eget metus mattis, sed blandit leo tincidunt. Etiam molestie mauris justo, a elementum libero luctus ac. Pellentesque non lorem vel orci interdum pharetra at non arcu. Curabitur ligula orci, aliquam et consequat sit amet, blandit sit amet turpis. Vivamus ut vestibulum tellus, in placerat mauris. Donec eget diam justo. Ut quis velit porttitor, fermentum felis vel, viverra turpis. Ut ultrices mi orci, fringilla rhoncus risus semper id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse luctus quis arcu facilisis aliquet. Maecenas turpis libero, vulputate sed ligula in, facilisis vehicula tellus. Curabitur sem ante, feugiat sed ullamcorper sed, dignissim vitae massa. Suspendisse ullamcorper eros eget metus mattis, sed blandit leo tincidunt. Etiam molestie mauris justo, a elementum libero luctus ac. Pellentesque non lorem vel orci interdum pharetra at non arcu. Curabitur ligula orci, aliquam et consequat sit amet, blandit sit amet turpis. Vivamus ut vestibulum tellus, in placerat mauris. Donec eget diam justo. Ut quis velit porttitor, fermentum felis vel, viverra turpis. Ut ultrices mi orci, fringilla rhoncus risus semper id."),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
