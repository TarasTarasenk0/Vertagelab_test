//
//  MapCell.swift
//  Vertagelab_test
//
//  Created by md760 on 20.01.2021.
//

import UIKit

final class MapCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var placeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        placeTitle.text = ""
    }
    
    func configure(_ place: Place?) {
        guard let placeId = place?.id else { return }
        guard let placeName = place?.name else { return }
        placeTitle.text = "\(placeId).\(placeName)"
        
    }
    
}
