//
//  GuessPanelVC.swift
//  Guess Number 1
//
//  Created by Yavuz Güner on 5.04.2022.
//

import UIKit

class GuessPanelVC: UIViewController {


    @IBOutlet weak var labelRemainingRight: UILabel!
    
    @IBOutlet weak var labelHelp: UILabel!
    
    @IBOutlet weak var textData: UITextField!
    
    //Önce bize rastgele sayı oluşturmamız lazım
    
    var randomNumber: Int?
    var remainingRight = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNumber = Int.random(in: 0...100)  //0 ile 100 arasında sayı üretiyor.
        print("Oluşan rastgele sayı:\(randomNumber!)")
    }
    
    //Geçişi dinleme metodu oluşturucaz. Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let comesData = sender as? Bool {
            let goToVC = segue.destination as! ResultPanelVC
            
            goToVC.result = comesData
        }
    }
    
    
    @IBAction func guessButton(_ sender: Any) {
        
        labelHelp.isHidden = false
        remainingRight = remainingRight - 1
        
        //String ifade dönüşümü yaparken bunu yapacaz.
        if let guess = Int(textData.text!){
            
            if remainingRight != 0 {
                
                if guess == randomNumber! {
                    //Doğru sonuçtur. Sayfa geçişi yapılır.
                    let result = true
                    performSegue(withIdentifier: "guessToResult", sender: result)
                    return
                }
                
                if guess > randomNumber! {
                    labelHelp.text = "Down"
                    labelRemainingRight.text = "Remaining Right : \(remainingRight)"
                }
                if guess < randomNumber! {
                    labelHelp.text = "Up"
                    labelRemainingRight.text = "Remaining Right : \(remainingRight)"
                }
                
                if(remainingRight == 0) {
                    let result = false
                    performSegue(withIdentifier: "guessToResult", sender: result)
                }
            }
        }
        textData.text = ""
    }
    
}
