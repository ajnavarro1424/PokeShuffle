//
//  Pokemon.swift
//  PokeShuffle
//
//  Created by Alex Navarro on 1/6/23.
//

import Foundation
import SwiftUI

class Pokemon {

    static let current = Pokemon()

    var name: String?
    var imageURL: URL?
    var image: Image?

    init(name: String? = nil, imageURL: URL? = nil) {
        self.name = name
        self.imageURL = imageURL
    }

    static var currentName: String {
        guard let name = Pokemon.current.name else {
            fatalError("Pokemon name nil")
        }
        return name
    }

    static var currentImageURL: URL {
        guard let url = Pokemon.current.imageURL else {
            fatalError("Pokemon url nil")
        }
        return url
    }

    static var currentImage: Image {
        guard let image = Pokemon.current.image else {
            fatalError("Pokemon image nil")
        }
        return image
    }

}
