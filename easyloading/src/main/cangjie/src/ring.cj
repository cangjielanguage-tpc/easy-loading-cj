/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RingModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var color: Color = Color.RED
    @Publish
    var strokeWidth: Float64 = 1.0

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): RingModel {
        this.size = size
        return this
    }

    public func setColor(color: Color): RingModel {
        this.color = color
        return this
    }
    public func setDuration(duration: Int32): RingModel {
        this.duration = duration
        return this
    }

    public func setStrokeWidth(strokeWidth: Float64): RingModel {
        this.strokeWidth = strokeWidth
        return this
    }
}

@Component
public class Ring {
    var settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    var context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    @State
    var model: RingModel = RingModel()
    @State
    var size: Float64 = 50.0

    @State
    var rotateValue: Float64 = 0.0

    var angle: Float64 = 90.0

    var width: Float64 = 300.0

    var height: Float64 = 300.0

    protected override func aboutToAppear() {
        this.size = this.model.size
    }
    protected override func aboutToDisappear() {

    }


    func build() {
        Row() {
            Stack(Alignment.Center) {
                Canvas(this.context).width(this.size).height(this.size).onReady(
                    {
                        =>
                        this.context.lineWidth(6)
                        context.beginPath()
                        context.arc(this.size / 2.0, this.size / 2.0, this.size / 2.0 - 3.0,
                            -30.0 * (Float64.PI / 180.0), 270.0 * (Float64.PI / 180.0))

                        context.strokeStyle(this.model.color)
                        context.stroke()
                    }
                ).rotate(Float32(this.rotateValue))
            }.onAppear(
                {
                => animateTo(
                    AnimateParam(
                        duration: this.model.duration,
                        delay: 0,
                        curve: Curve.Ease,
                        iterations: -1,
                        playMode: PlayMode.Normal,
                        onFinish: {=>}
                    ),
                    {
                        => this.rotateValue = 300.0
                    }
                )
            })
        }.width(this.size).height(this.size)
    }
}
