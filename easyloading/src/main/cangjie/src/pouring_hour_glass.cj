/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class PouringHourGlassModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var strokeWidth: Float64 = 1.0

    @Publish
    var color: Color = Color.BLACK


    @Publish
    var duration: Int32 = 2400
    public func setSize(size: Float64): PouringHourGlassModel {
        this.size = size
        return this
    }
    public func setColor(color: Color): PouringHourGlassModel {
        this.color = color
        return this
    }

    public func setDuration(duration: Int32): PouringHourGlassModel {
        this.duration = duration
        return this
    }
    public func setStrokeWidth(strokeWidth: Float64): PouringHourGlassModel {
        this.strokeWidth = strokeWidth
        return this
    }
}

@Component
public class PouringHourGlass {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State
    var model: PouringHourGlassModel = PouringHourGlassModel()

    static let sqrt1_2 = 0.7071067811865476

    @State
    var scaleValue: Float64 = 0.0

    var size: Float64 = 0.0
    @State
    var rotateValue = 0.0

    var animatorResult: ?AnimatorResult = None

    var centerX = 0.0
    var halfHeight = 0.0
    var hourglassWidth = 0.0
    var gapWidth = 0.0
    var yPadding = 0.0
    var top = 0.0
    var bottom = 0.0

    protected override func aboutToAppear() {
        animatorResult = AnimatorResult(setAnimatorOption())
        animatorResult().onframe = {
            value: Float64 => this.scaleValue = value
        }
        animatorResult().play()
        animatorResult().onfinish = {
            => rotateValue = 360.0
        }

        size = this.model.size * sqrt1_2
        centerX = size / 2.0
        halfHeight = size / 2.0
        hourglassWidth = min(centerX * 0.8, halfHeight)
        gapWidth = max(3.0, hourglassWidth * 0.05)
        yPadding = gapWidth / 2.0
        top = yPadding
        bottom = size - yPadding
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func setAnimatorOption(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
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
        Row() {
            Column {
                Stack(Alignment.Center) {
                    Canvas(this.context).width(this.size - this.scaleValue).height(this.size - this.scaleValue).rotate(
                        Float32(this.rotateValue)).backgroundColor(0xffff00).onReady(
                        {
                            =>
                            var hourglassPath = Path2D()
                            hourglassPath.moveTo(centerX - hourglassWidth, top)
                            hourglassPath.lineTo(centerX + hourglassWidth, top)
                            hourglassPath.lineTo(centerX + gapWidth, halfHeight)
                            hourglassPath.lineTo(centerX + hourglassWidth, bottom)
                            hourglassPath.lineTo(centerX - hourglassWidth, bottom)
                            hourglassPath.lineTo(centerX - gapWidth, halfHeight)
                            hourglassPath.closePath()
                            //
                            context.stroke(hourglassPath)
                            Hilog.error(0, "ss", "ffff  ${top} ${halfHeight} ${size} ${halfHeight}")
                            var upperFill = Path2D()
                            //                        min(halfHeight, top *(1.0-model.getScaleValue()))
                            upperFill.moveTo(
                                centerX - hourglassWidth + (hourglassWidth - gapWidth) * this.scaleValue,
                                halfHeight + (top - halfHeight) * (1.0 - this.scaleValue)
                            )
                            upperFill.lineTo(
                                centerX + hourglassWidth - (hourglassWidth - gapWidth) * this.scaleValue,
                                halfHeight + (top - halfHeight) * (1.0 - this.scaleValue)
                            )
                            upperFill.lineTo(centerX + gapWidth, halfHeight)
                            upperFill.lineTo(centerX - gapWidth, halfHeight) // zz
                            upperFill.closePath()
                            context.fillStyle(Color.RED)
                            context.stroke(upperFill)

                            var lowerPartPath = Path2D()
                            lowerPartPath.moveTo(centerX, bottom - (bottom - halfHeight) * this.scaleValue)
                            lowerPartPath.lineTo(centerX - hourglassWidth * this.scaleValue, bottom)
                            lowerPartPath.lineTo(centerX + hourglassWidth * this.scaleValue, bottom)
                            lowerPartPath.closePath()
                            context.stroke(lowerPartPath)

                            context.strokeStyle(Color.BLACK)
                            context.moveTo(centerX, halfHeight)
                            context.lineTo(centerX, bottom)
                            context.stroke()
                        }
                    )
                }
            }
        }.width(this.size).height(this.size)
    }
}
