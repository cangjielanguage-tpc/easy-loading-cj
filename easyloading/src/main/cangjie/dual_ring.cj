/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class DualRingModel {
    @Publish
    var size: Float64 = 100.0
    @Publish
    var color: Color = Color.RED
    @Publish
    var angle: Float64 = 90.0
    @Publish
    var borderWidth: Float64 = 10.0
    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): DualRingModel {
        this.size = size
        return this
    }

    public func setColor(color: Color): DualRingModel {
        this.color = color
        return this
    }

    public func setBorderWidth(borderWidth: Float64): DualRingModel {
        this.borderWidth = borderWidth
        return this
    }
    public func setDuration(duration: Int32): DualRingModel {
        this.duration = duration
        return this
    }

    public func setAngle(angle: Float64): DualRingModel {
        this.angle = angle
        return this
    }
}

@Component
public class DualRing {
    @State
    var model: DualRingModel = DualRingModel()

    @State
    var rotate: Float32 = 0.0

    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    func build() {
        Column() {
            Stack(Alignment.Center) {
                Canvas(this.context)
                    .width(this.model.size)
                    .height(this.model.size)
                    .rotate(x: 0.0, y: 0.0, z: 1.0, centerX: (this.model.size / 2.0).vp,
                        centerY: (this.model.size / 2.0).vp, angle: this.rotate)
                    .onReady(
                        {
                            =>
                            this.context.lineWidth(this.model.borderWidth)
                            context.beginPath()
                            context.arc(this.model.size / 2.0, this.model.size / 2.0, this.model.size / 2.5, 0.0,
                                this.model.angle * (Float64.getPI() / 180.0))

                            context.strokeStyle(this.model.color)
                            context.stroke()

                            context.beginPath()
                            context.arc(this.model.size / 2.0, this.model.size / 2.0, this.model.size / 2.5,
                                180.0 * (Float64.getPI() / 180.0), (180.0 + this.model.angle) * (Float64.getPI() / 180.0))
                            context.strokeStyle(this.model.color)
                            context.stroke()
                        }
                    )
            }
                .width(100.percent)
                .height(100.percent)
                .onAppear(
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
                                => this.rotate = 360.0
                            }
                        )
                    })
        }.width(this.model.size).height(this.model.size)
    }
}
