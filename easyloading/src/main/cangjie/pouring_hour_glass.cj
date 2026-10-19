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
    public func setColor(colors: Color): PouringHourGlassModel {
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

    let sqrt1_2 = 0.7071067811865476

    var size: Float64 = 0.0
    @State
    var rotateValue = 0.0
    var color: Color = Color.BLACK
    var isOk = false

    var animatorResult: ?AnimatorResult = None

    var centerX = 0.0
    var halfHeight = 0.0
    var hourglassWidth = 0.0
    var gapWidth = 0.0
    var yPadding = 0.0
    var top = 0.0
    var bottom = 0.0

    func animator11() {
        animateTo(
            AnimateParam(
                duration: this.model.duration / 2,
                delay: 0,
                curve: Curve.EaseIn,
                iterations: 1,
                playMode: PlayMode.Normal,
                onFinish: {
                    => this.rotateValue = 0.0
                }
            ),
            {
                => this.rotateValue = 180.0
            }
        )
    }

    protected override func aboutToAppear() {
        this.color = this.model.color
        animatorResult = AnimatorResult(setAnimatorOption())
        animatorResult().onframe = {
            value: Float64 =>
            onDraw(value)
        }
        animatorResult().play()
        animatorResult().onfinish = {
            =>
            this.animator11()
            animatorResult().play()
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
            iterations: 1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }

    func onDraw(sValue: Float64) {
        if (!isOk) {
            return
        }
        context.clearRect(0.0, 0.0, this.size, this.size)
        var hourglassPath = Path2D()
        hourglassPath.moveTo(centerX - hourglassWidth, top)
        hourglassPath.lineTo(centerX + hourglassWidth, top)
        hourglassPath.lineTo(centerX + gapWidth, halfHeight)
        hourglassPath.lineTo(centerX + hourglassWidth, bottom)
        hourglassPath.lineTo(centerX - hourglassWidth, bottom)
        hourglassPath.lineTo(centerX - gapWidth, halfHeight)
        hourglassPath.closePath()
        context.stroke(hourglassPath)

        var upperFill = Path2D()
        upperFill.moveTo(
            centerX - hourglassWidth + (hourglassWidth - gapWidth) * sValue,
            halfHeight + (top - halfHeight) * (1.0 - sValue)
        )
        upperFill.lineTo(
            centerX + hourglassWidth - (hourglassWidth - gapWidth) * sValue,
            halfHeight + (top - halfHeight) * (1.0 - sValue)
        )
        upperFill.lineTo(centerX + gapWidth, halfHeight)
        upperFill.lineTo(centerX - gapWidth, halfHeight)
        upperFill.closePath()
        context.fillStyle(this.color)
        context.stroke(upperFill) // fill

        var lowerPartPath = Path2D()
        lowerPartPath.moveTo(centerX, bottom - (bottom - halfHeight) * sValue)
        lowerPartPath.lineTo(centerX - hourglassWidth * sValue, bottom)
        lowerPartPath.lineTo(centerX + hourglassWidth * sValue, bottom)
        lowerPartPath.closePath()
        context.stroke(lowerPartPath) // fill

        context.moveTo(centerX, halfHeight)
        context.lineTo(centerX, bottom)
        context.stroke()
    }
    func build() {
        Row() {
            Column {
                Stack(Alignment.Center) {
                    Canvas(this.context)
                        .width(this.size)
                        .height(this.size)
                        .rotate(Float32(this.rotateValue))
                        .onReady({
                            => isOk = true
                        })
                }
            }
        }.width(this.size).height(this.size)
    }
}
