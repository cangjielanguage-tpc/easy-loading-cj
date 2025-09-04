package ohos_app_cangjie_entry_test.LLT

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.ui_test.*
@Test
class TestExample {
    @TestCase
    func testLevel0(): Unit {
        let driver = Driver.create()
        driver.findComponent(On().id("SampleRotatePlain")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

        driver.findComponent(On().id("SampleDoubleBounce")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleWave")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleWanderingCubes")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleFadingFour")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleFadingCube")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SamplePulse")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleSpinChasingDots")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleThreeBounce")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleCircle")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleStaticCircle")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleRotateCircles")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleRotateFourCircles")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleRotateEightCircles")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                driver.findComponent(On().id("SampleCubeGrid")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                        driver.findComponent(On().id("SampleFadingCircle")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                        driver.findComponent(On().id("SampleRotateCircle")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                        driver.findComponent(On().id("SampleFoldingCube")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)

                        driver.findComponent(On().id("SamplePumpHeart")).click()
        driver.delayMs(1500)
        driver.findComponent(On().id("back")).click()
        driver.delayMs(1500)


    }
}
