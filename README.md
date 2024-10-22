# E-Commerce App
# Overview
- A Flutter-based E-Commerce app offering a complete shopping experience with features like user authentication, product browsing, cart management, and favorites. The app follows the MVVM pattern, uses BLoC and Cubit for state management, and integrates clean - 
-  architecture for scalability and maintainability.

# Features

 1- Authentication
- Login and Register: User authentication with email and password via API.
- Auto-Login: Automatically log in users based on saved credentials for a seamless experience.

2- API Integration

- Fetch product listings, user profiles, and handle cart operations through a RESTful API.

3- Favorites Page

- Add and remove products from the favorites list, allowing users to create a personal wishlist.

4- Search Functionality

5- Search for products within the app, powered by API search queries.

6- Cart Management

- Add items to the cart, modify quantities, and delete items directly from the cart.

7- Profile Page

- Users can manage and update their personal information and preferences.

8- Image Slideshow

9- View product images in a slideshow on the product details page.

10- Item View Page
- A detailed view of individual items, including product specifications, pricing, and availability.
Item Selection Page

11- Choose product variations like size, color, or other options before adding to the cart.
State Management

12- Utilizes BLoC and Cubit for efficient state management across the app.
MVVM Pattern

13- The app follows the MVVM (Model-View-ViewModel) design pattern, ensuring a clear separation of logic and UI, making the codebase more maintainable.
Clean Architecture

14 - Implements Clean Architecture, ensuring the separation of concerns and promoting scalability.
Shared Preferences

15 - Uses SharedPreferences to store and persist user data like login status and favorites list.
16- Dio Package

17- Handles API requests using the Dio package for robust communication with the backend.


#Installation
- Clone the repository:

- git clone https://github.com/ZiadElshal/E-Commerce-App-Route.git
Install dependencies:


flutter pub get
Run the app:

- flutter run
# Technologies Used
- Flutter: For building the cross-platform app.
- BLoC and Cubit: For state management.
- MVVM Pattern: Ensures a structured codebase by separating UI from business logic.
- Dio: For making HTTP requests to the backend API.
- SharedPreferences: For storing persistent local data.
- Image Slideshow: To display product images


# ScreenShots

<p align="center">
  <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/spalsh.png" alt="Sign Up" width="220" style="margin: 10px;"/>
  <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/login.png" alt="Sign In" width="220" style="margin: 10px;"/>
     <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/register.png" alt="Validator dark" width="220" style="margin: 10px;"/>
</p>

<p align="center">
     <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/home.png" alt="Task" width="220" style="margin: 10px;"/>
  <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/products.png" alt="Task Add" width="220" style="margin: 10px;"/>
  <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/products%20detailes.png" alt="Task Delete" width="220" style="margin: 10px;"/>

</p>

<p align="center">
       <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/cart.png" alt="Edit Task" width="220" style="margin: 10px;"/>
  <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/favorite%20page.png" alt="Done Task" width="220" style="margin: 10px;"/>
    <img src="https://github.com/ZiadElshal/E-Commerce-App-Route/blob/master/screenshots/profile%20page.png" alt="Dialog Dark" width="220" style="margin: 10px;"/>
</p>


=
# License
- This project is licensed under the MIT License - see the LICENSE file for details.

- This updated README.md now includes the new features: item view page, item selection page, and auto-login with MVVM.
