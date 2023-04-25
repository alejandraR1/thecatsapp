//
//  CatCell.swift
//  The Cats
//
//  Created by Alejandra Romero on 25/04/23.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCountry: UILabel!
    
    @IBOutlet weak var labelIntelligence: UILabel!
    
    @IBOutlet weak var imageCat: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ cat: HomeModel.Cat){
        self.layer.borderWidth = 2.0 // Grosor del borde
        self.layer.borderColor = UIColor.black.cgColor // Color del borde
        self.layer.masksToBounds = true
        labelName.text = cat.name
        labelCountry.text = cat.origin
        labelIntelligence.text = "Intelligence: " + (cat.intelligence?.description ?? "0")
    }
    
    func setImage(_ image: Data){
        DispatchQueue.main.async {
            self.imageCat.image = UIImage(data: image)
        }
    }
}
