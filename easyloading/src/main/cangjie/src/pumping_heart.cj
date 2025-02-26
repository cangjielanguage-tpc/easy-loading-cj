/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class PumpingHeartModel {
    @Publish
    var size: Float64 = 120.0
    @Publish
    var color: Color = Color.RED
    @Publish
    var duration: Int32 = 600
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    public func setSize(size: Float64): PumpingHeartModel {
        this.size = size
        return this
    }
    public func setColor(color: Color): PumpingHeartModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): PumpingHeartModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): PumpingHeartModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class PumpingHeart {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    @Publish
    var size: Float64 = 120.0

    @State
    var model: PumpingHeartModel = PumpingHeartModel()

    @State
    var scale: Float32 = 0.0

    protected override func aboutToAppear(): Unit {
        this.size = this.model.size

        showPlay()
    }

    func showPlay(): Unit {
        let animatorResult = AnimatorResult(setAnimatorOption(1.0, 1.25, 0))
        animatorResult.onframe = {
            value: Float64 => this.scale = Float32(value)
        }
        animatorResult.play()
    }

    func setAnimatorOption(start: Float64, end: Float64, delay: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in",
            delay: delay,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.AlternateReverse,
            iterations: -1,
            begin: start,
            end: end
        )
        return option
    }

    func build() {
        Column() {
            Stack(Alignment.Center) {
                Canvas(this.context)
                    .width(this.size)
                    .height(this.size)
                    .onReady(
                        {
                            =>
                            var heartPath = Path2D()
                            heartPath.moveTo(this.size * 0.5, this.size * 0.35)
                            heartPath.bezierCurveTo(this.size * 0.2, this.size * 0.1, this.size * 0.1, this.size * 0.4,
                                this.size * 0.5, this.size * 0.8,)
                            heartPath.bezierCurveTo(this.size * 0.9, this.size * 0.4, this.size * 0.8, this.size * 0.1,
                                this.size * 0.5, this.size * 0.35,)
                            heartPath.closePath()
                            context.fillStyle(this.model.color)
                            context.stroke(heartPath)
                        }
                    )
                    .scale(this.scale)
            }
        }.width(this.size).height(this.size)
    }
}
