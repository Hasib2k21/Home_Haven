import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: const Color(0xFF1A7E64),
        actions: [
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildContent(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userInfo(),
          const SizedBox(height: 24),
          _sectionTitle('General'),
          _menuItem('Transaction', Icons.account_balance_wallet),
          _menuItem('Wishlist', Icons.favorite_border),
          _menuItem('Saved Address', Icons.save_alt),
          _menuItem('Payment Method', Icons.payment),
          _menuItem('Notification', Icons.notifications),
          _menuItem('Security', Icons.lock),
          const SizedBox(height: 24),
          _sectionTitle('Help'),
          _menuItem('Get in Touch With Us', Icons.help_outline),
          const SizedBox(height: 24),
          Center(child: Text('App version: 1.0', style: _footerTextStyle())),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 29,
            backgroundImage: AssetImage("assets/images/img_12.png"),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Claire Cooper', style: _titleTextStyle()),
              const SizedBox(height: 4),
              Text('claire.cooper@mail.com', style: _subTitleTextStyle()),
            ],
          ),
          const Spacer(),
          Icon(Icons.edit, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: _menuItemTextStyle())),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 34,
      child: Center(
        child: Container(
          width: 134,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 24,
          offset: Offset(0, 2),
        )
      ],
    );
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
      color: Color(0xFF404040),
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _subTitleTextStyle() {
    return TextStyle(
      color: Color(0xFF757575),
      fontSize: 14,
    );
  }

  TextStyle _menuItemTextStyle() {
    return TextStyle(
      color: Color(0xFF404040),
      fontSize: 16,
    );
  }

  TextStyle _footerTextStyle() {
    return TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 12,
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF404040),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
