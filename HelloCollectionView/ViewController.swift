//
//  ViewController.swift
//  HelloCollectionView
//
//  Created by MBP_JackYang on 2019/11/30.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var myCC: UICollectionView!
    var images:[UIImage?] = []
    var itemsInLine:CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images = [
            UIImage(named: "png1"),
            UIImage(named: "png2"),
            UIImage(named: "png3"),
            UIImage(named: "png4"),
            UIImage(named: "png5"),
        ]
        
        myCC.delegate = self
        myCC.dataSource = self
        
        let screenSize = UIScreen.main.bounds.size
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        let side = screenSize.width / 3 - 10
        layout.itemSize = CGSize(width: side, height: side)
        myCC.setCollectionViewLayout(layout, animated: false)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.rotate),
                                               name:UIDevice.orientationDidChangeNotification,
                                               object: nil)
        
  
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccCell", for: indexPath) as! MyCell
        cell.backgroundColor = UIColor.red
        
        cell.cellImage.image = images[indexPath.row]
        return cell
    }
    
    @objc func rotate(){
        print("rotate")
        let screenSize = UIScreen.main.bounds.size
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 10
        let side = screenSize.width / itemsInLine - 10
        layout.itemSize = CGSize(width: side, height: side)
        myCC.setCollectionViewLayout(layout, animated: true)
    }
    
    @IBAction func buttonAction4(_ sender: Any) {
        itemsInLine = 4
        rotate()
    }
    
    @IBAction func buttonAction1(_ sender: Any) {
        itemsInLine = 2
        rotate()
    }
    
    @IBAction func buttonAction3(_ sender: Any) {
        itemsInLine = 3
        rotate()
    }
}

