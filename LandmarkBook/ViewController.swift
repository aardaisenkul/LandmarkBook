//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ali Arda İsenkul on 6.01.2022.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Landmark Book Data
        
        landmarkNames.append("Zeus")
        landmarkNames.append("Poseidon")
        landmarkNames.append("Hades")
        landmarkNames.append("Thor")
        landmarkNames.append("Ares")
        
        landmarkImages.append(UIImage(named: "zeus.png")!)
        landmarkImages.append(UIImage(named: "poseidon.png")!)
        landmarkImages.append(UIImage(named: "hades.png")!)
        landmarkImages.append(UIImage(named: "thor.png")!)
        landmarkImages.append(UIImage(named: "ares.png")!)
        
       navigationItem.title = "God Book"
        
    }
    
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = CGFloat(10)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.godLabel.text = landmarkNames[indexPath.item]
        cell.godImageView.image = landmarkImages[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.item]
        chosenLandmarkImage = landmarkImages[indexPath.item]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
}

