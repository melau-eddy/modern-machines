import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance Analytics',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: true, border: Border.all(color: Colors.white10)),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      const FlSpot(4, 5),
                    ],
                    isCurved: true,
                    color: Colors.blueAccent,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blueAccent.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Machine Utilization',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 40,
                    title: 'Tractor A',
                    color: Colors.blueAccent,
                    radius: 50,
                  ),
                  PieChartSectionData(
                    value: 30,
                    title: 'Harvester B',
                    color: Colors.tealAccent,
                    radius: 50,
                  ),
                  PieChartSectionData(
                    value: 20,
                    title: 'Plow C',
                    color: Colors.amber,
                    radius: 50,
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: 'Sprayer D',
                    color: Colors.redAccent,
                    radius: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}