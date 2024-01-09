# WeatherApp-SwiftUI

WeatherApp-SwiftUI is a simple weather application built in SwiftUI that provides current weather information based on the user's location or a specified city. It leverages the OpenWeatherMap API for fetching weather data.

## Features

- Current weather information display
- Dynamic background gradient based on the time of day
- Location-based weather information
- User can input a specific city to get weather details
- Loading view while fetching data

## Project Structure

- **WeatherViewModel.swift**: Contains the view model responsible for managing weather data and interactions with the OpenWeatherMap API.
- **ContentView.swift**: The main view displaying weather information, utilizing the WeatherViewModel.
- **NetworkManager.swift**: Handles network requests and data parsing using generics.
- **API.swift**: Stores API-related constants and constructs the URL for fetching weather data.
- **LocationManager.swift**: Manages location-related functionality.
- **Views**:
  - **HeaderView.swift**: Displays the header section with the city name and current date.
  - **CityStatusView.swift**: Displays the detailed weather information for the specified city.
  - **LoadingView.swift**: A loading indicator shown while fetching data.

## How to Use

1. Launch the app.
2. By default, it fetches weather information based on the user's current location.
3. The user can input a specific city in the provided text field to get weather details for that city.
4. The main screen displays the current weather, including temperature, weather conditions, wind speed, humidity, and rain chances.
5. The background gradient changes dynamically based on the time of day.
6. A loading indicator is displayed while fetching data.

## Dependencies

- SwiftUI: Apple's declarative framework for building user interfaces.
- CoreLocation: Apple's framework for location-based services.

## Configuration

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device.

## Author

- Gembali Sandesh Kumar

## Acknowledgments

- OpenWeatherMap API for providing weather data.

Feel free to contribute or customize the app according to your needs!
