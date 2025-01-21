/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingCubeModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.BLACK]

    @Publish
    var duration: Int32 = 1200
    public func setSize(size: Float64): FadingCubeModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): FadingCubeModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): FadingCubeModel {
        this.duration = duration
        return this
    }
}

@Component
public class FadingCube {
    @State
    var model: FadingCubeModel = FadingCubeModel()
    @State
    var fadeValueArr: ObservedArray<Float64> = ObservedArray<Float64>(1.0, 1.0, 1.0, 1.0)

    var animatorResult1: ?AnimatorResult = None
    var animatorResult2: ?AnimatorResult = None
    var animatorResult3: ?AnimatorResult = None
    var animatorResult4: ?AnimatorResult = None

    protected override func aboutToAppear(): Unit {
        animatorResult1 = AnimatorResult(setAnimatorOption(0))
        animatorResult1().onframe = {
            value: Float64 => this.fadeValueArr[0] = value
        }
        animatorResult1().play()

        animatorResult2 = AnimatorResult(setAnimatorOption(1))
        animatorResult2().onframe = {
            value: Float64 => this.fadeValueArr[1] = value
        }
        animatorResult2().play()

        animatorResult3 = AnimatorResult(setAnimatorOption(2))
        animatorResult3().onframe = {
            value: Float64 => this.fadeValueArr[2] = value
        }
        animatorResult3().play()

        animatorResult4 = AnimatorResult(setAnimatorOption(3))
        animatorResult4().onframe = {
            value: Float64 => this.fadeValueArr[3] = value
        }
        animatorResult4().play()
    }

    protected override func aboutToDisappear() {
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
        if (let Some(animator2) <- animatorResult2) {
            animator2.finish()
        }
        if (let Some(animator3) <- animatorResult3) {
            animator3.finish()
        }
        if (let Some(animator4) <- animatorResult4) {
            animator4.finish()
        }
    }
    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: 450 * idx,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func build() {
        Stack(Alignment.TopStart) {
            Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[0]).fill(
                    this.model.colors[0 % this.model.colors.size])
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[1]).fill(
                    this.model.colors[1 % this.model.colors.size])
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[3]).fill(
                    this.model.colors[3 % this.model.colors.size])
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[2]).fill(
                    this.model.colors[2 % this.model.colors.size])
            }.width(this.model.size)
        }.width(this.model.size).height(this.model.size).rotate(x: 0.0, y: 0.0, z: 1.0, angle: -45.0)
    }
}
