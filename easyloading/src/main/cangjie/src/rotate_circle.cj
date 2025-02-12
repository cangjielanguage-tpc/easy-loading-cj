/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RotateCircleModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var angle: Float64 = 90.0

    @Publish
    var color: Color = Color.BLACK

    @Publish
    var duration: Int32 = 1200
    public func setSize(size: Float64): RotateCircleModel {
        this.size = size
        return this
    }
    public func setColor(color: Color): RotateCircleModel {
        this.color = color
        return this
    }

    public func setDuration(duration: Int32): RotateCircleModel {
        this.duration = duration
        return this
    }
}

@Component
public class RotateCircle {
    @State
    var model: RotateCircleModel = RotateCircleModel()
    @State
    var size: Float64 = 50.0
    @State
    var rotateValue1: Float64 = 0.0

    var animatorResult1: ?AnimatorResult = None

    protected override func aboutToAppear() {
        size = this.model.size
        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.rotateValue1 = value
        }
        animatorResult1().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
    }
    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 360.0
        )
        return option
    }

    func build() {
        Row() {
            Stack(Alignment.Center) {
                if (this.rotateValue1 >= 180.0) {
                    Circle(width: this.size, height: this.size).fill(this.model.color).rotateY(
                        Float32(this.rotateValue1 - 180.0))
                } else {
                    Circle(width: this.size, height: this.size).fill(this.model.color).rotateX(
                        -Float32(this.rotateValue1))
                }
            }
        }.width(this.size).height(this.size)
    }
}
