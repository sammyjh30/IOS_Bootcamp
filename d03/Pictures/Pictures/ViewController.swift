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
        images.append("data:image/jpeg;base64,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")
        images.append("https://wallpaperplay.com/walls/full/d/0/1/48899.jpg")
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
        
           if (images_cache[images[indexPath.row]] != nil)
           {
               cell.imageView.image = images_cache[images[indexPath.row]]
           }
           else
           {
               load_image(images[indexPath.row], imageview:cell.imageView, activityView:activityView)
           }
           
           return cell
       }
       

       internal func numberOfSections(in collectionView: UICollectionView) -> Int
       {
           return 1
       }
       
       func load_image(_ link:String, imageview:UIImageView,  activityView: UIActivityIndicatorView)
       {
           
           let url:URL = URL(string: link)!
           let session = URLSession.shared
           
           let request = NSMutableURLRequest(url: url)
           request.timeoutInterval = 10

           
           let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
               guard let _:Data = data, let _:URLResponse = response, error == nil else {
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

