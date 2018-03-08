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
    let descriptions = ["Mi primer aplicación en ios compilada", "Mi primer iphone se rompió.","En una sesión de grabación en mi primer trabajo", "Mi equipo de desarrollo para el Global Startup Lab impartido por el MIT","Yo en visita del iLab", "En compañía de Diego Méndez: Instructor del GSL por parte del MIT","Mi actual equipo de trabajo", "Preparando un review para mi blog personal: Bombilla Bluetooth para Homekit","Yo disfrutando el tiempo libre que da aveces la vida."]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return descriptions.count
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ImageGalleryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath) as! ImageGalleryCollectionViewCell
        
        cell.sizeToFit()
        let imageName = "img\(indexPath.row+1)"
        cell.pictureImageView.image =  UIImage(named: imageName)
        cell.descriptionLabel.text = descriptions[indexPath.row]
        
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
