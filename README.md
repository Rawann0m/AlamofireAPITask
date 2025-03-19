# SwiftUI API Calls with Alamofire

This project demonstrates how to perform GET and POST requests using Alamofire in SwiftUI. It follows the MVVM architecture and dynamically updates the UI based on fetched data.

## Features

GET Request: Fetches posts from https://jsonplaceholder.typicode.com/posts. and from https://dummyjson.com/posts

POST Request: Creates a new post with dummy data.

SwiftUI List: Displays posts dynamically.

Error Handling: Displays errors if API calls fail.

## Installation

Clone the repository:

git clone 

Open the project in Xcode.

Install Alamofire using Swift Package Manager:

Go to File > Swift Packages > Add Package Dependency

Enter https://github.com/Alamofire/Alamofire.git and add it.

## How to Run

Build and run the project on a simulator or a real device.

Click on Fetch Data and Posts will load .

Tap "Post Data" to send a new POST request.


## Project Structure

Model: Defines the Post struct and the user post that will be sent conforming to Codable.

Service Layer: Handles API requests using Alamofire.

ViewModel: Manages API calls and updates the UI.

SwiftUI View: Displays data and handles user interactions.
