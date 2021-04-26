//
//  ViewController.swift
//  PopCorn
//
//  Created by Enzo on 12/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filmLabel1: UILabel!
    @IBOutlet weak var filmLabel2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        filmLabel1.layer.borderColor = CGColor.init(red: 109, green: 242, blue: 211, alpha: 1)
        filmLabel1.layer.backgroundColor = CGColor.init(red: 109, green: 242, blue: 211, alpha: 1)
        filmLabel1.layer.borderWidth = 1.5
        filmLabel1.layer.cornerRadius = 15
    }

    
}
