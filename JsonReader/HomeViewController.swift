//
//  ViewController.swift
//  JsonReader
//
//  Created by Maxime on 07/12/2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class HomeViewController: UIViewController, UIDocumentPickerDelegate,UINavigationControllerDelegate {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
    }
          

    public func documentMenu(documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    func selectFiles() {
        let types = UTType.types(tag: "json",
                                 tagClass: UTTagClass.filenameExtension,
                                 conformingTo: nil)
        let documentPickerController = UIDocumentPickerViewController(
            forOpeningContentTypes: types)
        documentPickerController.delegate = self
        self.present(documentPickerController, animated: true, completion: nil)
    }
    
    @objc func buttonTapped() {
   selectFiles()
    }
    
    
    private func addButton() {
    let mainButton = UIButton()
    mainButton.translatesAutoresizingMaskIntoConstraints=false
        mainButton.addTarget (self, action: #selector (self.buttonTapped), for: . touchUpInside)
        mainButton.setTitle("select JSON", for: .normal)
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        mainButton.backgroundColor  = .gray
        mainButton.layer.cornerRadius = CGFloat(20)
        mainButton.titleLabel?.numberOfLines = 0
        
    view.addSubview(mainButton)
        
    let horizontalCenter = NSLayoutConstraint (item: mainButton, attribute: .centerX, relatedBy: .equal, toItem: view,
    attribute: .centerX, multiplier: 1.0, constant: 0)
    let verticalCenter = NSLayoutConstraint (item: mainButton, attribute: .centerY, relatedBy: .equal, toItem: view,
    attribute: .centerY, multiplier: 1.0, constant: 0)
    let width = NSLayoutConstraint (item: mainButton, attribute: .width, relatedBy: .equal, toItem: nil,
    attribute: .width, multiplier: 1.0, constant: 100)
    let height = NSLayoutConstraint (item: mainButton, attribute: .height, relatedBy: .equal, toItem: nil,
    attribute: .height, multiplier: 1.0, constant: 75)
    let constraints: [NSLayoutConstraint] = [horizontalCenter, verticalCenter, width, height]
    NSLayoutConstraint.activate(constraints)
    }
}

