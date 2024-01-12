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
<p float="left">
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/def7a0a9-bbb5-47bd-841b-8fc1871c5780" width="250" />
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/12810f16-35ad-4d2c-834a-de478dfc03df" width="250" /> 
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/75be189c-889d-479b-891d-126c1693da53" width="250" />
</p>


2. **Product Listing Screen**: Displays a list of products fetched from a mock API (in this case, [Fake Store API](https://fakestoreapi.com/)). Each product shows its name, price, and an image.                                                            <p float="left">
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/5ec2c08f-d931-4056-9be5-45854b47be8f" width="250" />
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/83587693-1135-43e7-88dd-0d20c90d68a2" width="250" />
</p>


3. **Product Detail Screen**: Provides additional information about the selected product, including description, specifications, and user reviews.                                                                                                                         <p float="left">
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/8be2a8d2-b803-4f3b-8380-0d8e9a791b52" width="250" />
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/746513ce-b03a-4441-a92c-f6011facc6d9" width="250" />
</p>


4. **Favorite Products Screen**: Users can mark products as favorites on the product listing screen by tapping on a heart icon. This screen displays the list of user-selected favorite products.                                                                          <p float="left">
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/96fad978-bb99-4d2b-83ad-a8b2e0cabc72" width="250" />
  <img src="https://github.com/UK818/Assessment-task/assets/32143087/a3cf333e-710b-4cdd-ad17-7eeb90934875" width="250" />
</p>

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
