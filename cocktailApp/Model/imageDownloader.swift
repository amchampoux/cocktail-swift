//
//  imageDownloader.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-13.
//

import Foundation

class imageDownloader {
    
    let base = "http://openweathermap.org/img/wn/"
    let end = "@2x.png"
    
    func imageUrl(_ code: String) -> URL? {
        return URL(string: base + code + end)
    }
    
    func download(_ code: String, completion: ((Data?) -> Void)?) {
        if let url = imageUrl(code) {
            URLSession.shared.dataTask(with: url) { d, _, _ in
                completion?(d)
            }.resume()
        } else {
            completion?(nil)
        }
    }
}
