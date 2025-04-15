//
//  ClientManger.swift
//  Weatherly
//
//  Created by R Unnikrishnan on 15/04/25.
//

import Foundation

// MARK: - Endpoint Router Enum

/// Enum to define and generate endpoint paths dynamically based on the API type (Geo or Weather)
enum ClientManger {
    
    // MARK: - API Cases
    case getLocationByName(String)
    case getWeatherByCoordinate(Double, Double)
    
    // MARK: - Endpoint Path Generator
    
    /// Generates the path string for the respective API call
    private var path: String {
        switch self {
        case .getLocationByName(let name):
            // Geo API for city name to coordinates
            return "/geo/1.0/direct?q=\(name)&appid=\(AppConstants.API.apiKey)"
            
        case .getWeatherByCoordinate(let lat, let lon):
            // Weather API for getting weather using coordinates
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(AppConstants.API.apiKey)"
        }
    }
    
    // MARK: - URL Generator
    
    /// Combines base URL with path to create a full endpoint URL
    static func endpointURL(for endpoint: ClientManger) -> URL {
        let endpointPath = endpoint.path
        return URL(string: AppConstants.API.baseURL + endpointPath)!
    }
}

// MARK: - Error Handling Enum

/// Custom error types for various network-related failures
enum networkingError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
}

// MARK: - GeoCoding Client

/// Handles API requests to get location data (latitude and longitude) for a city
struct geoCodingClient {
    
    /// Makes an API call to get location data from city name
    /// - Parameter city: Name of the city
    /// - Returns: Array of `LocationModelClass` objects or throws error
    func getLocation(_ city: String) async throws -> [LocationModelClass]? {
        // API call using URLSession
        let (data, response) = try await URLSession.shared.data(from: ClientManger.endpointURL(for: .getLocationByName(city)))
        
        // Check for successful HTTP status code
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw networkingError.invalidResponse
        }
        
        // Decode JSON data into array of location models
        let locationData = try JSONDecoder().decode([LocationModelClass].self, from: data)
        return locationData
    }
}

// MARK: - Weather Client

/// Handles API requests to get weather data from coordinates
struct weatherCodingClient {
    
    /// Makes an API call to fetch weather information for a specific location
    /// - Parameter location: A `LocationModelClass` containing latitude and longitude
    /// - Returns: A `WeatherDataModel` object or throws error
    func getweather(location: LocationModelClass) async throws -> WeatherDataModel? {
        // Construct the API request using the provided coordinates
        let (data, response) = try await URLSession.shared.data(
            from: ClientManger.endpointURL(for: .getWeatherByCoordinate(location.lat!, location.lon!))
        )
        
        // Validate HTTP response
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw networkingError.invalidResponse
        }
        
        // Decode JSON data into weather model
        let weatherData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
        return weatherData
    }
}
