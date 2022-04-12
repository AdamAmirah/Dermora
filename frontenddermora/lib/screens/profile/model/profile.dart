class Profile {
  final String label;
  final String text;

  Profile({
    required this.label,
    required this.text,
  });
}

List demoProfile = [
  Profile(
    label: "Name",
    text: "Furqan Said",
  ),
  Profile(
    label: "Contact",
    text: "+234 808 2344 4675",
  ),
  Profile(
    label: "Location",
    text: "Kuala Lumpur",
  ),
  Profile(
    label: "Skin Type",
    text: "Dry Skin",
  ),
];
