# digitalsalt_assignment

Overview
This is a Flutter application designed for managing and displaying course data. The app features user authentication, including Firebase login/signup and Google Sign-in. It utilizes the MVVM architecture for scalable code organization and GetX for state management. The app also integrates an HTTP-based API call to fetch a list of available courses.

Features
Authentication:
Firebase Authentication for user login and signup.
Google Sign-in support.
Course List:
API integration to fetch a list of courses using HTTP GET.
The Home Page displays constant data.
Search Functionality:
Allows users to search for courses from the course list on the Search Page.
State Management:
GetX is used for efficient and reactive state management across the app.
App Structure
The app follows the MVVM (Model-View-ViewModel) architecture to keep the code clean, modular, and testable.

Key Components:
Model: Represents the course data and user data (for authentication).
View: UI screens for home, search, and authentication.
ViewModel: Contains logic to interact with the model and update the UI based on the data/state.
Libraries and Tools Used
Flutter: The framework for building the app.
GetX: State management solution used for efficient data binding and state handling.
HTTP: Used to make network requests for fetching course data from the API.
Firebase Authentication: For handling user authentication (login/signup).
Google Sign-in: Added for easy authentication via Google accounts.
SDK Versions
Flutter SDK: 3.24.3
Dart SDK: 3.5.3
