# Quotes App

A reactive Flutter application that enables a user to login and write minimalist journal entries on Firebase, made for ufirst.

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/LRNZ09/quotes-app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

Show available devices:

```
flutter devices
```

and choose one to run the app:

```
flutter run -d device_name
```

## Features:

- Home
- Login
- Quote of the day
- Journal list
- Journal detail (create or update)
- Routing
- Firebase (Auth & Cloud Firestore)

### Up-Coming Features:

- Add image to a journal
- Delete a journal
- Dark theme support
- Multilingual support

### Libraries & Tools Used

- [Flutter](https://github.com/flutter/flutter/)
- [Firebase](hhttps://github.com/FirebaseExtended/flutterfire/)

### Folder Structure

Here is the core folder structure:

```
quotes-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project:

```
lib/
|- classes/
|- screens/
|- utils/
|- widgets/
|- app.dart
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- classes - Contains adapter classes, like http resources, for example.
2- screens - Contains the screens used within the app for navigation.
5- utils — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, Card, List etc.
7- app.dart — This file contains all the main widget of the application.
8- main.dart - This is the starting point of the application, where we also initialize Firebase.
```

## Wiki

Checkout [wiki](hthttps://github.com/LRNZ09/quotes-app/wiki) for more info

## Conclusion

I will be happy to answer any questions that you may have on this approach 🙂
