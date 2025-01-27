/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class CircleModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.RED]

    @Publish
    var duration: Int32 = 1200

    public func setSize(size: Float64): CircleModel {
        this.size = size
        return this
    }

    public func setColors(colors: Array<Color>): CircleModel {
        this.colors = colors
        return this
    }
    public func setDuration(duration: Int32): CircleModel {
        this.duration = duration
        return this
    }
}

@Component
public class CircleComponent {
    @State
    var model: CircleModel = CircleModel()

    @State
    var fadeValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0)
    protected override func aboutToAppear(): Unit {
    }

    protected override func aboutToDisappear() {
    }

    func build() {
        Stack(Alignment.TopStart) {
            ForEach(
                Array<Int64>(12, {i => i}),
                itemGeneratorFunc: {
                    _: Int64, idx: Int64 => Column {
                        Circle(width: this.model.size * 0.2, height: this.model.size * 0.2).fill(
                            this.model.colors[idx % this.model.colors.size]).rotate(x: 0.0, y: 0.0, z: 1.0,
                            centerX: (this.model.size / 2.0).vp, centerY: (this.model.size / 2.0).vp,
                            angle: Float32(idx * 30))
                                //                        .scale(1.0)
                                .scale(Float32(this.fadeValueArr[idx])).onAppear(
                            {
                            => animateTo(
                                AnimateParam(
                                    duration: this.model.duration,
                                    delay: 100 * Int32(idx),
                                    curve: Curve.EaseInOut,
                                    iterations: -1,
                                    playMode: PlayMode.Alternate,
                                    onFinish: {=>}
                                ),
                                {
                                    => this.fadeValueArr[idx] = 0.0
                                }
                            )
                        })
                    }
                }
            )
        }.width(this.model.size).height(this.model.size).backgroundColor(Color.WHITE)
    }
}
