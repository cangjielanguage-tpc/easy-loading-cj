/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class PumpingHeartModel {
    @Publish
    var width: Float64 = 120.0
    @Publish
    var height: Float64 = 120.0
    @Publish
    var color: Color = Color.RED
    @Publish
    var duration: Int32 = 600
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    public func setWidth(width: Float64): PumpingHeartModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): PumpingHeartModel {
        this.height = height
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
    @State
    var model: PumpingHeartModel = PumpingHeartModel()

    @State
    var scale: Float32 = 0.0
    @State
    var scale2: Float32 = 0.0

    protected override func aboutToAppear(): Unit {
        showPlay()
    }

    func showPlay(): Unit {
        let animatorResult = AnimatorResult(setAnimatorOption(1.0,1.25, 0))
        animatorResult.onframe = { value: Float64  =>
            this.scale = Float32(value)
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
            Stack() {
                if(this.model.shapeStyle == ShapeStyle.RECT) {
                    Rect()
                    .scale(this.scale)
                    .fill( this.model.color)
                    .width(this.model.width)
                    .height(this.model.height)
                } else {
                    Circle()
                    .scale(this.scale)
                    .fill( this.model.color)
                    .width(this.model.width)
                    .height(this.model.height)
                }

            }

        }.width(100.percent).height(100.percent)

    }
}
