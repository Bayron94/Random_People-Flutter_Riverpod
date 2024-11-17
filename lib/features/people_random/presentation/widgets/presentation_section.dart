import 'package:flutter/material.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class PresentationHeader extends StatelessWidget {
  const PresentationHeader({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    final res = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
            child: Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  stops: [0, 0.7],
                  colors: [
                    Colors.black38,
                    Color.fromRGBO(0, 0, 0, 0),
                  ],
                ),
              ),
              color: Colors.black54,
              height: res.height * 0.35,
              width: res.width,
              child: Image.network(
                person.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, e, s) => const SizedBox(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          child: SizedBox(
            width: res.width,
            child: Row(
              children: [
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      person.fullName,
                      style: textTheme.displayLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Gender: ${person.gender}',
                      style: const TextStyle(
                        color: Colors.white,
                        height: 2,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  spreadRadius: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
