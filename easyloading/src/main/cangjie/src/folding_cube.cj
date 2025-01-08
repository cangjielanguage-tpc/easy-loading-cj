/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class FoldingCubeComponent {
    //    let delays: Array<Float64> = [0.0, -1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1]
    @State
    var size: Float64 = 50.0
    var duration: Int32 = 1200

    //    @State
    //    var fadeValueArr: ObservedArray<Float64> = ObservedArray<Float64>(1.0, 1.0, 1.0, 1.0)
    @State
    var _rotate2: Float64 = 0.0

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY

    var width: Float64 = 300.0
    var _delay: Int32 = 0

    var height: Float64 = 300.0
    var animatorResult1: ?AnimatorResult = None
    var animatorResult2: ?AnimatorResult = None
    var animatorResult3: ?AnimatorResult = None
    var animatorResult4: ?AnimatorResult = None

    protected override func aboutToAppear(): Unit {
        _delay = this.duration / 8

        animatorResult2 = AnimatorResult(setAnimatorOption(1))
        animatorResult2().onframe = {
            value: Float64 => this._rotate2 = value
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
            easing: "ease-in",
            delay: _delay * idx,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: -180.0,
            end: 180.0
        )
        return option
    }

    func build() {
        RelativeContainer() {
            Stack(Alignment.TopStart) {
                Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                    Rect().width(this.size / 2.0).height(this.size / 2.0).fill(this.colors[0 % this.colors.size])

                    if (this._rotate2 <= 0.0) {
                        Rect().width(this.size / 2.0).height(this.size / 2.0).rotateX(Float32(this._rotate2)).fill(
                            this.colors[1 % this.colors.size])
                    } else {
                        Rect().width(this.size / 2.0).height(this.size / 2.0).rotateY(Float32(this._rotate2)).fill(
                            this.colors[1 % this.colors.size])
                    }

                    Rect().width(this.size / 2.0).height(this.size / 2.0).opacity(0)
                    Rect().width(this.size / 2.0).height(this.size / 2.0).opacity(0).fill(
                        this.colors[3 % this.colors.size])
                    Rect().width(this.size / 2.0).height(this.size / 2.0).opacity(0).fill(
                        this.colors[2 % this.colors.size])
                }.width(this.size)
            }.width(this.size).height(this.size).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            )
//            .rotate(x: 0.0, y: 0.0, z: 1.0, angle: -45.0)
        }.width(this.width).height(this.height).backgroundColor(this.backColor).border(width: 2.vp,
            color: Color(0x6699ff))
    }
}
