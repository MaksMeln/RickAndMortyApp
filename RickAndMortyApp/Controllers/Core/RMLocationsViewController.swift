//
//  RMLocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Максим Мельничук on 30.03.23.
//

import UIKit

final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
       }

       private func addSearchButton() {
           navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
       }

       @objc private func didTapSearch() {

    }
}
