import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Currencies List',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white24,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => const CryptoListScreen(),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Crypto Currencies List',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            height: 25,
            width: 25,
          ),
          title: Text(
            'Bitcoin',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            '20000\$',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed('/coin');
          },
        ),
      ),
    );
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bicoin'),
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: Theme.of(context).iconTheme,
      ),
    );
  }
}