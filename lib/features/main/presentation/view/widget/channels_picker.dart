import 'package:flutter/material.dart';

class CountryPicker {
  static final Map<String, String> countries = {
    'EG': 'Egypt',
    'US': 'United States',
    'GB': 'United Kingdom',
    'FR': 'France',
    'DE': 'Germany',
    'IN': 'India',
    'IT': 'Italy',
    'ES': 'Spain',
    'JP': 'Japan',
    'CN': 'China',
    'BR': 'Brazil',
    'RU': 'Russia',
    'CA': 'Canada',
    'KR': 'South Korea',
    'AU': 'Australia',
    'MX': 'Mexico',
    'TR': 'Turkey',
    'SA': 'Saudi Arabia',
    'AE': 'UAE',
    'NG': 'Nigeria',
  };

  static void show(BuildContext context, Function(String code) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * .5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: countries.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final code = countries.keys.elementAt(index);
                final name = countries[code]!;

                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(code);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _getFlagUrl(code),
                            width: 40,
                            height: 30,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.flag),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  static String _getFlagUrl(String countryCode) {
    final lowerCode = countryCode.toLowerCase();
    return 'https://flagcdn.com/w80/$lowerCode.png';
  }
}
