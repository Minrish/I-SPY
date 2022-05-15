//
//  Classifier.swift
//  I Spy
//
//  Created by Bert Yan on 4/16/22.
//

import CoreML
import Vision
import CoreImage
import AVFoundation

struct Classifier {

    private(set) var results: String?

    mutating func detect(ciImage: CIImage) {

        guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model)
        else {
            return
        }

        let request = VNCoreMLRequest(model: model)

        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])

        try? handler.perform([request])

        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }

        parserValue(results: results)

    }


    mutating func parserValue (results: [VNClassificationObservation]) {
        if let firstResult = results.first {
            let formatted = String(format: "%.2f", firstResult.confidence * 100)
            self.results = "\(firstResult.identifier) with \(formatted)% possibility"
            
            // Text-to-Speech
            let utterance = AVSpeechUtterance(string: firstResult.identifier)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
    }

}

