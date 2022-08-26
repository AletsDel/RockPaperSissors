//
//  ViewController.swift
//  RockPaperSissors
//
//  Created by Alejandro Delgado Osio on 18/08/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var waterPok: UIButton!
    @IBOutlet weak var grassPok: UIButton!
    @IBOutlet weak var firePok: UIButton!
    @IBOutlet weak var yourSelection: UIImageView!
    @IBOutlet weak var rematchButton: UIButton!
    @IBOutlet weak var opponentSelection: UIImageView!
    @IBOutlet weak var Draw: UIImageView!
    @IBOutlet weak var youLose: UIImageView!
    @IBOutlet weak var youWin: UIImageView!
    @IBOutlet weak var trainerLabel: UILabel!
    @IBOutlet weak var CPULabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    let charmander = #imageLiteral(resourceName: "charmander.png")
    let bulbasaur = #imageLiteral(resourceName: "bulbasaur.png")
    let squirtle = #imageLiteral(resourceName: "squirtle.png")
    let pokeball = #imageLiteral(resourceName: "pokeball.png")
    
    var trainerScore = 0
    var cpuScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*@IBAction func tappedButton(_ sender: UIButton) {
        yourSelection.image = sender.currentImage
        
        //show rematch button
        rematchButton.isHidden = false
        
        //hide pokemon
        waterPok.isHidden = true
        grassPok.isHidden = true
        firePok.isHidden = true
        
        print(getWinner(choice: sender.currentImage!))
        
    }*/
    
    @IBAction func tappedReset(_ sender: UIButton){
        CPULabel.text = "0"
        trainerLabel.text = "0"
    }
    
    @IBAction func tappedCharmander(_ sender: UIButton) {
        yourSelection.image = charmander
        
        rematchButton.isHidden = false
        
        //hide pokemon
        waterPok.isHidden = true
        grassPok.isHidden = true
        firePok.isHidden = true
        resetButton.isHidden = true
        
        let result = getWinner(choice: charmander)
        
        switch result {
        case "draw":
            Draw.isHidden = false
        case "lose":
            youLose.isHidden = false
            cpuScore += 1
            CPULabel.text = "\(cpuScore)"
        case "win":
            youWin.isHidden = false
            trainerScore += 1
            trainerLabel.text = "\(trainerScore)"
        default:
            break
        }
        
    }
    
    @IBAction func tappedBulbasaur(_ sender: UIButton) {
        yourSelection.image = bulbasaur
        
        rematchButton.isHidden = false
        
        //hide pokemon
        waterPok.isHidden = true
        grassPok.isHidden = true
        firePok.isHidden = true
        resetButton.isHidden = true
        
        let result = getWinner(choice: bulbasaur)
        
        switch result {
        case "draw":
            Draw.isHidden = false
        case "lose":
            youLose.isHidden = false
            cpuScore += 1
            CPULabel.text = "\(cpuScore)"
        case "win":
            youWin.isHidden = false
            trainerScore += 1
            trainerLabel.text = "\(trainerScore)"
        default:
            break
        }
        
    }
    
    @IBAction func tappedSquirtle(_ sender: UIButton) {
        yourSelection.image = squirtle
        
        rematchButton.isHidden = false
        
        //hide pokemon
        waterPok.isHidden = true
        grassPok.isHidden = true
        firePok.isHidden = true
        resetButton.isHidden = true
        
        let result = getWinner(choice: squirtle)
        
        switch result {
        case "draw":
            Draw.isHidden = false
        case "lose":
            youLose.isHidden = false
            cpuScore += 1
            CPULabel.text = "\(cpuScore)"
        case "win":
            youWin.isHidden = false
            trainerScore += 1
            trainerLabel.text = "\(trainerScore)"
        default:
            break
        }
    }
    
    @IBAction func tappedRematchButton(_ sender: UIButton){
        //hide rematch button
        rematchButton.isHidden = true
        
        //show pokemon
        waterPok.isHidden = false
        grassPok.isHidden = false
        firePok.isHidden = false
        
        yourSelection.image = pokeball
        opponentSelection.image = pokeball
        
        resetButton.isHidden = false
        
        Draw.isHidden = true
        youLose.isHidden = true
        youWin.isHidden = true
        
    }
    
    func getWinner(choice: UIImage) -> String {
        let opponentChoice: [UIImage] = [bulbasaur,squirtle,charmander] //grass,water,fire
        
        let opChoice = opponentChoice.randomElement()
        opponentSelection.image = opChoice
        
        
         switch choice {
         case bulbasaur: //grass
             switch opChoice{
             case bulbasaur: //grass
                 return "draw"
             case charmander: //fire
                 return "lose"
             case squirtle: //water
                 return "win"
             default:
                 return ""
             }
         case charmander: //fire
             switch opChoice{
             case bulbasaur: //grass
                 return "win"
             case charmander: //fire
                 return "draw"
             case squirtle: //water
                 return "lose"
             default:
                 return ""
             }
         case squirtle: //squirtle
             switch opChoice{
             case bulbasaur: //grass
                 return "lose"
             case charmander: //fire
                 return "win"
             case squirtle: //water
                 return "draw"
             default:
                 print("no jalo")

             }
         default:
             return "fallo 1"
         }
         
        
        return "fallo 2"
    }
}

