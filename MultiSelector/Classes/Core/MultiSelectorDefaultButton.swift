//
//  MultiSelector.swift
//  MultiSelector
//
//  Created by Meng Li on 2019/06/10.
//  Copyright © 2018 XFLAG. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

private extension UIColor {
    static let light = UIColor(white: 235.0 / 255, alpha: 1)
    static let mid = UIColor(white: 135.0 / 255, alpha: 1)
    static let dark = UIColor(white: 34.0 / 255, alpha: 1)
}

extension String: MultiSelectorModel {
    public var title: String {
        return self
    }
}

public class MultiSelectorDefaultButton: MultiSelectorButton {
    
    public required init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        backgroundColor = .light
        setTitleColor(.dark, for: .normal)
        setTitleColor(.mid, for: .highlighted)
        setTitleColor(.mid, for: .disabled)
        setTitleColor(.white, for: .selected)
        setTitleColor(.mid, for: [.selected, .highlighted])
        setTitleColor(.mid, for: [.selected, .disabled])
        titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        
        layer.masksToBounds = true
    }

    public override func configure(model: MultiSelectorModel?) {
        setTitle(model?.title, for: .normal)
    }
    
    public override var bounds: CGRect {
        didSet {
            guard bounds != .zero else {
                return
            }
            
            layer.cornerRadius = bounds.height / 2
        }
    }

    public override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .dark : .light
        }
    }
    
}
