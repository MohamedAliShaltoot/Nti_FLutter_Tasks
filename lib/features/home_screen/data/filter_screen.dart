// Add this to your filter_screen.dart file or where appropriate:

import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/core/widgets/custom_calender_container.dart';

void showFilterModal(BuildContext context) {
  print("Showing filter modal"); // Debug print

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    builder: (context) {
      return TaskFilterModal(
        onCategoryChanged: (category) {
          // print('Selected category: $category');
        },
        onStatusChanged: (status) {
          // print('Selected status: $status');
        },
        onFilterPressed: () {
          Navigator.pop(context);
          //  print('Filter button pressed');
        },
      );
    },
  );
}

class TaskFilterModal extends StatefulWidget {
  final Function(String) onCategoryChanged;
  final Function(String) onStatusChanged;
  final Function() onFilterPressed;

  const TaskFilterModal({
    Key? key,
    required this.onCategoryChanged,
    required this.onStatusChanged,
    required this.onFilterPressed,
  }) : super(key: key);

  @override
  _TaskFilterModalState createState() => _TaskFilterModalState();
}

class _TaskFilterModalState extends State<TaskFilterModal> {
  String _selectedCategory = 'All';
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Container(
          // height: 500,
          // width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          //margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          // color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Filter Buttons
              _buildFilterSection(
                ['All', 'Work', 'Home', 'Personal'],
                _selectedCategory,
                (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                  widget.onCategoryChanged(value);
                },
              ),
              SizedBox(height: 24.0),

              // Status Filter Buttons
              _buildFilterSection(
                ['All', 'In Progress', 'Missed', 'Done'],
                _selectedStatus,
                (value) {
                  setState(() {
                    _selectedStatus = value;
                  });
                  widget.onStatusChanged(value);
                },
              ),
              SizedBox(height: 24.0),

              // Date and Time Selection
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     vertical: 16.0,
              //     horizontal: 12.0,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey.shade300),
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.calendar_today,
              //         color: AppColors.primary,
              //         size: 20,
              //       ),
              //       const SizedBox(width: 8.0),
              //       Text('30 June, 2022', style: TextStyle(fontSize: 16.0)),
              //       const SizedBox(width: 8.0),
              //       // Text('•', style: TextStyle(fontSize: 16.0)),
              //       const SizedBox(width: 8.0),
              //       Text('10:00 pm', style: TextStyle(fontSize: 16.0)),
              //     ],
              //   ),
              // ),
              customCalenderContainer(),
              SizedBox(height: 24.0),

              // Filter Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: widget.onFilterPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Filter', style: TextStyle(fontSize: 18.0)),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(
    List<String> options,
    String selectedValue,
    Function(String) onChanged,
  ) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          options.map((option) {
            final isSelected = selectedValue == option;

            return Container(
              height: 40,
              child: ElevatedButton(
                onPressed: () => onChanged(option),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isSelected ? AppColors.primary : Colors.white,
                  foregroundColor: isSelected ? Colors.white : Colors.black87,
                  elevation: 0,
                  side: BorderSide(
                    color:
                        isSelected ? AppColors.primary : Colors.grey.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Text(option),
              ),
            );
          }).toList(),
    );
  }
}
