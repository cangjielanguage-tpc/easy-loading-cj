/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class ThreeBounceComponent {
    var size: Float64 = 50.0

    var duration: Int32 = 700

    @State
    var scaleValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(0.0, 0.0, 0.0)

    var colors: Array<Color> = [Color.BLACK]

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear() {
        for (index in 0..3) {
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.scaleValueArr[index] = value
            }
            animatorResult().play()
        }
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.duration,
            easing: "ease-in-out",
            delay: idx * 200,
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
            Row() {
                ForEach(
                    Array<Int64>(3, {i => i + 1}),
                    itemGeneratorFunc: {
                        _: Int64, idx: Int64 => Rect(width: this.size * 0.5, height: this.size * 0.5)
                            .fill(this.colors[idx % this.colors.size])
                            .scale(Float32(this.scaleValueArr[idx]))
                    }
                )
            }
                .width(this.size * 2.0)
                .height(this.size)
                .align(Alignment.Center)
                .justifyContent(FlexAlign.SpaceEvenly)
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
