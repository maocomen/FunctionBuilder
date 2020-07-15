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
struct StringBuilder {
    
    typealias Component = [String]
    typealias Expression = String
    
    static func buildBlock(_ components: Component...) -> Component {
        components.flatMap{ $0 }
    }
    
    static func buildExpression(_ text: Expression) -> Component {
        [text]
    }

    static func buildExpression(_ num: Int) -> Component {
        ["\(num)"]
    }

    static func buildExpression(_ float: Double) -> Component {
        ["\(float)"]
    }

    static func buildEither(first: Component) -> Component {
        first
    }

    static func buildEither(second: Component) -> Component {
        second
    }
    
    static func buildIf(_ component: Component?) -> Component {
        component ?? []
    }
    
    static func buildDo(_ components: [Component]) -> Component {
        components.flatMap({ $0 })
    }
    
    static func buildArray(_ array: [Component]) -> Component {
        array.flatMap({ $0 })
    }
}

extension String {
    init(separator: String, @StringBuilder builder: () -> [String]) {
        self = builder().joined(separator: separator)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(
            String(separator: "-") {
                "hello"
                "we are usiong"
                "function builders"
                for name in ["zhang", "wang", "li", "zhao"] {
                    "hello"
                    name
                }
            }
        )
        // Do any additional setup after loading the view.
    }


}

