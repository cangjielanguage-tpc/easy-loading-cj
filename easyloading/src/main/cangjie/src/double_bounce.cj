/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class DoubleBounceComponent {
    @State
    var size: Float64 = 50.0
    var duration: Int32 = 1000

    @State
    var scaleValue: Float64 = 0.0

    var colors: Array<Color> = [Color.BLACK]

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
            Stack(Alignment.Center) {
                Rect(width: this.size, height: this.size)
                    .fill(this.colors[0 % this.colors.size])
                    .scale(Float32(abs(1.0 - this.scaleValue)))
                Rect(width: this.size, height: this.size)
                    .fill(this.colors[1 % this.colors.size])
                    .scale(Float32(abs(scaleValue)))
            }
                .width(this.size)
                .height(this.size)
                .align(Alignment.Center)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                    )
                )
        }.width(this.width).height(this.height).backgroundColor(Color.GRAY).border(width: 2.vp, color: Color(0x6699ff))
    }
}
