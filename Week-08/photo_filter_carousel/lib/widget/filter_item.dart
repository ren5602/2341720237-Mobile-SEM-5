import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.color, this.onFilterSelected});

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              'https://scontent-sin6-3.cdninstagram.com/v/t51.2885-19/327990393_154488303711102_6041078084330420123_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-sin6-3.cdninstagram.com&_nc_cat=106&_nc_oc=Q6cZ2QG7exM6R5Py7dladeQhZ9YhmOudJGCDBuP_FhpIlmmSAGJAtWJE6nXtiqk-KeNiEtL7o6SqLxPZ2Kv3jqIqTJKL&_nc_ohc=y-ma3N8r_I4Q7kNvwG32gcZ&_nc_gid=in1zeWJDA-ONik5o-JKnPA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfdglspCeNH5MY0mXg3SGzYf0DotJVkS-jXTNWSXMdIneQ&oe=6903DBB8&_nc_sid=7a9f4b',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.error, color: Colors.white),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
