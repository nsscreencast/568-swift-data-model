import Foundation
import SwiftData

@Model
class Artist {
    var name: String
    var isCurrentlyOnTour = false

    @Relationship(deleteRule: .cascade, inverse: \Song.artist)
    var songs: [Song] = []

    init(name: String, isCurrentlyOnTour: Bool = false) {
        self.name = name
        self.isCurrentlyOnTour = isCurrentlyOnTour
    }
}
