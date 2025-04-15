//
//  ContentView.swift
//  Weatherly
//
//  Created by R Unnikrishnan on 15/04/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    // MARK: - State Variables
    @State private var locationName: String = ""
    @State private var weatherData: WeatherDataModel? = nil
    @State private var errorMessage: String? = nil
    @State private var isLoading: Bool = false

    // MARK: - Clients
    let geoClient = geoCodingClient()
    let weatherClient = weatherCodingClient()
    
    // MARK: - Weather Fetch Function
    private func getWeatherInfo() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            // Get the location (latitude, longitude) from city name
            guard let locations = try await geoClient.getLocation(locationName),
                  let firstLocation = locations.first else {
                errorMessage = "Location not found"
                return
            }
            
            // Get weather data from coordinates
            if let fetchedWeather = try await weatherClient.getweather(location: firstLocation) {
                weatherData = fetchedWeather
            } else {
                errorMessage = "Weather data not found"
            }
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            // Input field
            TextField("Enter Location", text: $locationName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .submitLabel(.search)
                .onSubmit {
                    Task {
                        await getWeatherInfo()
                        isLoading = false
                        locationName = ""
                    }
                }
            Spacer()

            // Loading Indicator
            if isLoading {
                ProgressView("Fetching weather...")
            }

            // Weather Display
            if let weather = weatherData {
                Text("Temperature: \(weather.main?.temp ?? 0.0, specifier: "%.1f")°K")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding()
            }
            Spacer()

            // Error Message
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
