//
//  CharacterTableViewController.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import UIKit

class CharacterTableViewController: UIViewController {

    @IBOutlet weak var tableOfCharacters: UITableView!
    
    
    var presenter: CharacterListPresenter!
    var characters: [MovieCharacter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setCharactersOnPage(1)
        setupTableView()
    }
    
    private func setupTableView() {
        tableOfCharacters.dataSource = self
        tableOfCharacters.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.reuseId)
    }
}

//MARK: - ICharacterListView
extension CharacterTableViewController: ICharacterListView {
    func setCharacters() {
        characters = presenter.characters
        tableOfCharacters.reloadData()
    }
    
    func failureFetching(error: Error) {
        print(error)
    }
    
}

extension CharacterTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = characters?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let characters = characters else { return UITableViewCell()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseId, for: indexPath) as? CharacterTableViewCell else { fatalError("Something wrong here,  oooops") }
        cell.configure(with: characters[indexPath.row])
        return cell
    }
    
    
}

