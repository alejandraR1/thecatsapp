//
//  HomeConfiguration.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import Foundation
import UIKit

class HomeConfiguration {
    static func setup() -> UIViewController {
        let controller = HomeViewController()
        let router = HomeRouter(view: controller)
        let presenter = HomePresenter(view: controller)
        let manager = HomeManager()
        let interactor = HomeInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        return controller
    }
}
