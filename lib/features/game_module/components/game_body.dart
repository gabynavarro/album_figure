import 'package:album_figu/service/local_storage.dart';
import 'package:flutter/material.dart';

class GameBody extends StatelessWidget {
  GameBody({super.key});

  final List<int> _items = List<int>.generate(70, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    late bool img = false;
    late Border borderLate = Border.all(color: Colors.black, width: 2);
    //##//
    List<String>? misFigus = [];
    List<String>? figu = LocalStorage.prefs.getStringList('listLove');
    misFigus = figu;

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: misFigus!.isEmpty ? _items.length : (misFigus.length) + 1,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        if (index == 0) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: borderLate,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Album',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("${misFigus!.length} / 70"),
                ],
              ));
        }
        if (misFigus!.isEmpty) {
          img = false;
        } else {
          misFigus[index - 1].isNotEmpty ? img = true : img = false;
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: borderLate,
            //imagenes econtradas
            color: misFigus.isEmpty ? evenItemColor : oddItemColor,
          ),
          child: img
              ? _imageFound(index, misFigus)
              : const Icon(
                  Icons.live_help,
                  size: 45,
                ),
        );
      },
    );
  }

  Column _imageFound(int index, List<String> cards) {
    final List<String> cardsLove = [
      "logo.png",
      "c2.png",
      "c1.png",
      "c1.png",
      "c1.png",
      "c1.png",
      "c1.png",
      "c2.png",
      "c3.png",
      "c1.png",
    ];

    int indice = int.parse(cards[index - 1]);
    String oneCard = cardsLove[indice];
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(width: 45, image: AssetImage("assets/img/$oneCard")),
          const Text("amor")
        ]);
  }
}
