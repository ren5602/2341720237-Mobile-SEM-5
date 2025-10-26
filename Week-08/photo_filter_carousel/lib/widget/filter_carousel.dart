import 'package:flutter/material.dart';
import 'package:photo_filter_carousel/widget/filter_selector.dart'; // Langkah 2

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(child: _buildPhotoWithFilter()),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // Anda bisa ganti dengan foto Anda sendiri
        return Image.network(
          'https://scontent-sin6-3.cdninstagram.com/v/t51.2885-19/327990393_154488303711102_6041078084330420123_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-sin6-3.cdninstagram.com&_nc_cat=106&_nc_oc=Q6cZ2QG7exM6R5Py7dladeQhZ9YhmOudJGCDBuP_FhpIlmmSAGJAtWJE6nXtiqk-KeNiEtL7o6SqLxPZ2Kv3jqIqTJKL&_nc_ohc=y-ma3N8r_I4Q7kNvwG32gcZ&_nc_gid=in1zeWJDA-ONik5o-JKnPA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfdglspCeNH5MY0mXg3SGzYf0DotJVkS-jXTNWSXMdIneQ&oe=6903DBB8&_nc_sid=7a9f4b',
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey,
              child: const Center(
                child: Icon(Icons.error, color: Colors.white, size: 64),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(onFilterChanged: _onFilterChanged, filters: _filters);
  }
}
