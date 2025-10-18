import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/core/constants/app_colors.dart';

class JobListViewScreen extends StatefulWidget {
  const JobListViewScreen({super.key});

  @override
  State<JobListViewScreen> createState() => _JobListViewScreenState();
}

class _JobListViewScreenState extends State<JobListViewScreen> {
  final List<Job> jobList = [
    Job(
      title: 'Leak detection and repair',
      date: 'October 9, 2025 · 2:00 PM',
      client: 'John Anderson',
      status: 'In Progress',
      address: '123 Main Street, Springfield, IL 62701, USA',
    ),
    Job(
      title: 'Pipe installation and replacement',
      date: 'October 14, 2025 · 1:00 PM',
      client: 'Paul Smith',
      address: '2569 Cedar Lane, Apt 5B Portland, USA',
      status: 'New',
    ),
    Job(
      title: 'Bathroom & Kitchen Plumbing',
      date: 'October 7, 2025 · 2:00 PM',
      client: 'John Anderson',
      address: '4573 Elmwood Drive Jacksonville, FL 32207, USA',
      status: 'Completed',
    ),
    Job(
      title: 'Water Heater & Geyser Services',
      date: 'October 15, 2025 · 1:00 PM',
      client: 'Paul Smith',
      address: '3650 Ivy Ridge Ln, Suite 210 Atlanta, GA 30328, USA',
      status: 'New',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _buildJobCard(job: jobList[index]);
        },
        itemCount: jobList.length,
      ),
    );
  }

  /*

    child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildJobCard(job: null, status: '', statusColor: null),
     */

  Widget _buildJobCard({required Job job}) {
    Color? color;

    if (job.status == "In Progress") {
      color = AppColors.AMBER_COLOR;
    } else if (job.status == "Pending") {
      color = AppColors.BLUE_COLOR;
    } else if (job.status == "New") {
      color = AppColors.GREEN_COLOR;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title
            Text(
              job.title,
              style: GoogleFonts.urbanist(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),

            SizedBox(height: 8),

            // Date
            Text(
              job.date,
              style: GoogleFonts.urbanist(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 8),

            // Client Name
            Text(
              job.client,
              style: GoogleFonts.urbanist(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 4),

            // Address
            Text(
              job.address,
              style: GoogleFonts.urbanist(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 12),

            // Status Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                job.status,
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.TEXT_COLOR_WHITE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Job {
  final String title;
  final String date;
  final String client;
  final String status;
  final String address;

  Job({
    required this.title,
    required this.date,
    required this.client,
    required this.status,
    required this.address,
  });
}
