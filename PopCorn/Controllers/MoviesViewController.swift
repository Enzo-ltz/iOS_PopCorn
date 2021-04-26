//
//  MoviesViewController.swift
//  PopCorn
//
//  Created by Enzo on 25/04/2021.
//

import UIKit

struct Test {
    let title: String
    let date: String
    let synopsys: String
}

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    let movies: [Movie] = [
        Movie(title:"Kaamelott", subtitle: "Subtitle 1", date: "02-02-2021", duration: 100, synopsis: "BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA", categories: [Genre(id: 1, name: "Humour")], affiche:"", poster:"/3bD1YWyH7cY0al6DXvCIrbDY6t2.jpg"),
        Movie(title:"Les Gardiens de la Galaxie", subtitle: "Subtitle 1", date: "02-02-2021", duration: 100, synopsis: "BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA", categories: [Genre(id: 1, name: "Humour")], affiche:"", poster:"/8bT1wgggO5xMamYu4kDiVloWXJQ.jpg")
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
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 150
        
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
        
       
        cell.fill(movie: movie)
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
