//
//  CharacterTableViewCell.swift
//  RickAndMortyMVP
//
//  Created by Tagir Kabirov on 05.06.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    //MARK: - Reuse Identifier
    static let reuseId = "CharacterCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var characterImage: CharacterImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        characterImage.layer.cornerRadius = characterImage.frame.height / 2
        characterImage.contentMode = .scaleToFill
    }
}

extension CharacterTableViewCell: IConfigurableView {
    func configure(with model: MovieCharacter) {
        characterNameLabel.text = model.name
        characterImage.fetchImage(from: model.image)
    }
}
