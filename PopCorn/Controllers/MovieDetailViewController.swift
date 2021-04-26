//
//  ViewController.swift
//  PopCorn
//
//  Created by Enzo on 12/04/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
    }

    @IBAction func PlayButton(_ sender: UIButton) {
        print("In Button")
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=hCKPvMT1E1I")!)
    }
    
}
