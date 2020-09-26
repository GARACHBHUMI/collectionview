//
//  ViewController.swift
//  collectionViewDemo
//
//  Created by ravi on 24/09/20.
//  Copyright © 2020 ravi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    
    var imageCell = ImageCell()
    
    private let sectionInsets = UIEdgeInsets(top: 50.0,
    left: 15.0,
    bottom: 50.0,
    right: 15.0)
    
    let catagoryName = ["Buying","Selling","Trades","Videos","Deals","Case Study"]
    let catagoryImg:[UIImage] = [#imageLiteral(resourceName: "buying"),#imageLiteral(resourceName: "selling"),#imageLiteral(resourceName: "trade"),#imageLiteral(resourceName: "video-1"),#imageLiteral(resourceName: "deal"),#imageLiteral(resourceName: "casestudy")]
    
   private let itemsPerRow: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
//    @IBAction func btnpressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "goToSubcatagory", sender: self)
//    }
    

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCell
        cell.imageLbl.text = catagoryName[indexPath.item]
        cell.image.image = catagoryImg[indexPath.item]
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;

           cell.layer.shadowColor = UIColor.lightGray.cgColor
           cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
           cell.layer.shadowRadius = 10.0
           cell.layer.shadowOpacity = 2.0
           cell.layer.masksToBounds = false;
           cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        cell.backgroundColor = .white

        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        print("\(catagoryName[indexPath.item]) selected")
       // let cell = collectionView.cellForItem(at: indexPath)
       
         performSegue(withIdentifier: "goToSubcatagory", sender: self)

        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           let destinationVC = segue.destination as! SubCatagoryViewController
//
//        if let indexpath  = collectionView.indexPathsForSelectedItems
//        {
//            destinationVC.selectedCatagory = catagoryName[indexpath.row].first
//        }
//
//           }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath) -> CGSize {

       let paddingSpace = sectionInsets.left  * (itemsPerRow + 1)
       let availableWidth = view.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
       
       return CGSize(width: widthPerItem, height: widthPerItem)
     }
     
     
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return sectionInsets.left
     }
    
    
   
}
