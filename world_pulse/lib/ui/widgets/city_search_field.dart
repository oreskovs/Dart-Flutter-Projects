import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/weather_provider.dart';

class CitySearchField extends ConsumerWidget implements PreferredSizeWidget {
  const CitySearchField({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              hintText: 'Enter the city',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: const Icon(
                Icons.location_on,
                color: Colors.blueAccent,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                  child: IconButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        ref.read(citySearchProvider.notifier).state =
                            controller.text;
                        FocusScope.of(context).unfocus();
                      }
                    },
                    icon: const Icon(Icons.search, color: Colors.blueAccent),
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                ref.read(citySearchProvider.notifier).state = value;
              }
            },
          ),
        ),
      ),
    );
  }
}
