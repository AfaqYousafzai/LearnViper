
 # LearnViper ReadMe
## Overview
This repository contains an iOS application developed using Swift and following the 
VIPER architecture pattern. The project consists of two main modules: Listing 
Module and Details Module. Each module is responsible for displaying information 
retrieved from the New York Times API using URLSession. The Listing Module 
displays a list of items fetched from the API, and upon selecting an item, the user 
navigates to the Details Module, which shows detailed information including cached 
images.
## Modules
### Listing Module
- Displays a list of items fetched from the New York Times API.
- Uses URLSession for network requests.
- Implements Dependency Injection for passing data during module creation.
- Follows the VIPER architecture pattern with separate components for View, 
Interactor, Presenter, Entity, and Router.
### Details Module
- Shows detailed information about an item selected from the Listing Module.
- Implements image caching mechanism for images displayed on the detail screen.
- Follows VIPER architecture pattern similar to the Listing Module.
## Unit Tests
- Three unit tests are implemented specifically for the Details Module Interactor layer.
- Tests cover various scenarios and edge cases like valid url, invalid url and retrieval 
after cache.
## Project Structure
The project is structured according to the VIPER architecture pattern, ensuring 
separation of concerns and maintainability. Each module (Listing and Details) has its 
own set of components:
- *View*: Responsible for displaying data and handling user interactions.
- *Interactor*: Contains business logic and interacts with the data layer.
- *Presenter*: Formats data for display and communicates between View and 
Interactor.
- *Entity*: Represents data models used within the module.
- *Router*: Handles navigation between modules.
## Dependencies
The project relies on Swift and includes URLSession for networking and basic image 
caching mechanisms. No third-party libraries are currently used.
## How to Use
To use this project:
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device
