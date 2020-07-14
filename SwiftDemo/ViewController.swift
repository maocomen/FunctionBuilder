//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 马鑫 on 2020/6/8.
//  Copyright © 2020 马鑫. All rights reserved.
//

import UIKit

@_functionBuilder
struct AttributedStringBuilder {
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let result = NSMutableAttributedString(string: "")
        components.forEach(result.append)
        return result
    }

    static func buildBlock(_ strings: String...) -> NSAttributedString {
        let result = NSMutableString(string: "")
        strings.forEach(result.append)
        return NSAttributedString(string: result as String)
    }
    
    static func buildIf(_ strings: String...) -> NSAttributedString {
        let result = NSMutableString(string: "")
        strings.forEach(result.append)
        return NSAttributedString(string: result as String)
    }
    
    static func buildExpression(_ text: String) -> String {
        text
    }
    
    static func buildExpression(_ image: UIImage) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        return NSAttributedString(attachment: attachment)
    }

    static func buildExpression(_ attr: NSAttributedString) -> NSAttributedString {
        attr
    }

}

extension NSAttributedString {
    func withAttributes(_ attrs: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        copy.addAttributes(attrs, range: NSRange(location: 0, length: string.count))
        return copy
    }
}

extension NSAttributedString {
    convenience init(@AttributedStringBuilder builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}

@_functionBuilder
struct TestBuilder {
    
    static func buildBlock(_ strings: String...) -> String {
        return strings.joined(separator: "\n")
    }
    
    static func buildExpression(_ text: String) -> String {
        text
    }
    
    static func buildExpression(_ num: Int) -> String {
        "\(num)"
    }

    static func buildEither(first: String) -> String {
        "[1-\(first)]"
    }

    static func buildEither(second: String) -> String {
        "[2-\(second)]"
    }
    
    static func buildIf(_ string: String?) -> String {
        "[if-\(string ?? "")]"
    }
    
    static func buildDo(_ strings: String...) -> String {
        strings.joined(separator: "\n")
    }
}

extension String {
    init(@TestBuilder builder: () -> String) {
        self.init(stringLiteral: builder())
    }
}

class ViewController: UIViewController {

    enum TestType {
        case one, two, three, four, five, six, seven, eight, nine, ten
    }
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = String {
            "222"
            "444"
        }
        print(text)
        // Do any additional setup after loading the view.
    }


}

