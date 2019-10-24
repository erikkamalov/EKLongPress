//
//  The MIT License (MIT)
//
//  Copyright (c) 2019 Erik Kamalov <ekamalov967@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public typealias EKContextMenu = EKContextMenuBuilder
public typealias Selected      = (_ item:EKItem) -> Void

public enum ItemsAling {
    case top,bottom,center
}

public struct EKContextMenuBuilder {
    var appearance:EKLongPressAppearance
    var aling:ItemsAling
    var items:[EKItem]
    var debug:Bool
    internal var selectedItem:Selected?
    public init(items: [EKItem], aling:ItemsAling = .center, selectedItem: ((_ item:EKItem) -> Void)? , debug:Bool = false) {
        self.items        = items
        self.appearance   = .init()
        self.aling        = aling
        self.selectedItem = selectedItem
        self.debug = debug
    }
    
    public mutating func setAling(aling:ItemsAling) {
        self.aling = aling
    }
    public mutating func setAppearance(appearance: EKLongPressAppearance) {
        self.appearance = appearance
    }
}

extension EKContextMenuBuilder{
   public func buildGesture() -> EKContextMenuGesture {
        precondition(items.count > 0, "items is empty")
        return EKContextMenuGesture(builder:self)
    }
}
