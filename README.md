# Flutter E-Commerce App

This Flutter project is a mobile application designed for assessment. 
The app allows users to browse and view product listings from a decentralized marketplace. 
It includes features such as user authentication, product listing, product details, and a favorites list.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Screens](#screens)
- [Functionalities](#functionalities)
- [Challenges and Solutions](#challenges-and-solutions)
- [Getting Started](#getting-started)
- [How to Run](#how-to-run)
- [Acknowledgements](#acknowledgements)

## Technologies Used

- [Bloc](https://bloclibrary.dev/)
- [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html)
- [Firebase](https://firebase.google.com/)
- [GoRouter](https://pub.dev/packages/go_router)
- [SharedPreference](https://pub.dev/packages/shared_preferences)

## Screens

1. **Login/Sign-Up Screen**: Allows users to sign in or sign up using their email address and password.

2. **Product Listing Screen**: Displays a list of products fetched from a mock API (in this case, [Fake Store API](https://fakestoreapi.com/)). Each product shows its name, price, and an image.

3. **Product Detail Screen**: Provides additional information about the selected product, including description, specifications, and user reviews.

4. **Favorite Products Screen**: Users can mark products as favorites on the product listing screen by tapping on a heart icon. This screen displays the list of user-selected favorite products.

## Functionalities

- **Sign In/Sign Up**: New users can sign up, and registered users can log in securely.

- **Product Listing**: Displays a list of products with essential details.

- **Product Details**: Shows additional information about a selected product.

- **Add to Favorites**: Users can mark products as favorites.

- **View Favorites**: Users can view their list of favorite products.

## Challenges and Solutions

- **Efficient Data Handling**: Implemented Bloc pattern for state management and StreamBuilder for efficient data handling.

- **Secure Authentication**: Integrated Firebase for secure user authentication.

- **Optimizing Performance**: Employed various optimization techniques for smooth scrolling and image loading.

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/UK818/TEDZA-Assessment-task.git
```

2. Navigate to the project directory:

```bash
cd TEDZA-Assessment-task/tezda_assessent_task
```

3. Install dependencies:

```bash
flutter pub get
```

## How to Run

Ensure you have Flutter and Dart installed on your machine. Connect a device or start an emulator.

Run the app:

```bash
flutter run
```

## Acknowledgements

This project was created as part of the Flutter Developer assessment for Tezda. Special thanks to Bek for providing the opportunity to showcase skills in Flutter development.

Feel free to explore and enhance this project further! If you have any questions or suggestions, please don't hesitate to reach out.

Happy coding!
