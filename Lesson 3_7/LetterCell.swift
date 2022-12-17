//
//  LetterCell.swift
//  Lesson 3_7
//
//  Created by Atai Begaliev on 8/12/22.
//

import Foundation
import UIKit

class LetterCell: UICollectionViewCell {
    @IBOutlet weak var letterLabelCar: UILabel!
    override func layoutSubviews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
    }
}

class WordCell: UICollectionViewCell {
    @IBOutlet weak var wordLetterLabelCar1: UILabel!
    override func layoutSubviews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
    }
}
