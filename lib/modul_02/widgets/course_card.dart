import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    course.code,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    course.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          course.lecturer,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.meeting_room_outlined, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          course.room,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Progres Sesi', style: theme.textTheme.labelSmall?.copyWith(fontSize: 9)),
                      Text(
                        '${(course.progress * 100).toInt()}%',
                        style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 9),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: course.progress,
                    borderRadius: BorderRadius.circular(4),
                    minHeight: 4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${course.sks} SKS',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}