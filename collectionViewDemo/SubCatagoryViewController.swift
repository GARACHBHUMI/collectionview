

import UIKit

class SubCatagoryViewController: UITableViewController {
    var selectedCatagory:String = ""
    
    
    
    let products = ["Nikon 600D Mirrorless","WJPILIS Smart Wrist Watch","Echo Dot Kid Edition","Amazon Echo Look","Apple Wrist Watch"]
    let price = ["$445","$36","$56","$899","678"]
    let productimage:[UIImage] = [#imageLiteral(resourceName: "camera"),#imageLiteral(resourceName: "watch"),#imageLiteral(resourceName: "echo"),#imageLiteral(resourceName: "remote"),#imageLiteral(resourceName: "watch")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        tableView.rowHeight = 150
    
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        cell.tableImg.image = productimage[indexPath.item]
        cell.productTitle.text = products[indexPath.item]
        cell.subcatagory.text = price[indexPath.item]
        
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 10.0
        cell.contentView.layer.borderColor = UIColor.init(white: 0.70, alpha: 0.3).cgColor

           cell.layer.shadowColor = UIColor.lightGray.cgColor
           cell.layer.shadowOffset = CGSize(width:2.0,height: 3.0)
           cell.layer.shadowRadius = 10.0
           cell.layer.shadowOpacity = 0.8
           cell.layer.masksToBounds = false;
           cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds,cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
  
        
        
        return cell
    }

}
