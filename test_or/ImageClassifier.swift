//
//  ImageClassifier.swift
//  test_or
//
//  Created by Andrew Mokryj on 05.08.2022.
//

import SwiftUI

class ImageClassifier: ObservableObject {
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
