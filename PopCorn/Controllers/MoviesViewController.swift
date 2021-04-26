//
//  MoviesViewController.swift
//  PopCorn
//
//  Created by Enzo on 25/04/2021.
//

import UIKit

struct Test {
    let title: String
    let subtitle: String
}

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    let movies: [Test] = [
        Test(title:"Movie 1", subtitle: "Subtitle 1"),
        Test(title:"Movie 2", subtitle: "Subtitle 2"),
        Test(title:"Movie 3", subtitle: "Subtitle 3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupViews(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseID, for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.subtitleLabel.text = movie.subtitle
        
        print("index path :")
        print(indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = movies[indexPath.row]
        let board = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = board.instantiateViewController(identifier: "MovieDetailStoryboardID")
        
        print(movie.title)
        
        present(detailVC,animated: true)
    }
}
