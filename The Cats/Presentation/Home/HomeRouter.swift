//
//  HomeRouter.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import UIKit

protocol IHomeRouter: AnyObject {
	// do someting...
}

class HomeRouter: IHomeRouter {	
	weak var view: HomeViewController?
	
	init(view: HomeViewController?) {
		self.view = view
	}
}
