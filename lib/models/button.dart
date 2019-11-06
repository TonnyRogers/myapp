class Button{
  String label;
  String hexColor;
  String navigateTo;

  Button({
    this.label,
    this.hexColor,
    this.navigateTo,
  });
}

final List<Button> buttons = [
  Button(
    label: 'Apresentação',
    hexColor: '0XFFDDDDDD',
    navigateTo: 'OnBoardingPage',
  ),
  Button(
    label: 'Sopping',
    hexColor: '0XFFDDDDDD',
    navigateTo: 'ShopPage',
  ),
  Button(
    label: 'Dashboard',
    hexColor: '0XFFDDDDDD',
    navigateTo: 'MenuDashboardPage',
  ),
  Button(
    label: 'Novos',
    hexColor: '0XFFDDDDDD',
    navigateTo: 'OnBoardingPage',
  ),
];