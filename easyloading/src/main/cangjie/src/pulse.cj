/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class PulseComponent {
    var color: Color = Color.BLACK
    var backColor: Color = Color.GRAY
    @State
    var size: Float64 = 50.0

    @State
    var scaleValue: Float64 = 1.0
    var duration: Int32 = 1000

    var width: Float64 = 300.0

    var height: Float64 = 300.0
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
            duration: this.duration,
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
        RelativeContainer() {
            Row() {
                Stack(Alignment.Center) {
                    Rect(width: this.size, height: this.size)
                        .fill(this.color)
                        .scale(Float32(abs(1.0 - this.scaleValue)))
                        .opacity(this.scaleValue)
                }
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
