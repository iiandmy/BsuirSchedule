//
//  GroupSearchField.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 5.06.22.
//

import UIKit

class GroupSearchField: UITextField {
    
    private let viewDelegate: SearchViewDelegate

    init(viewDelegate: SearchViewDelegate) {
        self.viewDelegate = viewDelegate
        super.init(frame: .zero)
        
        makeSettings()
        makeUI()
    }
    
    func makeSettings() {
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeUI() {
        borderStyle = .roundedRect
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension GroupSearchField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text ?? ""
        viewDelegate.processInput(oldText.replacingCharacters(in: Range(range, in: oldText)!, with: string))
        return true
    }
}
