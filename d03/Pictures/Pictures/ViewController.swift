//
//  ViewController.swift
//  Pictures
//
//  Created by Samantha HILLEBRAND on 2019/10/11.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var images_cache = [String:UIImage]()
       var images = [String]()
       let link = "http://www.kaleidosblog.com/tutorial/get_images.php"
       
       override func viewDidLoad() {
           super.viewDidLoad()

           
           let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()

           layout.itemSize = CGSize(width: 120,height: 120)
           
           
           self.collectionView.setCollectionViewLayout(layout, animated: true)
           
            images.append("https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg")
            images.append("https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg")
            images.append("https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/potw1933a_0.jpg")
            images.append("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSegIkvAMhgZ7Q9Qx9UC4LPCJyrFuEkKAqklsLUZYAp1GmUjJ1dJw")
            images.append("https://wallpaperplay.com/walls/full/d/0/1/48899.jpg")
        images.append("https://i.pinimg.co/originals/66/be/b7/66beb79a08236b492454fb12da760c09.jpg")
            images.append("")

        
        collectionView.delegate = self
        collectionView.dataSource = self
       }

       
       
       internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
       {
           return images.count
       }
       

       internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
       {
           let cell:CellClass = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellClass
           
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = cell.contentView.center
        cell.contentView.addSubview(activityView)
        activityView.startAnimating()
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
           if (images_cache[images[indexPath.row]] != nil)
           {
               cell.imageView.image = images_cache[images[indexPath.row]]
           }
           else
           {
                if (self.verifyUrl(urlString: images[indexPath.row])) {
                   load_image(images[indexPath.row], imageview:cell.imageView, activityView:activityView)
                } else {
                    let alert = AlertHelper()
                    alert.showAlert(fromController: self)
                }
        
           }
           
           return cell
       }
       

       internal func numberOfSections(in collectionView: UICollectionView) -> Int
       {
           return 1
       }
    

    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
       
       func load_image(_ link:String, imageview:UIImageView,  activityView: UIActivityIndicatorView)
       {
           
           let url:URL = URL(string: link)!
        
           let session = URLSession.shared
           
           let request = NSMutableURLRequest(url: url)
           request.timeoutInterval = 10

           
           let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
               guard let _:Data = data, let _:URLResponse = response, error == nil else {
                var alert = AlertHelper()
                alert.showAlert(fromController: self)
                
                return
               }
                   
                print("Download Started")
               var image = UIImage(data: data!)
//            activityView.stopAnimating()
               
               if (image != nil) {
                   func set_image()
                   {
                       self.images_cache[link] = image
                       imageview.image = image
                    
                    activityView.stopAnimating()
//                    UIApplication.shared.isNetworkActivityIndicatorVisible = false

                   }
                print("Download Finished")
                   DispatchQueue.main.async(execute: set_image)
               }
           })
           
           task.resume()
           
       }

       


       func extract_json_data(_ data:Data)
       {
           let json: Any?
           
           do
           {
               json = try JSONSerialization.jsonObject(with: data, options: [])
               
           }
           catch
           {
               print("error")
               return
           }
           
           guard let images_array = json! as? NSArray else
           {
               print("error")
               return
           }
           
           for j in 0 ..< images_array.count
           {
               images.append(images_array[j] as! String)
           }
           
           DispatchQueue.main.async(execute: refresh)
       }
       
       
       
       func refresh()
       {
           self.collectionView.reloadData()
       }
       

       func get_json()
       {
        
           let url:URL = URL(string: link)!
           let session = URLSession.shared
           
           let request = NSMutableURLRequest(url: url)
           request.timeoutInterval = 10
           
           
           let task = session.dataTask(with: request as URLRequest, completionHandler: {
               (
               data, response, error) in
               
               guard let _:Data = data, let _:URLResponse = response, error == nil else {
                   
                   return
               }
              

               self.extract_json_data(data!)
               
           })
           
           task.resume()
           
       }
}


class AlertHelper {
    
        func showAlert(fromController controller: UIViewController) {
            DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "An image failed to load", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    
        }
    }
}
