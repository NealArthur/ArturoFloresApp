//
//  GalleryViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var imagesCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ImageGalleryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath) as! ImageGalleryCollectionViewCell
        
        cell.sizeToFit()
        cell.descriptionLabel.text = "una manaña por la mañana"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagesCollectionView.delegate = self
        self.imagesCollectionView.dataSource = self
        
        self.imagesCollectionView.register(UINib(nibName: "ImageGalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
