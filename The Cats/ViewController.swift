//
//  ViewController.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = HomeConfiguration.setup()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

