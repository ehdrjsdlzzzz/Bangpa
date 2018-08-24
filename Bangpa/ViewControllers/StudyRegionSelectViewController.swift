//
//  StudyRegionSelectViewController.swift
//  Bangpa
//
//  Created by RAK on 2018. 8. 24..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class StudyRegionSelectViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBAction func dismissButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let origImage = UIImage(named: "Cancel")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        dismissButton.setImage(tintedImage, for: .normal)
//        dismissButton.tintColor = UIColor(red: 142.0, green: 142.0, blue: 142.0, alpha: 1.0)
        dismissButton.tintColor = .lightGray
        
        
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
