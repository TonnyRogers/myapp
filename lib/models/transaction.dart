import 'package:flutter/material.dart';

class Transaction {
  String title;
  String subtitle;
  String price;
  Icon icon;

  Transaction({
    this.price,
    this.subtitle,
    this.title,
    this.icon,
  });
}

final List<Transaction> transactions = [
  Transaction(
    title: 'Iphone 10',
    subtitle: 'Apple',
    price: '-2500',
    icon: Icon(Icons.monetization_on, color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'Extorno Compra',
    subtitle: 'Mercado Livre',
    price: '+999',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'MacBook Air',
    subtitle: 'Apple',
    price: '-1650',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'Gopro Hero 8',
    subtitle: 'Gopro',
    price: '-650',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'SSD 1Tera',
    subtitle: 'SanDisk',
    price: '-200',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'RAM 16Gb',
    subtitle: 'HyperX',
    price: '-65',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'I9 999K',
    subtitle: 'Intel',
    price: '-800',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
  Transaction(
    title: 'I9 1999K',
    subtitle: 'Intel',
    price: '-800',
    icon: Icon(Icons.monetization_on,color: Colors.white, size: 30,)
  ),
];