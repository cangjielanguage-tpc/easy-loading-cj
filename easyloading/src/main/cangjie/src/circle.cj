/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class CircleComponent {
    let delays: Array<Float64> = [0.0, -1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1]
    @State
    var size: Float64 = 50.0
    var duration: Int32 = 1200
    @State
    var fadeValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0)

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear(): Unit {
        for (index in 0..12) {
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.fadeValueArr[index] = value
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
            delay: 100 * idx,
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
            Stack(Alignment.TopStart) {
                ForEach(
                    Array<Int64>(12, {i => i + 1}),
                    itemGeneratorFunc: {
                        _: Int64, idx: Int64 => Column {
                            Circle(width: this.size * 0.2, height: this.size * 0.2).fill(
                                this.colors[idx % this.colors.size]).rotate(x: 0.0, y: 0.0, z: 1.0,
                                centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp, angle: Float32(idx * 30))
                        }.width(this.size * 0.2).height(this.size * 0.2)
                    }
                )
            }.width(this.size).height(this.size).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            ).backgroundColor(Color.BLACK)
        }.width(this.width).height(this.height).backgroundColor(this.backColor).border(width: 2.vp,
            color: Color(0x6699ff))
    }
}
