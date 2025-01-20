/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingFourModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 600
    public func setSize(size: Float64): FadingFourModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): FadingFourModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): FadingFourModel {
        this.duration = duration
        return this
    }
}

@Component
public class FadingFour {
    @State
    var model: FadingFourModel = FadingFourModel()

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
            delay: 500 * idx,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func build() {
        Column() {
            Row() {
                Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[0]).fill(
                    this.model.colors[0 % this.model.colors.size])
                Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[1]).fill(
                    this.model.colors[1 % this.model.colors.size])
            }.justifyContent(FlexAlign.SpaceBetween).width(this.model.size)

            Row() {
                Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[3]).fill(
                    this.model.colors[3 % this.model.colors.size])
                Rect().width(this.model.size / 3.0).height(this.model.size / 3.0).opacity(this.fadeValueArr[2]).fill(
                    this.model.colors[2 % this.model.colors.size])
            }.justifyContent(FlexAlign.SpaceBetween).width(this.model.size)
        }.justifyContent(FlexAlign.SpaceBetween).alignRules(
            AlignRuleOption(
                top: VerticalAnchor("__container__", VerticalAlign.Top),
                bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                right: HorizontalAnchor("__container__", HorizontalAlign.End),
            )
        ).width(this.model.size).height(this.model.size)
    }
}
