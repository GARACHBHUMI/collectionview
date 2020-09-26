

import Foundation
protocol ProductManagerDelegate {
    func didUpdateProduct(_ productManager: ProductManager, product: ProductModel)
    func didFailWithError(error: Error)
}

struct ProductManager
{
    let productURL = "https://bmacinfotech.com/bmacapps/allapps/allapps.json"
    
 var delegate:ProductManagerDelegate?
    
    func fetchProducts(catagory:String)
    {
      print("catagory is selected \(catagory)")
     performRequest(with: productURL)
      
    }
     func performRequest(with urlString: String)
     {
       if let url = URL(string: urlString)
        {
            print("url is ---->\(url)")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil
                {
                    print(error as Any)
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safedata = data
                {
                    if let products = self.parseJSON(safedata)
                    {
                        print(products)
                        self.delegate?.didUpdateProduct(self, product: products)
                    }
                }
                else
                {
                    print("error")
                }
            }
            task.resume()
        }
     }
    func parseJSON(_ safedata: Data) -> ProductModel?
    {
       let decoder = JSONDecoder()
        do{
        let decodedData = try decoder.decode(Product.self, from: safedata)
            let name = decodedData.name
            let downloadLink = decodedData.downloadLink
            let imageUrl = decodedData.imageUrl
            let title = decodedData.title
            
            let product = ProductModel(name: name, downloadLink: downloadLink, title: title, imageUrl: "")
            print(product.name)
            return product
        }
        catch
        {
              return nil
        }
    }
    
}


