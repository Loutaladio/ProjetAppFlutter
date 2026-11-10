import 'package:flutter/material.dart';

void main() => runApp(const BankFlowApp());

const navy = Color(0xFF16477C);
const deepBlue = Color(0xFF0E5D8B);
const cyan = Color(0xFF16B5D0);
const ink = Color(0xFF173B55);
const page = Color(0xFFF4F6F8);

class BankFlowApp extends StatelessWidget {
  const BankFlowApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BankFlow',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: page,
          colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy),
          fontFamily: 'Roboto',
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: const BorderSide(color: Color(0xFF9AA6AD))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: const BorderSide(color: Color(0xFF9AA6AD))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: const BorderSide(color: cyan, width: 1.5)),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const WelcomeScreen(),
          '/signup': (_) => const SignupScreen(),
          '/dashboard': (_) => const DashboardScreen(),
          '/account': (_) => const AccountScreen(),
          '/add-card': (_) => const AddCardScreen(),
          '/transaction/qr': (_) => const QrScreen(),
          '/transaction/send': (_) => const SendMoneyScreen(),
          '/transactions': (_) => const TransactionsScreen(),
          '/payment': (_) => const PaymentScreen(),
          '/exchange': (_) => const ExchangeScreen(),
          '/calculator': (_) => const CalculatorScreen(),
        },
      );
}

class BrandSignature extends StatelessWidget {
  final bool inverted;
  const BrandSignature({super.key, this.inverted = false});
  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(width: 34, height: 28, padding: const EdgeInsets.all(3), decoration: BoxDecoration(color: inverted ? Colors.white : Colors.white, borderRadius: BorderRadius.circular(5)), child: Image.asset('assets/dg_club.png', fit: BoxFit.contain)),
        const SizedBox(width: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('DG CLUB', style: TextStyle(color: inverted ? Colors.white : navy, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          Text('LOUTALADIO Danick Arcel · Entity Building SEO', style: TextStyle(color: inverted ? Colors.white70 : Colors.grey, fontSize: 8)),
        ]),
      ]);
}

class ScreenShell extends StatelessWidget {
  final String title;
  final Widget child;
  final bool back;
  final List<Widget>? actions;
  const ScreenShell({super.key, required this.title, required this.child, this.back = true, this.actions});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final desktop = constraints.maxWidth >= 900;
          if (desktop) {
            return Scaffold(
              backgroundColor: page,
              body: Row(
                children: [
                  const DesktopSidebar(),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 76,
                          padding: const EdgeInsets.symmetric(horizontal: 42),
                          decoration: const BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Color(0xFFE4EAF0))), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 3))]),
                          child: Row(children: [
                            Text(title, style: const TextStyle(color: ink, fontSize: 22, fontWeight: FontWeight.w700)),
                            const Spacer(),
                            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFF3F7FA), borderRadius: BorderRadius.circular(20)), child: const Row(children: [Icon(Icons.verified_user_outlined, color: cyan, size: 17), SizedBox(width: 7), Text('Espace sécurisé', style: TextStyle(color: ink, fontSize: 12))])),
                            const SizedBox(width: 20),
                            const CircleAvatar(radius: 19, backgroundColor: deepBlue, child: Icon(Icons.person, color: Colors.white, size: 23)),
                            const SizedBox(width: 10),
                            const Text('LOUTALADIO\nDanick Arcel', style: TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)),
                          ]),
                        ),
                        Expanded(child: Container(color: page, alignment: Alignment.topCenter, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1180), child: child))),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Column(children: [
                    Container(
                      height: 58,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(color: navy, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))]),
                      child: Row(children: [
                        IconButton(onPressed: () => Navigator.maybePop(context), icon: Icon(back ? Icons.arrow_back_ios_new : Icons.menu, color: Colors.white, size: 19)),
                        Expanded(child: Text(title.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 13, letterSpacing: 2.1, fontWeight: FontWeight.w500))),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white, size: 19)),
                      ]),
                    ),
                    Expanded(child: child),
                  ]),
                ),
              ),
            ),
          );
        },
      );
}

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: 254,
        color: navy,
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const BrandSignature(inverted: true),
          const SizedBox(height: 42),
          const Text('BANKFLOW', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 2)),
          const SizedBox(height: 12),
          _SidebarItem(icon: Icons.dashboard_outlined, label: 'Vue d’ensemble', route: '/dashboard'),
          _SidebarItem(icon: Icons.person_outline, label: 'Mon compte', route: '/account'),
          _SidebarItem(icon: Icons.swap_horiz, label: 'Transactions', route: '/transactions'),
          _SidebarItem(icon: Icons.credit_card_outlined, label: 'Ajouter une carte', route: '/add-card'),
          const SizedBox(height: 22),
          const Text('OUTILS', style: TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 2)),
          const SizedBox(height: 12),
          _SidebarItem(icon: Icons.receipt_long_outlined, label: 'Paiements', route: '/payment'),
          _SidebarItem(icon: Icons.currency_exchange, label: 'Change', route: '/exchange'),
          _SidebarItem(icon: Icons.calculate_outlined, label: 'Calculatrice', route: '/calculator'),
          const Spacer(),
          Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white.withOpacity(.09), borderRadius: BorderRadius.circular(14)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('DG CLUB', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.4)), SizedBox(height: 5), Text('Une identité claire.\nDes parcours mieux structurés.', style: TextStyle(color: Colors.white70, fontSize: 11, height: 1.4))])),
          const SizedBox(height: 18),
          const Text('© DG Club · LOUTALADIO Danick Arcel', style: TextStyle(color: Colors.white38, fontSize: 9)),
        ]),
      );
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  const _SidebarItem({required this.icon, required this.label, required this.route});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 5), child: InkWell(onTap: () => Navigator.pushNamed(context, route), borderRadius: BorderRadius.circular(10), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13), child: Row(children: [Icon(icon, color: Colors.white70, size: 20), const SizedBox(width: 12), Text(label, style: const TextStyle(color: Colors.white, fontSize: 13))]))));
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: page,
        body: LayoutBuilder(builder: (context, constraints) {
          final desktop = constraints.maxWidth >= 900;
          if (desktop) {
            return Row(children: [
              Expanded(flex: 11, child: Container(color: deepBlue, padding: const EdgeInsets.all(70), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                const BrandSignature(inverted: true),
                const SizedBox(height: 70),
                const Text('Votre argent,\nvotre rythme.', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700, height: 1.05)),
                const SizedBox(height: 22),
                const Text('Une expérience bancaire claire, pensée par\nDG Club pour rester simple au quotidien.', style: TextStyle(color: Colors.white70, fontSize: 17, height: 1.55)),
                const SizedBox(height: 52),
                Wrap(spacing: 12, runSpacing: 12, children: const [_FeaturePill(icon: Icons.shield_outlined, label: 'Sécurisé'), _FeaturePill(icon: Icons.bolt_outlined, label: 'Rapide'), _FeaturePill(icon: Icons.insights_outlined, label: 'Lisible')]),
                const SizedBox(height: 80),
                const Text('BANKFLOW · Une identité DG Club', style: TextStyle(color: Colors.white54, fontSize: 11, letterSpacing: 1.5)),
              ]))),
              Expanded(flex: 9, child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(56), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: _LoginCard())))),
            ]);
          }
          return SafeArea(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 430), child: Column(children: [
            Container(height: 300, width: double.infinity, color: deepBlue, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [BrandSignature(inverted: true), SizedBox(height: 20), Text('WELCOME!', style: TextStyle(color: Colors.white, fontSize: 21, letterSpacing: .7)), SizedBox(height: 25), Icon(Icons.account_balance, color: Colors.white, size: 112)])),
            Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(32, 26, 32, 20), child: _LoginCard())),
          ])));
        }),
      );
}

class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeaturePill({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9), decoration: BoxDecoration(color: Colors.white.withOpacity(.12), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white24)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: Colors.white, size: 17), const SizedBox(width: 7), Text(label, style: const TextStyle(color: Colors.white, fontSize: 12))]));
}

class _LoginCard extends StatelessWidget {
  const _LoginCard();
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(34), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 30, offset: Offset(0, 12))]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Bienvenue', style: TextStyle(color: ink, fontSize: 30, fontWeight: FontWeight.w700)),
        const SizedBox(height: 7),
        const Text('Connectez-vous à votre espace BankFlow.', style: TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 28),
        const Text('IDENTIFIANT', style: TextStyle(color: navy, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 7),
        const TextField(decoration: InputDecoration(hintText: 'Username or Email', prefixIcon: Icon(Icons.person_outline, size: 19))),
        const SizedBox(height: 17),
        const Text('MOT DE PASSE', style: TextStyle(color: navy, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 7),
        const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock_outline, size: 19))),
        const SizedBox(height: 22),
        SizedBox(width: double.infinity, height: 48, child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/dashboard'), style: ElevatedButton.styleFrom(backgroundColor: navy, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('SE CONNECTER', style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold))),
        const SizedBox(height: 12),
        Center(child: TextButton(onPressed: () {}, child: const Text('Mot de passe oublié ?', style: TextStyle(color: cyan, fontSize: 12)))),
        const Divider(height: 28),
        Center(child: Text.rich(TextSpan(text: 'Nouveau sur BankFlow ? ', style: const TextStyle(color: Colors.grey, fontSize: 12), children: [WidgetSpan(child: GestureDetector(onTap: () => Navigator.pushNamed(context, '/signup'), child: const Text('Créer un compte', style: TextStyle(color: cyan, fontSize: 12, fontWeight: FontWeight.bold))))])),
      ]));
}
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) => ScreenShell(title: 'Sign Up', back: true, child: ListView(padding: const EdgeInsets.fromLTRB(32, 20, 32, 30), children: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.account_balance, color: cyan, size: 48), Icon(Icons.link, color: navy, size: 37), Icon(Icons.phone_iphone, color: cyan, size: 48)]),
        const SizedBox(height: 7),
        const Center(child: Text('Connect to your bank account', style: TextStyle(color: ink, fontSize: 12))),
        const SizedBox(height: 25),
        const TextField(decoration: InputDecoration(hintText: 'Your Name')),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(hintText: 'Bank Account')),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(hintText: 'Email')),
        const SizedBox(height: 10),
        const TextField(obscureText: true, decoration: InputDecoration(hintText: 'Password')),
        const Padding(padding: EdgeInsets.only(top: 8), child: Text('Use 8 characters with a mix of letters, numbers & symbols.', style: TextStyle(fontSize: 10, color: Colors.grey))),
        const SizedBox(height: 12),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Checkbox(value: false, onChanged: (_) {}), const Expanded(child: Padding(padding: EdgeInsets.only(top: 12), child: Text('By signing up, you agree to Bank Terms of Use & Privacy Policy.', style: TextStyle(fontSize: 10, color: Colors.grey))))]),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [PrimaryButton(label: 'SIGN UP', onPressed: () => Navigator.pushNamed(context, '/dashboard'), width: 96), const SizedBox(width: 12), const Text('or', style: TextStyle(color: Colors.grey)), const SizedBox(width: 12), OutlineButton(label: 'CANCEL', onPressed: () => Navigator.pop(context), width: 96)]),
        const SizedBox(height: 20),
        Center(child: Text.rich(TextSpan(text: 'Already signed up? ', style: const TextStyle(color: Colors.grey, fontSize: 11), children: [TextSpan(text: 'Log in', style: const TextStyle(color: cyan, decoration: TextDecoration.underline))]))),
      ]));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => ScreenShell(title: 'Account', back: false, child: ListView(children: [
        Container(color: deepBlue, padding: const EdgeInsets.fromLTRB(24, 16, 24, 20), child: Column(children: [
          const BrandSignature(inverted: true),
          const SizedBox(height: 13),
          const CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Icon(Icons.person, color: cyan, size: 59)),
          const SizedBox(height: 8), const Text('YOUR NAME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1)), const Text('your-email@email.com', style: TextStyle(color: Colors.white70, fontSize: 10)),
          const SizedBox(height: 14), Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)), child: Column(children: [const Text('BALANCE', style: TextStyle(color: cyan, fontSize: 10, letterSpacing: 1)), const Text('\$4,180.20', style: TextStyle(color: ink, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1)), const SizedBox(height: 8), PrimaryButton(label: 'TRANSFER', onPressed: () => Navigator.pushNamed(context, '/transaction/send'), width: 85, height: 26)]) ),
        ])),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 17, 20, 8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Center(child: Text('LATEST TRANSACTIONS', style: TextStyle(color: cyan, fontSize: 10, letterSpacing: 1.2))),
            const SizedBox(height: 10),
            ...sampleTransactions.take(4).map((t) => TransactionRow(data: t)),
            Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => Navigator.pushNamed(context, '/transactions'), child: const Text('more >>', style: TextStyle(color: cyan, fontSize: 11)))),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
          child: Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.center, children: [
            _DashboardAction(label: 'ACCOUNT', icon: Icons.person_outline, route: '/account'),
            _DashboardAction(label: 'ADD CARD', icon: Icons.credit_card, route: '/add-card'),
            _DashboardAction(label: 'PAYMENT', icon: Icons.receipt_long, route: '/payment'),
            _DashboardAction(label: 'EXCHANGE', icon: Icons.currency_exchange, route: '/exchange'),
            _DashboardAction(label: 'CALCULATOR', icon: Icons.calculate_outlined, route: '/calculator'),
            _DashboardAction(label: 'SCAN QR', icon: Icons.qr_code_scanner, route: '/transaction/qr'),
          ]),
        ),
      ]));
}

class _DashboardAction extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;
  const _DashboardAction({required this.label, required this.icon, required this.route});
  @override
  Widget build(BuildContext context) => OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, route), icon: Icon(icon, size: 15, color: navy), label: Text(label, style: const TextStyle(fontSize: 8, color: navy)), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8), side: const BorderSide(color: Color(0xFFB8C5CD)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))));
}

class AccountScreen extends StatelessWidget { const AccountScreen({super.key}); @override Widget build(BuildContext context) => ScreenShell(title: 'Account', child: FormPage(button: 'SAVE CHANGES', fields: const ['YOUR NAME','BANK ACCOUNT','EMAIL','PASSWORD','PHONE NUMBER','YOUR ADDRESS'], onPressed: () {})); }
class AddCardScreen extends StatelessWidget { const AddCardScreen({super.key}); @override Widget build(BuildContext context) => ScreenShell(title: 'Add Card', child: ListView(padding: const EdgeInsets.fromLTRB(32, 17, 32, 25), children: [const CardMock(), const SizedBox(height: 18), ...['YOUR NAME','CARD NUMBER'].map((x) => Padding(padding: const EdgeInsets.only(bottom: 10), child: TextField(decoration: InputDecoration(labelText: x, hintText: x == 'YOUR NAME' ? 'NAME' : 'INSERT YOUR CARD NUMBER')))), const Row(children: [Expanded(child: TextField(decoration: InputDecoration(labelText: 'EXPIRED DATE', hintText: 'Day'))), SizedBox(width: 7), Expanded(child: TextField(decoration: InputDecoration(hintText: 'Month'))), SizedBox(width: 7), Expanded(child: TextField(decoration: InputDecoration(hintText: 'Year')))]), const SizedBox(height: 10), const TextField(obscureText: true, decoration: InputDecoration(labelText: 'PASSWORD')), const SizedBox(height: 10), const TextField(decoration: InputDecoration(labelText: 'PHONE NUMBER')), const SizedBox(height: 15), const Text('• Num facibus a pellentesque sit amet porttitor eget dolor morbi non.\n• Num facibus a pellentesque sit amet porttitor eget dolor morbi non.', style: TextStyle(fontSize: 10, color: Colors.grey)), const SizedBox(height: 20), PrimaryButton(label: 'LINK CARD', onPressed: () {}, width: 95)])); }

class FormPage extends StatelessWidget {
  final String button;
  final List<String> fields;
  final VoidCallback onPressed;
  const FormPage({super.key, required this.button, required this.fields, required this.onPressed});
  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(32, 18, 32, 25),
        children: [
          const CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Icon(Icons.person, color: cyan, size: 57)),
          const SizedBox(height: 12),
          ...fields.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  obscureText: f == 'PASSWORD',
                  maxLines: f == 'YOUR ADDRESS' ? 2 : 1,
                  decoration: InputDecoration(labelText: f, hintText: f == 'PASSWORD' ? '********' : ''),
                ),
              )),
          const SizedBox(height: 5),
          const Text('• Num facibus a pellentesque sit amet porttitor eget dolor morbi non.', style: TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 20),
          Center(child: PrimaryButton(label: button, onPressed: onPressed, width: 105)),
        ],
      );
}
class CardMock extends StatelessWidget { const CardMock({super.key}); @override Widget build(BuildContext context) => Center(child: Container(width: 115, height: 72, padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: cyan, borderRadius: BorderRadius.circular(5), boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(1, 2))]), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('BANK NAME', style: TextStyle(color: navy, fontSize: 7)), Spacer(), Text('•••• •••• ••••', style: TextStyle(color: Colors.white, fontSize: 9, letterSpacing: 1)), Text('CARD 1', style: TextStyle(color: navy, fontSize: 7))]))); }

class QrScreen extends StatelessWidget { const QrScreen({super.key}); @override Widget build(BuildContext context) => ScreenShell(title: 'Transaction', child: Column(children: [Container(color: deepBlue, padding: const EdgeInsets.fromLTRB(20, 27, 20, 22), child: Column(children: [const Text('SCAN THIS QR CODE', style: TextStyle(color: Colors.white, fontSize: 10)), const SizedBox(height: 12), Container(width: 130, height: 130, color: Colors.white, child: const Icon(Icons.qr_code_2, color: Colors.black, size: 115)), const SizedBox(height: 20), const Text('YOUR NAME', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1)), const Text('your-email@email.com', style: TextStyle(color: Colors.white70, fontSize: 10))])), const Spacer(), const Text('Try BARCODE', style: TextStyle(color: Colors.grey, fontSize: 11)), const Icon(Icons.barcode_reader, color: navy, size: 72), const SizedBox(height: 20), const Text('Can’t scan the QR Code?\nTry Bank Account', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 11)), const SizedBox(height: 22)])); }

class SendMoneyScreen extends StatelessWidget { const SendMoneyScreen({super.key}); @override Widget build(BuildContext context) => ScreenShell(title: 'Transaction', child: ListView(padding: const EdgeInsets.fromLTRB(32, 25, 32, 20), children: [const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.payments_outlined, color: navy, size: 80), Icon(Icons.swap_horiz, color: navy, size: 47)]), const SizedBox(height: 16), ...['From Bank Account','To Bank Account','Amount','Message'].map((f) => Padding(padding: const EdgeInsets.only(bottom: 10), child: TextField(decoration: InputDecoration(labelText: f, hintText: f == 'Amount' ? '2,195.00' : '')))), const SizedBox(height: 15), Row(mainAxisAlignment: MainAxisAlignment.center, children: [PrimaryButton(label: 'SEND', onPressed: () {}, width: 85), const SizedBox(width: 12), const Text('or'), const SizedBox(width: 12), OutlineButton(label: 'CANCEL', onPressed: () => Navigator.pop(context), width: 85)]), const SizedBox(height: 22), const Center(child: Text('‹  1  2  3  4  5  ›', style: TextStyle(color: cyan, letterSpacing: 5)))])); }

final sampleTransactions = [
  ('Lorem Ipsum Company', 'Received payment', '\$2,030.80', navy), ('Auctor Eli Ltd.', 'Transfer money', '-\$50.00', cyan), ('Lectus Sit Amet, est', 'Gas & electricity payment', '-\$239.50', Colors.teal), ('Corgue Quisque', 'Withdraw money', '-\$1,500.00', Colors.orange), ('Auctor Eli Ltd.', 'Transfer money', '-\$450.00', navy), ('Lectus Sit Amet, est', 'Gas & electricity payment', '-\$239.50', Colors.teal), ('Corgue Quisque', 'Withdraw money', '-\$1,500.00', Colors.red), ('Auctor Eli Ltd.', 'Transfer money', '-\$450.00', cyan),
];
class TransactionRow extends StatelessWidget { final (String,String,String,Color) data; const TransactionRow({super.key, required this.data}); @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Row(children: [CircleAvatar(radius: 10, backgroundColor: data.$4), const SizedBox(width: 9), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(data.$1, style: const TextStyle(fontSize: 10, color: ink)), Text(data.$2, style: const TextStyle(fontSize: 8, color: Colors.grey))])), Text(data.$3, style: const TextStyle(fontSize: 9, color: Colors.grey))])); }

class TransactionsScreen extends StatefulWidget { const TransactionsScreen({super.key}); @override State<TransactionsScreen> createState() => _TransactionsState(); }
class _TransactionsState extends State<TransactionsScreen> { bool complete = true; @override Widget build(BuildContext context) => ScreenShell(title: 'Transaction', child: Column(children: [Padding(padding: const EdgeInsets.fromLTRB(14, 20, 14, 12), child: Row(children: [Expanded(child: GestureDetector(onTap: () => setState(() => complete = true), child: _tab('COMPLETE', complete, cyan))), Expanded(child: GestureDetector(onTap: () => setState(() => complete = false), child: _tab('IN PROGRESS', !complete, Colors.grey)))])), Expanded(child: ListView(padding: const EdgeInsets.symmetric(horizontal: 20), children: [...sampleTransactions.map((t) => TransactionRow(data: t)), const SizedBox(height: 10), const Center(child: Text('‹  1  2  3  4  5  ›', style: TextStyle(color: cyan, letterSpacing: 5))) ]))])); }
Widget _tab(String text, bool active, Color color) => Container(padding: const EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: active ? color : Colors.grey.shade700, borderRadius: BorderRadius.circular(10)), child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10, letterSpacing: 1)));

class PaymentScreen extends StatelessWidget { const PaymentScreen({super.key}); @override Widget build(BuildContext context) { final items = [('Water', Icons.water_drop, cyan), ('Electricity', Icons.lightbulb, Colors.amber), ('Gas', Icons.local_fire_department, Colors.redAccent), ('Shopping', Icons.shopping_bag, Colors.pinkAccent), ('Phone', Icons.phone_android, navy), ('Credit Card', Icons.credit_card, Colors.teal), ('Insurance', Icons.shield, Colors.teal), ('Mortgage', Icons.home, Colors.deepPurple), ('Other Bills', Icons.receipt_long, Colors.blueGrey)]; return ScreenShell(title: 'Payment', child: Column(children: [Container(color: deepBlue, padding: const EdgeInsets.all(18), child: const Row(children: [CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(Icons.person, color: cyan, size: 41)), SizedBox(width: 13), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('BALANCE', style: TextStyle(color: cyan, fontSize: 9)), Text('\$4,180.20', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold))])])), Expanded(child: GridView.count(crossAxisCount: 3, padding: const EdgeInsets.fromLTRB(20, 20, 20, 5), mainAxisSpacing: 14, crossAxisSpacing: 12, childAspectRatio: 1.0, children: items.map((item) => Column(children: [CircleAvatar(radius: 25, backgroundColor: item.$3, child: Icon(item.$2, color: Colors.white, size: 25)), const SizedBox(height: 5), Text(item.$1, style: const TextStyle(fontSize: 9, color: Colors.grey))])).toList())), TextButton(onPressed: () {}, child: const Text('more >>', style: TextStyle(color: cyan, fontSize: 11))) ])); } }

class ExchangeScreen extends StatelessWidget { const ExchangeScreen({super.key}); @override Widget build(BuildContext context) => ScreenShell(title: 'Exchange', child: ListView(padding: const EdgeInsets.fromLTRB(25, 25, 25, 20), children: [const Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircleAvatar(radius: 25, backgroundColor: navy, child: Text('\$', style: TextStyle(color: Colors.white, fontSize: 28))), Icon(Icons.compare_arrows, color: navy, size: 55), CircleAvatar(radius: 25, backgroundColor: cyan, child: Text('£', style: TextStyle(color: Colors.white, fontSize: 28)))]), const SizedBox(height: 30), _amount('US', '1,000.00'), const Center(child: Text('CONVERT TO', style: TextStyle(color: Colors.grey, fontSize: 9))), _amount('£', '780.00'), const SizedBox(height: 18), const Text('Exchange rates are updated daily. Your final amount may vary slightly at settlement.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 10))])); }
Widget _amount(String currency, String value) => Padding(padding: const EdgeInsets.only(bottom: 12), child: Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)), child: Text(currency, style: const TextStyle(color: navy, fontWeight: FontWeight.bold))), const SizedBox(width: 8), Expanded(child: TextField(controller: TextEditingController(text: value), textAlign: TextAlign.right, style: const TextStyle(color: ink, fontWeight: FontWeight.bold, fontSize: 18), decoration: const InputDecoration()))]));

class CalculatorScreen extends StatefulWidget { const CalculatorScreen({super.key}); @override State<CalculatorScreen> createState() => _CalculatorState(); }
class _CalculatorState extends State<CalculatorScreen> {
  String display = '0';
  String stored = '';
  String op = '';
  void press(String value) {
    setState(() {
      if ('0123456789.'.contains(value)) {
        display = display == '0' ? value : display + value;
      } else if (value == 'C') {
        display = '0'; stored = ''; op = '';
      } else if (value == '=') {
        final a = double.tryParse(stored) ?? 0;
        final b = double.tryParse(display) ?? 0;
        final r = op == '+' ? a + b : op == '−' ? a - b : op == '×' ? a * b : op == '÷' && b != 0 ? a / b : b;
        display = r.toStringAsFixed(r.truncateToDouble() == r ? 0 : 2);
        stored = ''; op = '';
      } else {
        stored = display; display = '0'; op = value;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final keys = ['C', '÷', '×', '−', '7', '8', '9', '+', '4', '5', '6', '%', '1', '2', '3', '=', '00', '0', '.', '⌫'];
    return ScreenShell(
      title: 'Calculator',
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(18, 24, 18, 16),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: const Color(0xFF9AA6AD))),
              child: Text(display, style: const TextStyle(color: ink, fontSize: 34, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: keys.map((key) => CalculatorKey(label: key, onTap: () => press(key), accent: ['÷', '×', '−', '+', '%', '=', 'C'].contains(key))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CalculatorKey extends StatelessWidget { final String label; final VoidCallback onTap; final bool accent; const CalculatorKey({super.key, required this.label, required this.onTap, required this.accent}); @override Widget build(BuildContext context) => Material(color: accent ? navy : deepBlue, child: InkWell(onTap: onTap, child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500))))); }

class PrimaryButton extends StatelessWidget { final String label; final VoidCallback onPressed; final double width; final double height; const PrimaryButton({super.key, required this.label, required this.onPressed, this.width = 120, this.height = 32}); @override Widget build(BuildContext context) => SizedBox(width: width, height: height, child: ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(backgroundColor: navy, foregroundColor: Colors.white, padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))), child: Text(label, style: const TextStyle(fontSize: 9, letterSpacing: 1.2)))); }
class OutlineButton extends StatelessWidget { final String label; final VoidCallback onPressed; final double width; const OutlineButton({super.key, required this.label, required this.onPressed, this.width = 120}); @override Widget build(BuildContext context) => SizedBox(width: width, height: 32, child: OutlinedButton(onPressed: onPressed, style: OutlinedButton.styleFrom(padding: EdgeInsets.zero, side: const BorderSide(color: navy), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))), child: Text(label, style: const TextStyle(fontSize: 9, letterSpacing: 1.2, color: navy)))); }
