//
//  MoviesViewController.swift
//  PopCorn
//
//  Created by Enzo on 25/04/2021.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let category: Category
    
    @IBOutlet weak var tableView: UITableView!
    
    init(category: Category){
        self.category = category
        super.init(nibName: "MoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    let movies: [Movie] = [
//        Movie(title:"Kaamelott", subtitle: "Subtitle 1", date: "02-02-2021", duration: 100, synopsis: "BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA", categories: [Genre(id: 1, name: "Humour")], filmImage:"/3bD1YWyH7cY0al6DXvCIrbDY6t2.jpg", poster:"/dWPyH67PdNcsP8yZ0R5w6CRlF4x.jpg"),
//        Movie(title:"Les Gardiens de la Galaxie", subtitle: "Subtitle 1", date: "02-02-2021", duration: 100, synopsis: "BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA", categories: [Genre(id: 1, name: "Humour")], filmImage:"/8bT1wgggO5xMamYu4kDiVloWXJQ.jpg", poster:"/dWPyH67PdNcsP8yZ0R5w6CRlF4x.jpg")
//    ]
    
    var myMovies: [MovieList] = []
    let moviesRepository = MovieRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        
        moviesRepository.getMovies(categorieId: category.id) { response in
            if let movies = response {
//                self.myMovies = movies.toMovie();                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
                print("Dans la récup")
            }
        }
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
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 150
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseID, for: indexPath) as! MovieTableViewCell
        
//        let movie = movies[indexPath.row]
//
//
//        cell.fill(movie: movie)
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let movie = movies[indexPath.row]
//        let board = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = board.instantiateViewController(identifier: "MovieDetailStoryboardID") as MovieDetailViewController
//        detailVC.movie = movie
//
//        print(movie.title)
//
//        present(detailVC,animated: true)
//    }
}
