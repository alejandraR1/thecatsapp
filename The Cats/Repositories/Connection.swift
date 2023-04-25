//
//  Connection.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.
//

import Foundation
import UIKit

class Connection {
    
    
    static func loadImage(from url: URL, completionHandler: @escaping (UIImage) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }
            completionHandler(image)
        }
        task.resume()
    }
   
    
    func getCatImages(id: String, completionHandler: @escaping ([HomeModel.CatImage]) -> Void){
        // Create a URL object from the given string
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?breed_ids=" + id) else {
            print("Error: Invalid URL")
            return
        }
        // Create a URLRequest object with the URL
        let request = URLRequest(url: url)
        // Create a URLSession data task to fetch the data from the URL
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check for errors
            guard let data = data else {
                print("Error: No data returned")
                return
            }
            // Create a JSON decoder to decode the data into an array of Cats
            let decoder = JSONDecoder()
            do {
                let cats = try decoder.decode([HomeModel.CatImage].self, from: data)
                // Call the completion handler with the fetched Cats array
                completionHandler(cats)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    // A function to fetch an array of Cats from the given URL
    func fetchCats(completionHandler: @escaping ([HomeModel.Cat]) -> Void) {
        // Create a URL object from the given string
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            print("Error: Invalid URL")
            return
        }
        // Create a URLRequest object with the URL
        var request = URLRequest(url: url)
        // Set the API key in the header of the request
        request.setValue("×-api-key:bda53789-d59e-46cd-9bc4-2936630fde39",
                         forHTTPHeaderField: "API-KEY")
        // Create a URLSession data task to fetch the data from the URL
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check for errors
            guard let data = data else {
                print("Error: No data returned")
                return
            }
            // Create a JSON decoder to decode the data into an array of Cats
            let decoder = JSONDecoder()
            do {
                let cats = try decoder.decode([HomeModel.Cat].self, from: data)
                // Call the completion handler with the fetched Cats array
                completionHandler(cats)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
