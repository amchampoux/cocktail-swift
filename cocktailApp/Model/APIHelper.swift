//
//  APIHelper.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-11.
//

import Foundation

class APIHelper {
    
    static let shared = APIHelper()
    
    private let _apiKey = "2d285f259b354563cb1ffa2bc3afb22f"
    
// current weather data plutot
    
    let base = "https://api.openweathermap.org/data/2.5/weather"
    let units = "&units=metric"
    let lang = "&lang=fr"
    var appID: String {
        return "&appid=" + _apiKey
    }
    
    func getUrl(coords: String) -> URL? {
        var urlString = base
        urlString += coords
        urlString += lang
        urlString += units
        urlString += appID
        print(urlString)
        return URL(string: urlString)
    }
    
    func parseWeather(coords: String, completion: (([Forecast])-> Void)?) {
        if let url = getUrl(coords: coords) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let d = data {
                    do {
                        let result = try JSONDecoder().decode(Forecast.self, from: d)
//                        print(results.list.count)
                        completion?([result])
                    } catch {
                        print(error.localizedDescription)
                        completion?([])
                    }
                } else {
                }
            }.resume()
        } else {
            completion?([])
    }
}
}
