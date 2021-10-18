class Activity {
  String imageUrl;
  String? name;
  String type;
  List<String> startTimes;
  int? rating;
  int price;

  Activity({
    required this.imageUrl,
    this.name,
    required this.type,
    required this.startTimes,
    this.rating,
    required this.price,
  });
}

List<Activity> activities = [
  Activity(
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St. Mark\'s Basilica',
      type: 'Sightseing Tour',
      startTimes: ['9:00 am', '11:00 am'],
      rating: 5,
      price: 30),
  Activity(
      imageUrl: 'assets/images/gondola.jpg',
      name: 'Walking Tour and gondola Ride',
      type: 'Sightseing Tour',
      startTimes: ['11:00 am', '1:00 pm'],
      rating: 4,
      price: 210),
  Activity(
      imageUrl: 'assets/images/murano.jpg',
      name: 'Murano and Burano Tour',
      type: 'Sightseing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125)
];
