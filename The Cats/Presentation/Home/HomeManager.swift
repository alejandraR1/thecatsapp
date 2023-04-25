//
//  HomeManager.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import Foundation

protocol IHomeManager: AnyObject {
    func getCats(_ closure: @escaping ([HomeModel.Cat]) -> Void)
    func getImages(_ id: String, closure: @escaping ([HomeModel.CatImage]) -> Void)
}

class HomeManager: IHomeManager {
    func getCats(_ closure: @escaping ([HomeModel.Cat]) -> Void){
        let connection = Connection()
        DispatchQueue.global().async {
            connection.fetchCats(completionHandler: closure)
        }
    }
    
    func getImages(_ id: String, closure: @escaping ([HomeModel.CatImage]) -> Void){
        let connection = Connection()
        DispatchQueue.global().async {
            connection.getCatImages(id: id, completionHandler: closure)
        }
    }
}
