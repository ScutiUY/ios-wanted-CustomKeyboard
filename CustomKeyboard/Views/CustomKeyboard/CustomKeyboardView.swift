//
//  CustomKeyboardView.swift
//  CustomKeyboard
//
//  Created by 효우 on 2022/07/12.
//

import UIKit

protocol KeyboardInfoReceivable {
    func customKeyboardView(pressedKeyboardButton: UIButton)
    func customKeyboardView(pressedDeleteButton: UIButton)
}

class CustomKeyboardView: UIView {

    var delegate: KeyboardInfoReceivable?

    private var isShiftPressed = false
    
    @IBOutlet weak var qButton: UIButton!
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var rButton: UIButton!
    @IBOutlet weak var tButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var uButton: UIButton!
    @IBOutlet weak var iButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var pButton: UIButton!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var sButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var jButton: UIButton!
    @IBOutlet weak var kButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    
    @IBOutlet weak var shiftButton: UIButton!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var vButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var nButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    
    @IBAction func keyboardPressed(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        changeDoubleChar()
        if isShiftPressed {
            isShiftPressed.toggle()
            changeDoubleChar()
        }
        delegate.customKeyboardView(pressedKeyboardButton: sender)
    }
    
    
    @IBAction func pressShiftButton(_ sender: UIButton) {
        isShiftPressed.toggle()
        changeDoubleChar()
    }
    
    private func changeDoubleChar() {
        
        if isShiftPressed {
            qButton.setTitle("ㅃ", for: .normal)
            wButton.setTitle("ㅉ", for: .normal)
            eButton.setTitle("ㄸ", for: .normal)
            rButton.setTitle("ㄲ", for: .normal)
            tButton.setTitle("ㅆ", for: .normal)
            oButton.setTitle("ㅒ", for: .normal)
            pButton.setTitle("ㅖ", for: .normal)
            shiftButton.isSelected = isShiftPressed
            shiftButton.setImage(UIImage(systemName: "shift.fill"), for: .normal)
        } else {
            qButton.setTitle("ㅂ", for: .normal)
            wButton.setTitle("ㅈ", for: .normal)
            eButton.setTitle("ㄷ", for: .normal)
            rButton.setTitle("ㄱ", for: .normal)
            tButton.setTitle("ㅅ", for: .normal)
            oButton.setTitle("ㅐ", for: .normal)
            pButton.setTitle("ㅔ", for: .normal)
            shiftButton.isSelected = isShiftPressed
            shiftButton.setImage(UIImage(systemName: "shift"), for: .normal)
        }
        self.layoutIfNeeded()
    }
    
    @IBAction func pressDeleteButton(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.customKeyboardView(pressedDeleteButton: sender)
    }
    
}