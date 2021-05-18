//
//  CategoryCollectionViewCell.swift
//  PopCorn
//
//  Created by Enzo on 27/04/2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setText(category: Category){
        categoryLabel.text = category.name
    }
    

}
