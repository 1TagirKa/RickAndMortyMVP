//
//  AppInfoViewController.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var presenter: AppInfoPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setCharacterCount()
        letsGoButton.layer.cornerRadius = 15
    }
    
    @IBAction func letsGoButtonPressed(_ sender: Any) {
        let characterListVC = ModuleBuilder.createCharacterListModule()
        characterListVC.modalPresentationStyle = .fullScreen
        present(characterListVC, animated: true)
    }
}

extension AppInfoViewController: IAppInfoView {
    func successFetchingCharacterCount() {
        countLabel.text = "\(presenter.characterCount ?? 0) characters"
    }
    
    func failureFetchingData(error: Error) {
        print(error)
    }
    
}
