/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class FadingFourComponent {
    //    let delays: Array<Float64> = [0.0, -1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1]
    @State
    var size: Float64 = 50.0
    var duration: Int32 = 600

    @State
    var fadeValueArr: ObservedArray<Float64> = ObservedArray<Float64>(1.0, 1.0, 1.0, 1.0)

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY

    var width: Float64 = 300.0

    var height: Float64 = 300.0
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
            duration: this.duration,
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
        RelativeContainer() {
            Column() {
                Row() {
                    Rect().width(this.size / 3.0).height(this.size / 3.0).opacity(this.fadeValueArr[0]).fill(
                        this.colors[0 % this.colors.size])
                    Rect().width(this.size / 3.0).height(this.size / 3.0).opacity(this.fadeValueArr[1]).fill(
                        this.colors[1 % this.colors.size])
                }.justifyContent(FlexAlign.SpaceBetween).width(this.size)

                Row() {
                    Rect().width(this.size / 3.0).height(this.size / 3.0).opacity(this.fadeValueArr[3]).fill(
                        this.colors[3 % this.colors.size])
                    Rect().width(this.size / 3.0).height(this.size / 3.0).opacity(this.fadeValueArr[2]).fill(
                        this.colors[2 % this.colors.size])
                }.justifyContent(FlexAlign.SpaceBetween).width(this.size)
            }.justifyContent(FlexAlign.SpaceBetween).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            ).width(this.size).height(this.size)
        }.width(this.width).height(this.height).backgroundColor(this.backColor).border(width: 2.vp,
            color: Color(0x6699ff))
    }
}
