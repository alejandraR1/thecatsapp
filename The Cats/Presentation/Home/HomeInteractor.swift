//
//  HomeInteractor.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import UIKit

protocol IHomeInteractor: AnyObject {
    var cats: [HomeModel.Cat] {get}
    func callServiceCats()
    func getImagesCat(_ position: Int)
}

class HomeInteractor: IHomeInteractor {
    var presenter: IHomePresenter?
    var manager: IHomeManager?
    var cats: [HomeModel.Cat] = []

    init(presenter: IHomePresenter, manager: IHomeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func callServiceCats() {
        self.manager?.getCats({ arrayCats in
            self.cats = arrayCats
            
            self.presenter?.reloadTable()
        })
    }
    
    func getImagesCat(_ position: Int) {
        DispatchQueue.global().async {
            if let id = self.cats[position].id{
                self.manager?.getImages(id, closure: { images in
                    if let url = URL(string: images.first?.url ?? ""){
                        Connection.loadImage(from: url) { image in
                            self.cats[position].image = image.jpegData(compressionQuality: 0.25)
                            self.presenter?.reloadTable()
                        }
                    }
                })
            }
        }
        
        
    }
}
