import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';
import 'package:p2p_car_renting/global/utils/constants.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';

class CarTile extends StatelessWidget {
  const CarTile({
    super.key,
    required this.car,
    required this.onTap,
  });

  final CarModel car;
  final ValueSetter<CarModel> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: AppConstants.borderRadius15,
      ),
      child: InkWell(
        onTap: () => onTap(car),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.make,
                style: context.ts.titleMedium?.copyWith(
                  fontSize: 25.sp,
                ),
              ),
              const SizedBox(height: 12),
              Text('${Strings.model}: ${car.model}'),
              const SizedBox(height: 12),
              Text('${Strings.price}: ${car.price}'),
              const SizedBox(height: 12),
              Text('${Strings.location}: ${car.location}'),
              const SizedBox(height: 12),
              Text('${Strings.isAvailable}: ${car.isAvailable}'),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
