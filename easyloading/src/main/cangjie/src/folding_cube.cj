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
    var _rotate0: Float64 = 0.0
    @State
    var _rotate1: Float64 = 0.0
    @State
    var _rotate2: Float64 = 0.0
    @State
    var _rotate3: Float64 = 0.0
    @State
    var opacityValue: Float64 = 1.0

        @State
    var opacityValue2: Float64 = 0.0

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY

    var width: Float64 = 300.0
    var _delay: Int32 = 0

    var height: Float64 = 300.0
    var animatorResult1: ?AnimatorResult = None
    var animatorResult2: ?AnimatorResult = None
    var animatorResult3: ?AnimatorResult = None
    var animatorResult0: ?AnimatorResult = None
    var animatorResult4: ?AnimatorResult = None
    var animatorResult5: ?AnimatorResult = None

    protected override func aboutToAppear(): Unit {
        _delay = this.duration / 4

//        for (i in 0..10) {
            animatorResult0 = AnimatorResult(setAnimatorOption(0))
            animatorResult0().onframe = {
                value: Float64 => this._rotate0 = value
            }
            animatorResult0().play()

            animatorResult1 = AnimatorResult(setAnimatorOption(1))
            animatorResult1().onframe = {
                value: Float64 => this._rotate1 = value
            }
            animatorResult1().play()

            animatorResult2 = AnimatorResult(setAnimatorOption(2))
            animatorResult2().onframe = {
                value: Float64 => this._rotate2 = value
            }
            animatorResult2().play()

            animatorResult3 = AnimatorResult(setAnimatorOption(3))
            animatorResult3().onframe = {
                value: Float64 => this._rotate3 = value
            }
            animatorResult3().play()

            animatorResult4 = AnimatorResult(setAnimatorOption1())
            animatorResult4().onframe = {
                value: Float64 => this.opacityValue = value
            }
            animatorResult4().play()

            animatorResult5 = AnimatorResult(setAnimatorOption2())
            animatorResult5().onframe = {
                value: Float64 => this.opacityValue2 = value
            }
            animatorResult5().play()
//        }
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
        if (let Some(animator0) <- animatorResult0) {
            animator0.finish()
        }
    }
    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: _delay,
            easing: "linner",
            delay: _delay * idx,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 180.0
        )
        return option
    }

    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: _delay,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }
    func setAnimatorOption2(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: _delay,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func build() {
        RelativeContainer() {
            Stack(Alignment.TopStart) {
                Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                    Rect().width(this.size / 2.0).height(this.size / 2.0).fill(this.colors[0 % this.colors.size]).rotate(
                        x: 0.0, y: 1.0, z: 0.0, centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp,
                        angle: Float32(this._rotate0)).opacity(this.opacityValue2)

                    Rect().width(this.size / 2.0).height(this.size / 2.0).fill(this.colors[1 % this.colors.size]).rotate(
                        x: 1.0, y: 0.0, z: 0.0, centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp,
                        angle: Float32(this._rotate1)).opacity(this.opacityValue2)


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
