/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class SquareCircleModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var color: Color = Color.BLACK
    @Publish
    var bgColor: Color = Color.WHITE

    @Publish
    var duration: Int32 = 600
    public func setSize(size: Float64): SquareCircleModel {
        this.size = size
        return this
    }
    public func setColor(color: Color): SquareCircleModel {
        this.color = color
        return this
    }
    public func setBgColor(bgColor: Color): SquareCircleModel {
        this.bgColor = bgColor
        return this
    }
    public func setDuration(duration: Int32): SquareCircleModel {
        this.duration = duration
        return this
    }
}

@Component
public class SquareCircle {
    @State
    var model: SquareCircleModel = SquareCircleModel()

    @State
    var size: Float64 = 50.0

    @State
    var radiusValue: Float64 = 0.0

    @State
    var rotateValue: Float64 = 0.0

    @State
    var scaleValue: Float64 = 1.0

    var animatorResult1: ?AnimatorResult = None
    var animatorResult2: ?AnimatorResult = None
    var animatorResult3: ?AnimatorResult = None
    protected override func aboutToAppear() {
        size = this.model.size
        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.radiusValue = value
        }
        animatorResult1().play()

        animatorResult2 = AnimatorResult(setAnimatorOption2())
        animatorResult2().onframe = {
            value: Float64 => this.rotateValue = value
        }
        animatorResult2().play()

        animatorResult3 = AnimatorResult(setAnimatorOption3())
        animatorResult3().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult3().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
        if (let Some(animator2) <- animatorResult2) {
            animator2.finish()
        }
    }
    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: this.size / 2.0
        )
        return option
    }
    func setAnimatorOption2(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: 90.0
        )
        return option
    }
    func setAnimatorOption3(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.5
        )
        return option
    }
    func build() {
        Row() {
            Stack(Alignment.Center) {
                Rect(width: this.size, height: this.size).fill(this.model.color).radius(this.radiusValue).rotate(
                    Float32(this.rotateValue)).scale(Float32(this.scaleValue))
                //                    .rotateY(Float32(this.rotateValue1))
            }
        }.width(this.size).height(this.size)
    }
}
