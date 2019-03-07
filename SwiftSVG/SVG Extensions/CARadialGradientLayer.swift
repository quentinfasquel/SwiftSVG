import UIKit

public final class CARadialGradientLayer: CALayer {
//  override func draw(in ctx: CGContext) {
//    ctx.saveGState()
//
//    let colorSpace = CGColorSpaceCreateDeviceRGB()
//    var locations = [CGFloat]()
//    for i in 0...colors.count-1 {
//      locations.append(CGFloat(i) / CGFloat(colors.count))
//    }
//    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
//    let center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
//    let radius = min(bounds.width / 2.0, bounds.height / 2.0)
//    ctx.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
//  }

    private let colorSpace = CGColorSpaceCreateDeviceRGB()

    public var startCenter: CGPoint = .zero {
        didSet { setNeedsDisplay() }
    }

    public var startRadius: CGFloat = 0.0 {
        didSet { setNeedsDisplay() }
    }

    public var endCenter: CGPoint? {
        didSet { setNeedsDisplay() }
    }

    public var endRadius: CGFloat? {
        didSet { setNeedsDisplay() }
    }

    public var colors: [CGColor]? {
        didSet { setNeedsDisplay() }
    }

    public var locations: [CGFloat]? {
        didSet { setNeedsDisplay() }
    }
    
    
    public override required init() {
        super.init()
        self.needsDisplayOnBoundsChange = true
    }
    
//    public override convenience init(layer: Any) {
//        guard let c = layer as? CARadialGradientLayer else {
//            fatalError()
//        }
//
//        self.init(center: c.center, radius: c.radius, colors: c.colors)
//    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    super.init(coder: aDecoder)
//    self.needsDisplayOnBoundsChange = true
//  }

    public override func draw(in ctx: CGContext) {
        guard let colors = colors, var locations = locations, colors.count == locations.count else {
            return
        }

        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: &locations) else {
            return
        }

        ctx.saveGState()
        ctx.drawRadialGradient(
            gradient,
            startCenter: startCenter,
            startRadius: startRadius,
            endCenter: endCenter ?? startCenter,
            endRadius: endRadius ?? startRadius,
            options: [])
    }
}
