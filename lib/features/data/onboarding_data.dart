class OnboardingData {
  final String image;
  final String title;
  final String icon;
  final String description;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.icon,
    required this.description,
  });
}

const onboardingData = [
  OnboardingData(
    image: 'assets/images/pizza.png',
    title: 'Order For Food',
    icon: 'assets/svgs/transferdokumen_icon.svg',
    description: 'Take your order, and enjoy you food. For life in this time, not simply like another time on we are parent',
  ),
  OnboardingData(
    image: 'assets/images/tiramisu.png',
    title: 'Easy Payment',
    icon: 'assets/svgs/card_icon.svg',
    description: 'Use one card for every menu. Simple payment, simple use everything like squezee',
  ),
  OnboardingData(
    image: 'assets/images/coffe.png',
    title: 'Fast Delivery',
    icon: 'assets/svgs/deliveryboy_icon.svg',
    description: 'Like flash on the place. Under 10 minutes, food can you take on thhe your house',
  ),
];