/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class DoubleBounceModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    @Publish
    var duration: Int32 = 1000
    public func setSize(size: Float64): DoubleBounceModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): DoubleBounceModel {
        if (colors.size > 0) {
            this.colors = colors
        }
        return this
    }

    public func setDuration(duration: Int32): DoubleBounceModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): DoubleBounceModel {
        this.shapeStyle = shapeStyle
        return this
    }
}

@Component
public class DoubleBounce {
    @State
    var model: DoubleBounceModel = DoubleBounceModel()
    @State
    var scaleValue: Float64 = 0.0

    var animatorResult: ?AnimatorResult = None
    protected override func aboutToAppear() {
        animatorResult = AnimatorResult(setAnimatorOption())
        animatorResult().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func setAnimatorOption(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }
    func build() {
        Stack(Alignment.Center) {
            if (this.model.shapeStyle == ShapeStyle.RECT) {
                Rect(width: this.model.size, height: this.model.size).fill(this.model.colors[0]
                ).scale(Float32(abs(1.0 - this.scaleValue)))
                Rect(width: this.model.size, height: this.model.size).fill(this.model.colors[1 % this.model.colors.size]
                ).scale(Float32(abs(scaleValue)))
            } else {
                Circle(width: this.model.size, height: this.model.size).fill(
                    this.model.colors[0]).scale(Float32(abs(1.0 - this.scaleValue)))
                Circle(width: this.model.size, height: this.model.size).fill(
                    this.model.colors[1 % this.model.colors.size]).scale(Float32(abs(scaleValue)))
            }
        }.width(this.model.size).height(this.model.size)
    }
}
