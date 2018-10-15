//
//  ViewController.swift
//  greedy
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 14/10/2018.
//  Copyright © 2018 Djorkaeff Alexandre Vilela Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coin_change = CoinChange(coinSet: [1, 5, 10, 25, 50, 100])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var lblChanged: UILabel!
    @IBOutlet weak var toChange: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeCoins(_ sender: Any) {
        lblChanged.text = coin_change.changeGreedy(Int(toChange.text!)!).description
    }
    
}

