//
//  Colors.swift
//  UIContextMenuInteractionExample
//
//  Created by Domo on 12/11/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit

enum Data {

    static let colors: [UIColor] = {
           return [
            .systemGray, .systemRed, .systemBlue,
            .systemPink, .systemGreen, .systemIndigo,
            .systemTeal, .systemYellow, .systemPurple,
            .systemGray, .systemRed, .systemBlue,
            .systemPink, .systemGreen, .systemIndigo,
            .systemTeal, .systemYellow, .systemPurple
            ].shuffled()
       }()
    
}
