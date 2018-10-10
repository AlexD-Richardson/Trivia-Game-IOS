//
//  DifficultyPage.swift
//  Trivia Game
//
//  Created by Alex Richardson on 10/10/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class difficultyPage: UIViewController {

    @IBOutlet weak var regisPhilman: UIImageView!
    
    var difficultyLevel: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func prepare(for segue: UIStoryboardSegue) {
        
        
        if let destination = segue.destination as? ViewController {
            
            destination.arrayChooser = difficultyLevel
            
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func difficultyButtonPressed(_ sender: UIButton) {
        difficultyLevel = sender.tag
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
    }
}
