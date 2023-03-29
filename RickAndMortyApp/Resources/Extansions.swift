//
//  Extansions.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
