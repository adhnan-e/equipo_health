class CustomIcon {
  CustomIcon({
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;
}
List<CustomIcon> customIcons = [
  CustomIcon(name: "Appointment", icon: 'https://i.imgur.com/USYEDUh.png'),
  CustomIcon(name: "Hospital", icon: 'https://imgur.com/V6l23Ow.png'),
  CustomIcon(name: "Covid-19", icon: 'https://imgur.com/sv3d7UI.png'),
  CustomIcon(name: "More", icon: 'https://imgur.com/3ZI44rj.png'),
];
List<CustomIcon> healthNeeds = [
  CustomIcon(name: "Appointment", icon: 'https://i.imgur.com/USYEDUh.png'),
  CustomIcon(name: "Hospital", icon: 'https://imgur.com/V6l23Ow.png'),
  CustomIcon(name: "Covid-19", icon: 'https://imgur.com/sv3d7UI.png'),
  CustomIcon(name: "Pharmacy", icon: 'https://imgur.com/jx16sQq.png'),
];
List<CustomIcon> specialisedCared = [
  CustomIcon(name: "Diabetes", icon: 'https://imgur.com/9IqmOI2.png'),
  CustomIcon(name: "Health Care", icon: 'https://imgur.com/lVVDOIR.png'),
  CustomIcon(name: "Dental", icon: 'https://imgur.com/rhS1k6p.png'),
  CustomIcon(name: "Insured", icon: 'https://imgur.com/o3pLUJb.png'),
];