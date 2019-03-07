//
//  SVGRadialGradient.swift
//  SwiftSVG
//
//  Created by Quentin Fasquel on 06/03/2019.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

final class SVGRadialGradient: SVGElement {
    internal static var elementName: String = "radialGradient"
    
    internal var supportedAttributes: [String : (String) -> ()] = [:]
    
    internal func didProcessElement(in container: SVGContainerElement?) {
        
    }
    
    internal var c: CGPoint = .zero
    internal var f: CGPoint = .zero
    internal var r: CGFloat = 0
    // gradientUnits ?
    // gradientTransform ?
    
    internal func cx(cx: String) {
        guard let cx = CGFloat(cx) else {
            return
        }
        c.x = cx
    }
    
    internal func cy(cy: String) {
        guard let cy = CGFloat(cy) else {
            return
        }
        c.y = cy
    }
    
    internal func fx(fx: String) {
        guard let fx = CGFloat(fx) else {
            return
        }
        f.x = fx
    }
    
    internal func fy(fy: String) {
        guard let fy = CGFloat(fy) else {
            return
        }
        f.y = fy
    }
    
    internal func radius(radius: String) {
        guard let radius = CGFloat(radius) else {
            return
        }
        r = radius
    }
}
