//
//  ResultPanelVC.swift
//  Guess Number 1
//
//  Created by Yavuz Güner on 5.04.2022.
//

import UIKit

class ResultPanelVC: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    var result : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(result!)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Result Sceen"
        
        if result! {
            labelResult.text = "You Won"
            imageResult.image = UIImage(named: "happyface")
        }else {
            labelResult.text = "You Lost"
            imageResult.image = UIImage(named: "unhappyface")
        }
        
    }
    @IBAction func againButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
