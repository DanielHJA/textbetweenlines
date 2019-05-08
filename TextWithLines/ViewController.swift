//
//  ViewController.swift
//  TextWithLines
//
//  Created by Daniel Hjärtström on 2019-04-03.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var enclosedText: EnclosedTextBetweenLines = {
        let temp = EnclosedTextBetweenLines(text: "eller")
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temp.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        temp.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        enclosedText.isHidden = false
    }


}

