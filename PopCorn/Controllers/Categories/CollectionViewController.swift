//
//  CollectionViewController.swift
//  PopCorn
//
//  Created by Enzo on 27/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var myCategories: [Category] = []
    let categoriesRepository = CategoryRepository()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Categories"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        categoriesRepository.getCategories() { response in
                    if let categories = response {
                        self.myCategories = categories.toCategory()
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
                
        // Do any additional setup after loading the view.
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.myCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  size = self.collectionView.frame.size.width / CGFloat(2) - 5
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        let category = myCategories[indexPath.item]
        cell.setText(category: category)
        
        // Configure the cell
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(MoviesViewController(category: myCategories[indexPath.item]), animated: true)
    }

//    completionHandler: @escaping ([Category]) -> Void
//    func fetchCategories(){
//        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=5a88f6a3a255d01d819301d8c98dc442&language=fr-FR")!
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//          if let error = error {
//            print("Error with fetching categories: \(error)")
//            return
//          }
//
//          guard let httpResponse = response as? HTTPURLResponse,
//                (200...299).contains(httpResponse.statusCode) else {
//            print("Error with the response, unexpected status code: \(String(describing: response))")
//            return
//          }
//
//            if let data = data {
//                let categories = try? JSONDecoder().decode(CategoriesList.self, from: data)
//                print(categories!.genres[0].id)
//            }
//        }
//        task.resume()
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
