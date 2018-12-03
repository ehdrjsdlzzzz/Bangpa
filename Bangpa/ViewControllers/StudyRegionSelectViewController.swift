//
//  StudyRegionSelectViewController.swift
//  Bangpa
//
//  Created by 이동건 on 03/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class StudyRegionSelectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gyeonggiButton: UIButton!
    @IBOutlet weak var seoulButton: UIButton!
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBAction func dismissButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    private var seoulButtonIsSelect = true {
        didSet {
            if seoulButtonIsSelect == true {
                self.seoulButton.setTitleColor(.black, for: .normal)
                self.gyeonggiButton.setTitleColor(.lightGray, for: .normal)
            } else {
                self.seoulButton.setTitleColor(.lightGray, for: .normal)
                self.gyeonggiButton.setTitleColor(.black, for: .normal)
            }
            
        }
    }
    
    var regions = ["강남구", "강동구", "강북구", "강서구", "관악구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구", "강남구", "강동구", "강북구", "강서구"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let origImage = UIImage(named: "Cancel")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        dismissButton.setImage(tintedImage, for: .normal)
        //        dismissButton.tintColor = UIColor(red: 142.0, green: 142.0, blue: 142.0, alpha: 1.0)
        dismissButton.tintColor = .lightGray
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath) as! RegionCollectionViewCell
        cell.regionLabel.text = regions[indexPath.item]
        
        return cell
    }
    
    //    CollectionViewLayout Func
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    @IBAction func seoulButtonTapped(_ sender: UIButton) {
        seoulButtonIsSelect = true
    }
    
    @IBAction func gyeonggiButtonTapped(_ sender: UIButton) {
        seoulButtonIsSelect = false
        
    }
    
    
    
    
}

@IBDesignable
extension UITextField {
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable
    var borderRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil}
            return UIColor(cgColor: color)
        }
    }
}
