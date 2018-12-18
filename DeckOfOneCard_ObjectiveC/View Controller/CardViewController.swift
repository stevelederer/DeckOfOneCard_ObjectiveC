//
//  CardViewController.swift
//  DeckOfOneCard_ObjectiveC
//
//  Created by Steve Lederer on 12/18/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCard()        
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        drawCard()
    }
    
    func drawCard() {
        SHLCardController.drawCard { (card) in
            guard let card = card else { return }
            SHLCardController.fetchCardImage(with: card, completion: { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
        
    }
    
}
