//
//  ClassificationViewModel.swift
//  I Spy
//
//  Created by Bert Yan on 4/16/22.
//

import SwiftUI

class ClassificationViewModel: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    // Detection utility
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
        
    }
        
}
