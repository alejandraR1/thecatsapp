//
//  HomeModel.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import UIKit

struct HomeModel {	
    struct Cat: Codable {
        let weight: Weight?
        let id: String?
        let name: String?
        let cfa_url: String?
        let vetstreet_url: String?
        let vcahospitals_url: String?
        let temperament: String?
        let origin: String?
        let country_codes: String?
        let country_code: String?
        let description: String?
        let life_span: String?
        let indoor: Int?
        let lap: Int?
        let alt_names: String?
        let adaptability: Int?
        let affection_level: Int?
        let child_friendly: Int?
        let dog_friendly: Int?
        let energy_level: Int?
        let grooming: Int?
        let health_issues: Int?
        let intelligence: Int?
        let shedding_level: Int?
        let social_needs: Int?
        let stranger_friendly: Int?
        let vocalisation: Int?
        let experimental: Int?
        let hairless: Int?
        let natural: Int?
        let rare: Int?
        let rex: Int?
        let suppressed_tail: Int?
        let short_legs: Int?
        let wikipedia_url: String?
        let hypoallergenic: Int?
        let reference_image_id: String?
        var image: Data?
    }

    struct Weight: Codable {
        let imperial: String
        let metric: String
    }
    
    
    struct CatImage: Codable {
        let id: String
        let url: String
        let width: Int
        let height: Int
    }

}
