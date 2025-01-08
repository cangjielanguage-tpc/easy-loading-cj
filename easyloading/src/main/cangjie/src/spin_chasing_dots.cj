/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class SpinChasingDotsComponent {
    @State
    var size: Float64 = 50.0
    var duration: Int32 = 1000

    @State
    var rotateValue: Float64 = 0.0

    @State
    var scaleValue: Float64 = 1.0

    @State
    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY
    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult1: ?AnimatorResult = None

    var animatorResult2: ?AnimatorResult = None

    protected override func aboutToAppear() {
        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.rotateValue = value
        }
        animatorResult1().play()

        animatorResult2 = AnimatorResult(setAnimatorOption2())
        animatorResult2().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult2().play()
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
            duration: this.duration,
            easing: "linear",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 360.0
        )
        return option
    }
    func setAnimatorOption2(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.duration / 2,
            easing: "ease-in-out",
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }

    func build() {
        RelativeContainer() {
            Stack(Alignment.TopStart) {
                Stack() {
                    Column() {
                        Rect(width: this.size * 0.6, height: this.size * 0.6)
                            .fill(this.colors[0 % this.colors.size])
                            .scale(Float32(abs(1.0 - this.scaleValue)))
                    }
                        .justifyContent(FlexAlign.Start)
                        .width(100.percent)
                        .height(100.percent)
                        .alignItems(HorizontalAlign.Start)

                    Column() {
                        Rect(width: this.size * 0.6, height: this.size * 0.6)
                            .fill(this.colors[1 % this.colors.size])
                            .scale(Float32(abs(this.scaleValue)))
                    }
                        .justifyContent(FlexAlign.End)
                        .width(100.percent)
                        .height(100.percent)
                        .alignItems(HorizontalAlign.Start)
                }.rotate(x: 0.0, y: 0.0, z: 1.0, centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp,
                    angle: Float32(this.rotateValue))
            }
                .width(this.size)
                .height(this.size)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                    )
                )
        }
            .width(this.width)
            .height(this.height)
            .backgroundColor(this.backColor)
            .border(width: 2.vp, color: Color(0x6699ff))
    }
}
