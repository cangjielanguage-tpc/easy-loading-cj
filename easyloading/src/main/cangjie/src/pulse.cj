/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class PulseModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var angle: Float64 = 90.0

    @Publish
    var color: Color = Color.RED


    @Publish
    var duration: Int32 = 1000
    public func setSize(size: Float64): PulseModel {
        this.size = size
        return this
    }
    public func setColor(colors: Color): PulseModel {
        this.color = color
        return this
    }

    public func setDuration(duration: Int32): PulseModel {
        this.duration = duration
        return this
    }


}

@Component
public class Pulse {
    @State
    var size: Float64 = 50.0

    @State
    var model: PulseModel = PulseModel()
    @State
    var scaleValue: Float64 = 1.0
    var animatorResult: ?AnimatorResult = None
    protected override func aboutToAppear() {
        size = this.model.size
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
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }
    func build() {
        Row() {
            Stack(Alignment.Center) {
                Rect(width: this.size, height: this.size).fill(this.model.color).scale(
                    Float32(abs(1.0 - this.scaleValue))).opacity(this.scaleValue)
            }
        }.width(this.size).height(this.size)
    }
}
