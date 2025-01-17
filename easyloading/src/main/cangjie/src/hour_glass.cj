/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class HourGlassComponent {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    var color: Color = Color.BLACK
    var backColor: Color = Color.GRAY
    @State
    var size: Float64 = 50.0

    @State
    var rotateValue1: Float64 = 0.0

    var duration: Int32 = 1200

    var angle: Float64 = 90.0
    var strokeWidth: Float64 = 1.0
    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult1: ?AnimatorResult = None
    protected override func aboutToAppear() {
        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.rotateValue1 = value
        }
        animatorResult1().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator1) <- animatorResult1) {
            animator1.finish()
        }
    }

    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.duration,
            easing: "extreme-deceleration",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 1080.0
        )
        return option
    }

    func build() {
        RelativeContainer() {
            Row() {
                Stack(Alignment.Center) {
                    Canvas(this.context).width(this.size).height(this.size).rotate(x: 0.0, y: 0.0, z: 1.0,
                        centerX: (this.size / 2.0).vp, centerY: (this.size / 2.0).vp, angle: Float32(this.rotateValue1)).
                        onReady(
                        {
                            =>
                            context.beginPath()
                            context.moveTo(this.size / 2.0, this.size / 2.0)
                            context.arc(this.size / 2.0, this.size / 2.0, this.size / 2.0, 0.0,
                                this.angle * (Float64.PI / 180.0))

                            context.moveTo(this.size / 2.0, this.size / 2.0)
                            context.arc(this.size / 2.0, this.size / 2.0, this.size / 2.0, 180.0 * (Float64.PI / 180.0),
                                (180.0 + this.angle) * (Float64.PI / 180.0))

                            context.closePath()
                            context.fillStyle(this.color)
                            context.fill()
                        }
                    )
                }
            }.width(this.size).height(this.size).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            )
        }.width(this.width).height(this.height).backgroundColor(this.backColor).border(width: 2.vp)
    }
}
