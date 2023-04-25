//
//  HomePresenter.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import UIKit

protocol IHomePresenter: AnyObject {
	func reloadTable()
}

class HomePresenter: IHomePresenter {	
	weak var view: IHomeViewController?
	
	init(view: IHomeViewController?) {
		self.view = view
	}
    
    
    func reloadTable() {
        self.view?.updateTable()
    }
}
