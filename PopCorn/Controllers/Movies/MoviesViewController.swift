//
//  MoviesViewController.swift
//  PopCorn
//
//  Created by Enzo on 25/04/2021.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var spinner = UIActivityIndicatorView()
    
    let category: Category
    
    @IBOutlet weak var tableView: UITableView!
    
    init(category: Category){
        self.category = category
        super.init(nibName: "MoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myMovies: [MovieList] = []
    let moviesRepository = MovieRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
           
        
        moviesRepository.getMovies(categorieId: category.id) { response in
            if let movies = response {
                self.myMovies = movies.toMovie();                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                }
                
            }
        }
    }

    
    func setupViews(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 150
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseID, for: indexPath) as! MovieTableViewCell
        
        let movie = myMovies[indexPath.row]


        cell.fill(movie: movie)
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let movie = myMovies[indexPath.row]
//        let board = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = board.instantiateViewController(identifier: "MovieDetailStoryboardID") as MovieDetailViewController
//        detailVC.movie = movie.id
//
//        print(movie.title)
//
//        present(detailVC,animated: true)
//    }
}
