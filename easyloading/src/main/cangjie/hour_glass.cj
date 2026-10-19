/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class HourGlassModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var angle: Float64 = 90.0
    @Publish
    var strokeWidth: Float64 = 1.0
    @Publish
    var colors: Array<Color> = [Color.BLACK]


    @Publish
    var duration: Int32 = 1200
    public func setSize(size: Float64): HourGlassModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): HourGlassModel {
        if (colors.size > 0) {
            this.colors = colors
        }
        return this
    }

    public func setDuration(duration: Int32): HourGlassModel {
        this.duration = duration
        return this
    }

    public func setAngle(angle: Float64): HourGlassModel {
        this.angle = angle
        return this
    }

    public func setStrokeWidth(strokeWidth: Float64): HourGlassModel {
        this.strokeWidth = strokeWidth
        return this
    }
}

@Component
public class HourGlass {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State
    var model: HourGlassModel = HourGlassModel()

    @State
    var rotateValue1: Float64 = 0.0

    var animatorResult1: ?AnimatorResult = None

    protected override func aboutToAppear() {

        animatorResult1 = AnimatorResult(setAnimatorOption1())
        animatorResult1().onframe = {
            value: Float64 => this.rotateValue1 = value
        }
        animatorResult1().play()
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult1) {
            animator.finish()
        }
    }

    func setAnimatorOption1(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "extreme-deceleration",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 2160.0
        )
        return option
    }

    func build() {
        Row() {
            Stack(Alignment.Center) {
                Canvas(this.context).width(this.model.size).height(this.model.size).rotate(x: 0.0, y: 0.0, z: 1.0,
                    centerX: (this.model.size / 2.0).vp, centerY: (this.model.size / 2.0).vp,
                    angle: Float32(this.rotateValue1)).onReady(
                    {
                        =>
                        context.beginPath()
                        context.moveTo(this.model.size / 2.0, this.model.size / 2.0)
                        context.arc(this.model.size / 2.0, this.model.size / 2.0, this.model.size / 2.0, (180.0 - this.model.angle) * (Float64.getPI() / 360.0),
                            (90.0 + this.model.angle/2.0) * (Float64.getPI() / 180.0))
                        context.closePath()
                        context.fillStyle(this.model.colors[0])
                        context.lineWidth(this.model.strokeWidth)
                        context.fill()

                        context.beginPath()
                        context.moveTo(this.model.size / 2.0, this.model.size / 2.0)
                        context.arc(this.model.size / 2.0, this.model.size / 2.0, this.model.size / 2.0,
                            (270.0 - this.model.angle/2.0) * (Float64.getPI() / 180.0), (270.0 + this.model.angle/2.0) * (Float64.getPI() / 180.0))

                        context.closePath()
                        context.fillStyle(this.model.colors[1 % this.model.colors.size])
                        context.lineWidth(this.model.strokeWidth)
                        context.fill()
                    }
                )
            }
        }.width(this.model.size).height(this.model.size)
    }
}
