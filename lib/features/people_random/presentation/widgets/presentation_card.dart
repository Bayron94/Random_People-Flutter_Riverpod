import 'package:flutter/material.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

class PresentationCard extends StatelessWidget {
  const PresentationCard({
    super.key,
    required this.person,
    required this.onTap,
  });

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.white24,
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 0.8,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Row(
            children: [
              PhysicalModel(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ClipOval(
                    child: Image.network(
                      person.imageUrl,
                      height: 80,
                      width: 80,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.fullName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      person.email,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      person.cell,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 35,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
