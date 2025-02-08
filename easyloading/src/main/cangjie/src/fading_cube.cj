/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingCubeModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var colors: Array<Color> = [Color.BLACK]

    @Publish
    var duration: Int32 = 1200
    public func setSize(size: Float64): FadingCubeModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): FadingCubeModel {
        this.colors = colors
        return this
    }

    public func setDuration(duration: Int32): FadingCubeModel {
        this.duration = duration
        return this
    }
}

@Component
public class FadingCube {
    @State
    var model: FadingCubeModel = FadingCubeModel()
    @State
    var fadeValueArr: ObservedArray<Float64> = ObservedArray<Float64>(0.0, 0.0, 0.0, 0.0)

    protected override func aboutToAppear(): Unit {
    }

    protected override func aboutToDisappear() {
    }

    func build() {
        Stack(Alignment.TopStart) {
            Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[0]).fill(
                    this.model.colors[0 % this.model.colors.size]).onAppear(
                    {
                    => animateTo(
                        AnimateParam(
                            duration: this.model.duration,
                            delay: 0,
                            curve: Curve.EaseInOut,
                            iterations: -1,
                            playMode: PlayMode.Alternate,
                            onFinish: {=>}
                        ),
                        {
                            => this.fadeValueArr[0] = 1.0
                        }
                    )
                })
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[1]).fill(
                    this.model.colors[1 % this.model.colors.size]).onAppear(
                    {
                    => animateTo(
                        AnimateParam(
                            duration: this.model.duration,
                            delay: 450,
                            curve: Curve.EaseInOut,
                            iterations: -1,
                            playMode: PlayMode.Alternate,
                            onFinish: {=>}
                        ),
                        {
                            => this.fadeValueArr[1] = 1.0
                        }
                    )
                })
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[3]).fill(
                    this.model.colors[3 % this.model.colors.size]).onAppear(
                    {
                    => animateTo(
                        AnimateParam(
                            duration: this.model.duration,
                            delay: 450 * 2,
                            curve: Curve.EaseInOut,
                            iterations: -1,
                            playMode: PlayMode.Alternate,
                            onFinish: {=>}
                        ),
                        {
                            => this.fadeValueArr[2] = 1.0
                        }
                    )
                })
                Rect().width(this.model.size / 2.0).height(this.model.size / 2.0).opacity(this.fadeValueArr[2]).fill(
                    this.model.colors[2 % this.model.colors.size]).onAppear(
                    {
                    => animateTo(
                        AnimateParam(
                            duration: this.model.duration,
                            delay: 450 * 3,
                            curve: Curve.EaseInOut,
                            iterations: -1,
                            playMode: PlayMode.Alternate,
                            onFinish: {=>}
                        ),
                        {
                            => this.fadeValueArr[3] = 1.0
                        }
                    )
                })
            }.width(this.model.size)
        }.width(this.model.size).height(this.model.size).rotate(x: 0.0, y: 0.0, z: 1.0, angle: -45.0)
    }
}
