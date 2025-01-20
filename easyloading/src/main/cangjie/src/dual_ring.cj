/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class DualRingModel {
    @Publish
    var width: Float64 = 100.0
    @Publish
    var height: Float64 = 100.0
    @Publish
    var color: Color = Color.RED
    @Publish
    var bgColor: Color = Color.BLACK
    @Publish
    var borderWidth: Float64 = 10.0
    @Publish
    var duration: Int32 = 1200


    public func setWidth(width: Float64): DualRingModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): DualRingModel {
        this.height = height
        return this
    }
    public func setColor(color: Color): DualRingModel {
        this.color = color
        return this
    }
    public func setBgColor(bgColor: Color): DualRingModel {
        this.bgColor = bgColor
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
            Stack() {
                    Circle()
                    .width(this.model.width - this.model.borderWidth)
                    .height(this.model.height - this.model.borderWidth)
                    .fillOpacity(0)
                    .strokeWidth(this.model.borderWidth)
                    .stroke(this.model.color)

                    Canvas(this.context).width(100.percent).height(100.percent).rotate(x: 0.0,y: 0.0, z: 1.0, angle: this.rotate, centerX: (this.model.width/2.0).vp, centerY: (this.model.height/2.0).vp).onReady(
                    {
                        =>
                        this.context.beginPath()
                        this.context.moveTo(0, 0)
                        this.context.lineTo(100, 0)
                        this.context.lineTo(50, 50)
                        this.context.closePath()
                        this.context.fillStyle(this.model.bgColor)
                        this.context.fill()
                        this.context.beginPath()
                        this.context.moveTo(0, 100)
                        this.context.lineTo(100, 100)
                        this.context.lineTo(50, 50)
                        this.context.closePath()
                        this.context.fillStyle(this.model.bgColor)
                        this.context.fill()
                        }
                    )

            }.width(100.percent)
            .height(100.percent)
            .backgroundColor(this.model.bgColor)
            .clip(RectShape(width: this.model.width, height: this.model.height)
            .fill(this.model.bgColor))
            .onAppear({=>
                 animateTo(
                    AnimateParam(
                        duration: this.model.duration,
                        delay: 0,
                        curve: Curve.Linear,
                        iterations: -1,
                        playMode: PlayMode.Normal,
                        onFinish: {=> }
                    ),
                    {=>
                        this.rotate = 360.0
                    }
                )

            })

        }.width(this.model.width).height(this.model.height)

    }
}
