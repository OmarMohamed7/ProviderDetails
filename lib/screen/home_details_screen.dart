import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/model/home_model.dart';
import 'package:provider_details/view_model/home_view_model.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewMode>();
    model.getHomeData();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: UpComingWidget(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: NearYouWidget(),
        ),
        TextButton(
            onPressed: () {
              model.changeEvent();
            },
            child: const Text("Change first event of upcoming "))
      ],
    ));
  }
}

class NearYouWidget extends StatelessWidget {
  const NearYouWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nearYous =
        context.select<HomeViewMode, List>((provider) => provider.nearYou)
            as List<Upcoming>;

    return nearYous.isNotEmpty
        ? Center(
            child: SizedBox(
              // width: 250,
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: nearYous.map((e) {
                  final itemSelector =
                      context.select<HomeViewMode, Upcoming>((prov) => e);
                  return Column(
                    children: [
                      const Text(
                        "Near you",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(itemSelector.sId ?? " Item ID "),
                          Text(itemSelector.name?.en ?? " Item Name"),
                          Text(itemSelector.city?.name?.en ?? " city Name"),
                        ]),
                      ),
                    ],
                  );
                }).toList()),
              ),
            ),
          )
        : const SizedBox(
            child: Text("Empty near you "),
          );
  }
}

class UpComingWidget extends StatelessWidget {
  const UpComingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res =
        context.select<HomeViewMode, List>((provider) => provider.upcoming)
            as List<Upcoming>;

    return res.isNotEmpty
        ? Center(
            child: SizedBox(
              // width: 250,
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: res.map((e) {
                  return Column(
                    children: [
                      const Text(
                        "Upcoming",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(e.sId ?? " Item ID "),
                          Text(e.name?.en ?? " Item Name"),
                          Text(e.city?.name?.en ?? " city Name"),
                        ]),
                      ),
                    ],
                  );
                }).toList()),
              ),
            ),
          )
        : const SizedBox(
            child: Center(child: Text("Empty upcoming")),
          );
  }
}
