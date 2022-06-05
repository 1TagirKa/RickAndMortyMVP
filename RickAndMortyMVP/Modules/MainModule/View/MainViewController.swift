//
//  MainViewController.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 04.06.2022.
//

import UIKit

class MainViewController: UIViewController, IMainView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var actionLabel: UILabel!
    
    //MARK: = presenter
    var presenter: MainPresenterProtocol!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeLabel()
    }
    
    //MARK: - Private Functions
    private func customizeLabel() {
        actionLabel.adjustsFontSizeToFitWidth = true
        actionLabel.text = "Click to search".uppercased()
        actionLabel.textColor = UIColor(red: 104/255, green: 187/255, blue: 66/255, alpha: 1)
    }
    
    @IBAction func transactionButtonPressed(_ sender: Any) {
        let appInfoVC = ModuleBuilder.createAppInfoModule()
        present(appInfoVC, animated: true)
    }
}
