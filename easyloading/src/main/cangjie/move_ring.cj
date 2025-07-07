/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class MoveRingModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var color: Color = Color.RED
    @Publish
    var strokeWidth: Float64 = 6.0

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): MoveRingModel {
        this.size = size
        return this
    }
    public func setStrokeWidth(strokeWidth: Float64): MoveRingModel {
        this.strokeWidth = strokeWidth
        return this
    }

    public func setColor(color: Color): MoveRingModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): MoveRingModel {
        this.duration = duration
        return this
    }
}

@Component
public class MoveRing {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State
    var model: MoveRingModel = MoveRingModel()
    @State
    var size: Float64 = 50.0

    @State
    var rotateValue: Float64 = 0.0

    var isOk = false

    @State
    var strokeWidth: Float64 = 6.0
    var endAnimatorResult: ?AnimatorResult = None

    protected override func aboutToAppear() {
        this.size = this.model.size
        this.strokeWidth = this.model.strokeWidth

        endAnimatorResult = AnimatorResult(endSetAnimatorOption()) // end Angel
        endAnimatorResult().onframe = {
            value: Float64 => onDraw(value)
        }
        endAnimatorResult().play()
    }

    func endSetAnimatorOption(): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "linner",
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 210.0
        )
        return option
    }

    func onDraw(endAngle: Float64) {
        if (!isOk) {
            return
        }
        context.clearRect(0.0, 0.0, this.size, this.size)
        this.context.lineWidth(strokeWidth)
        context.beginPath()
        context.arc(this.size / 2.0, this.size / 2.0, this.size / 2.0 - strokeWidth / 2.0, -120.0 * (Float64.getPI() / 180.0),
            endAngle * (Float64.getPI() / 180.0))

        context.strokeStyle(this.model.color)
        context.stroke()
    }

    func build() {
        Row() {
            Stack(Alignment.Center) {
                Canvas(this.context)
                    .width(this.size)
                    .height(this.size)
                    .onReady({
                        => isOk = true
                    })
                    .rotate(Float32(this.rotateValue))
            }.onAppear(
                {
                    => animateTo(
                        AnimateParam(
                            duration: this.model.duration,
                            delay: 0,
                            curve: Curve.Linear,
                            iterations: -1,
                            playMode: PlayMode.Normal,
                            onFinish: {=>}
                        ),
                        {
                            => this.rotateValue = 360.0
                        }
                    )
                })
        }.width(this.size).height(this.size)
    }
}
