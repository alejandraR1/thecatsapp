//
//  HomeViewController.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.


import UIKit

protocol IHomeViewController: AnyObject {
	var router: IHomeRouter? { get set }
    func updateTable()
}

class HomeViewController: UIViewController {
	var interactor: IHomeInteractor?
	var router: IHomeRouter?
    
    @IBOutlet weak var tableCats: UITableView!
    
    

	override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.callServiceCats()
        self.tableCats.register(UINib(nibName: "CatCell", bundle: nil),
                                forCellReuseIdentifier: "CatCell")
        navigationItem.hidesBackButton = true
    }
    

}

extension HomeViewController: IHomeViewController {
    func updateTable() {
        DispatchQueue.main.async {
            self.tableCats.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return interactor?.cats.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        view.backgroundColor = .clear
        return view
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatCell
        if let cat = self.interactor?.cats[indexPath.section]{
            cell.setCell(cat)
            if let image = cat.image{
                cell.setImage(image)
            }
            else{
                self.interactor?.getImagesCat(indexPath.section)
            }
        }
        
        return cell
    }
    
}

