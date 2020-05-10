//
//  ViewController.swift
//  Morpion
//
//  Created by Solo on 08/05/2020.
//  Copyright © 2020 CopySolo_. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aQuiLeTourLabel: UILabel!
    @IBOutlet weak var bouton1: UIButton!
    @IBOutlet weak var bouton2: UIButton!
    @IBOutlet weak var bouton3: UIButton!
    @IBOutlet weak var bouton4: UIButton!
    @IBOutlet weak var bouton5: UIButton!
    @IBOutlet weak var bouton6: UIButton!
    @IBOutlet weak var bouton7: UIButton!
    @IBOutlet weak var bouton8: UIButton!
    @IBOutlet weak var bouton9: UIButton!
    
    var cercle = true
    var boutons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ajusterAQuiLeTourLabel()
        bouton1.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton2.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton3.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton4.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton5.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton6.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton7.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton8.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        bouton9.setImage(#imageLiteral(resourceName: "help"), for: .normal)
        boutons = [bouton1, bouton2, bouton3, bouton4, bouton5, bouton6, bouton7, bouton8, bouton9]
    }
    
    @IBAction func boutonAppuye(_ sender: Any) {
        guard let bouton = sender as? UIButton, bouton.image(for: .normal) == #imageLiteral(resourceName: "help") else { return }
        if cercle {
            bouton.setImage(#imageLiteral(resourceName: "Circle"), for: .normal)
        } else {
            bouton.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
        }
        
        verifierSiOnAGagne()
        
    }
    
    func ajusterAQuiLeTourLabel() {
        if cercle {
            aQuiLeTourLabel.text = "Au tour du joueur 1"
        } else {
            aQuiLeTourLabel.text = "Au tour du joueur 2"
        }
    }
    
    func verifierSiOnAGagne() {
        if (bouton1.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton1.image(for: .normal) == bouton2.image(for: .normal) && bouton1.image(for: .normal) == bouton3.image(for: .normal)) ||
            (bouton4.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton4.image(for: .normal) == bouton5.image(for: .normal) && bouton4.image(for: .normal) == bouton6.image(for: .normal)) ||
            (bouton7.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton7.image(for: .normal) == bouton8.image(for: .normal) && bouton7.image(for: .normal) == bouton9.image(for: .normal)) ||
            (bouton1.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton1.image(for: .normal) == bouton4.image(for: .normal) && bouton1.image(for: .normal) == bouton7.image(for: .normal)) ||
            (bouton2.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton2.image(for: .normal) == bouton5.image(for: .normal) && bouton2.image(for: .normal) == bouton8.image(for: .normal)) ||
            (bouton3.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton3.image(for: .normal) == bouton6.image(for: .normal) && bouton3.image(for: .normal) == bouton9.image(for: .normal)) ||
            (bouton1.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton1.image(for: .normal) == bouton5.image(for: .normal) && bouton1.image(for: .normal) == bouton9.image(for: .normal)) ||
            (bouton3.image(for: .normal) != #imageLiteral(resourceName: "help") && bouton3.image(for: .normal) == bouton5.image(for: .normal) && bouton3.image(for: .normal) == bouton7.image(for: .normal)) {
            if cercle {
                montrerGagnant(titre: "GAGNE", joueur: "Joueur 1")
            } else {
                montrerGagnant(titre: "GAGNE", joueur: "Joueur 2")
            }
        } else {
            if verifierSiMouvementDisponible() {
                if cercle {
                    cercle = false
                } else {
                    cercle = true
                }
                ajusterAQuiLeTourLabel()
            } else {
                montrerGagnant(titre: "PERDU", joueur: "Aucun joueur")
            }
            
        }
    }
    
    func verifierSiMouvementDisponible() -> Bool {
        for bouton in boutons {
            if bouton.image(for: .normal) == #imageLiteral(resourceName: "help") {
                return true
            }
        }
        return false
    }
    
    func montrerGagnant(titre: String, joueur: String) {
        let alerte = UIAlertController(title: titre, message: joueur + " a gagné!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            for bouton in self.boutons {
                bouton.setImage(#imageLiteral(resourceName: "help"), for: .normal)
            }
            self.cercle = true
            self.ajusterAQuiLeTourLabel()
        }
        alerte.addAction(ok)
        present(alerte, animated: true, completion: nil)
    }
    
    
    
    
    
    
}







