/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class RotateCirclesModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): RotateCirclesModel {
        this.size = size
        return this
    }

    public func setColors(colors: Array<Color>): RotateCirclesModel {
        this.colors = colors
        return this
    }
    public func setDuration(duration: Int32): RotateCirclesModel {
        this.duration = duration
        return this
    }
}

@Component
public class RotateCirclesComponent {
    @State
    var model: RotateCirclesModel = RotateCirclesModel()

    let radian = 30.0 * Float64.getPI() / 180.0

    @State
    var rotateValue1: Float64 = 0.0

    func build() {
        Stack(Alignment.TopStart) {
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(this.model.colors[0]).position(
                x: this.model.size * 0.425, y: 0.0)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[1 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: -this.model.size * 0.425 * cos(radian)
            )

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[2 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian),
                y: -this.model.size * 0.2125)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[3 % this.model.colors.size]).position(x: this.model.size * 0.85,
                y: this.model.size * 0.425)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[4 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: this.model.size * 0.425 * cos(radian), y: this.model.size * 0.2125
            )

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[5 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            )

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[6 % this.model.colors.size]).position(x: this.model.size * 0.425,
                y: this.model.size * 0.85)
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[7 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(
                x: -this.model.size * 0.2125,
                y: this.model.size * 0.425 * cos(radian)
            )
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[8 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.425 * cos(radian),
                y: this.model.size * 0.2125)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[9 % this.model.colors.size]).position(x: 0.0, y: this.model.size * 0.425)
            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[10 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.425 * cos(radian),
                y: -this.model.size * 0.2125)

            Circle(width: this.model.size * 0.15, height: this.model.size * 0.15).fill(
                this.model.colors[11 % this.model.colors.size]).markAnchor(x: -this.model.size * 0.425,
                y: -this.model.size * 0.425).offset(x: -this.model.size * 0.2125,
                y: -this.model.size * 0.425 * cos(radian))
        }.width(this.model.size).height(this.model.size).rotate(Float32(this.rotateValue1)).onAppear(
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
                    => this.rotateValue1 = 360.0
                }
            )
        })
    }
}
