import 'package:flutter/material.dart';

import 'transfer_money.dart'; // ваш файл с TransferMoneyPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E9F9),
        elevation: 0,
        title: const Text(
          'F N B C',
          style: TextStyle(
            color: Color(0xFF5B2A86),
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: const HomeBody(),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}

// ---------------- HOME BODY ----------------

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _BalanceCard(),
            SizedBox(height: 20),
            _SearchBar(),
            SizedBox(height: 24),
            _SectionHeader(title: 'Quick Access'),
            SizedBox(height: 12),
            _QuickAccessGrid(),
            SizedBox(height: 24),
            _SectionHeader(title: 'Transactions'),
            SizedBox(height: 12),
            _TransactionsList(),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5B2A86),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BASIC CURRENT ACCOUNT',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Text(
                '₹ 8,92,135.66',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white70,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'JOHN SMITH',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Row(
                children: [
                  Text(
                    '8327642732',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.copy, color: Colors.white70, size: 14),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Color(0xFF5B2A86)),
          hintText: 'Search here...',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'View All',
          style: TextStyle(
            color: Color(0xFF5B2A86),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _QuickAccessGrid extends StatelessWidget {
  const _QuickAccessGrid();

  @override
  Widget build(BuildContext context) {
    final items = [
      _QuickItemData(Icons.compare_arrows, 'Transfer', const Color(0xFF5B2A86)),
      _QuickItemData(Icons.phone_android, 'Airtime', const Color(0xFFF5A623)),
      _QuickItemData(Icons.grid_view, 'Scan To Pay', const Color(0xFF5B2A86)),
      _QuickItemData(Icons.bolt, 'Utilities', const Color(0xFFF5A623)),
      _QuickItemData(
        Icons.account_balance_wallet,
        'Quick Loan',
        const Color(0xFFF5A623),
      ),
      _QuickItemData(Icons.receipt_long, 'Statement', const Color(0xFF5B2A86)),
      _QuickItemData(Icons.description, 'Pay Bill', const Color(0xFFF5A623)),
      _QuickItemData(Icons.wine_bar, 'Events', const Color(0xFFF5A623)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, color: item.color, size: 26),
              const SizedBox(height: 8),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11, color: Colors.black87),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuickItemData {
  final IconData icon;
  final String label;
  final Color color;
  _QuickItemData(this.icon, this.label, this.color);
}

class _TransactionsList extends StatelessWidget {
  const _TransactionsList();

  @override
  Widget build(BuildContext context) {
    final transactions = [
      _TransactionData('Received from John', '3:00 PM', '+3,982.5', true),
      _TransactionData('Transfer to Devid', '1:15 PM', '-135.3', false),
    ];

    return Column(
      children: transactions.map((tx) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFF0F0F0)),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: tx.isCredit
                      ? const Color(0xFFE3F5E9)
                      : const Color(0xFFFBE7E7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  tx.isCredit ? Icons.south_west : Icons.north_east,
                  color: tx.isCredit ? Colors.green : Colors.redAccent,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tx.time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                tx.amount,
                style: TextStyle(
                  color: tx.isCredit ? Colors.green : Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TransactionData {
  final String title;
  final String time;
  final String amount;
  final bool isCredit;
  _TransactionData(this.title, this.time, this.amount, this.isCredit);
}

// ---------------- BOTTOM NAV ----------------

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItemData(Icons.home, 'Home', true),
      _NavItemData(Icons.receipt_long, 'Transactions', false),
      _NavItemData(Icons.credit_card, 'My Cards', false),
      _NavItemData(Icons.settings, 'Setting', false),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final color = item.active ? const Color(0xFF5B2A86) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, color: color, size: 22),
              const SizedBox(height: 4),
              Text(item.label, style: TextStyle(color: color, fontSize: 11)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  final bool active;
  _NavItemData(this.icon, this.label, this.active);
}

// ---------------- SIDE MENU (DRAWER) ----------------

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItemData(Icons.person, 'Person Management', const Color(0xFFF5A623)),
      _MenuItemData(Icons.sync, 'Transfer', const Color(0xFF5B2A86)),
      _MenuItemData(Icons.grid_view, 'Scan to Pay', const Color(0xFFF5A623)),
      _MenuItemData(Icons.bolt, 'Utilities', const Color(0xFFF5A623)),
      _MenuItemData(
        Icons.account_balance_wallet,
        'Quick Loan',
        const Color(0xFF5B2A86),
      ),
      _MenuItemData(Icons.receipt_long, 'Statement', const Color(0xFF5B2A86)),
      _MenuItemData(Icons.attach_money, 'Self Top-Up', const Color(0xFFF5A623)),
      _MenuItemData(Icons.location_on, 'Locator', const Color(0xFF5B2A86)),
      _MenuItemData(Icons.headset_mic, 'Contact Us', const Color(0xFF5B2A86)),
      _MenuItemData(Icons.share, 'Refer', const Color(0xFF5B2A86)),
    ];

    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.85,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'William Huffman',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.black45),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'A/C No.: 83927423837849',
                        style: TextStyle(
                          color: Color(0xFF5B2A86),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.copy, size: 16, color: Colors.grey.shade600),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '1 Account  •  Personal',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context); // закрыть меню
                        if (item.label == 'Transfer') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransferMoneyScreen(),
                            ),
                          );
                        }
                        // остальные пункты пока ничего не делают
                      },
                      child: Row(
                        children: [
                          Icon(item.icon, color: item.color, size: 22),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.black38,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;
  final Color color;
  _MenuItemData(this.icon, this.label, this.color);
}
