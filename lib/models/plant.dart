class Plant {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String size;
  final String description;

  Plant({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Plant> plants = [
  Plant(
    imageUrl: 'assets/images/plant0.png',
    name: 'Aloe Vera',
    category: 'Externo',
    price: 25,
    size: 'Pequeno',
    description:
        'Aloe vera is a succulent plant species of the genus Aloe. It\'s medicinal uses and air purifying ability make it an awesome plant.',
  ),
  Plant(
    imageUrl: 'assets/images/plant1.png',
    name: 'Cool Plant',
    category: 'Interno',
    price: 30,
    size: 'Médio',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur.',
  ),
  Plant(
    imageUrl: 'assets/images/plant2.png',
    name: 'Really Cool Plant',
    category: 'Laçamento',
    price: 42,
    size: 'Grande',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];