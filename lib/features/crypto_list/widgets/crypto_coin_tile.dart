import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        height: 30,
        width: 30,
      ),
      title: Text(
        coinName,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        '20000\$',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}