//
//  SelectPhotoView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI
import PhotosUI

struct SelectPhotoView: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: SelectPhotoView

        init(_ parent: SelectPhotoView) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            defer {
                picker.dismiss(animated: true)
            }
            
            guard let provider = results.first?.itemProvider else {
                return
            }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
