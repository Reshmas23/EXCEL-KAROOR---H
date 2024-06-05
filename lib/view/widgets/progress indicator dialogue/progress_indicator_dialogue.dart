import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';

class ProgressDialog extends StatelessWidget {
  final RxDouble progressValue;

  const ProgressDialog({Key? key, required this.progressValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       
        width: 300,
        color: Colors.white30,
        child: Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: true,
                    startAngle: 270,
                    endAngle: 270,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 1,
                      color: Color.fromARGB(255, 0, 169, 181),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(  animationDuration: 100,
                        value: progressValue.value * 100,
                        width: 0.15,
                        color: Colors.white,
                        pointerOffset: 0.1,
                        cornerStyle: CornerStyle.bothCurve,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        angle: 90,
                        positionFactor: 0.5,
                        widget: Column(
                          children: [
                            Text(
                              '${(progressValue.value * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             
            ],
          ),
        )),
      ),
    );
  }
}
