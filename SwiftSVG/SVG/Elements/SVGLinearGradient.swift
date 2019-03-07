//
//  SVGLinearGradient.swift
//  SwiftSVG
//
//  Created by Quentin Fasquel on 06/03/2019.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

final class SVGLinearGradient: SVGElement {
    internal static var elementName: String = "linearGradient"
    
    internal var supportedAttributes: [String : (String) -> ()] = [:]
    
    internal func didProcessElement(in container: SVGContainerElement?) {
        
    }
}
