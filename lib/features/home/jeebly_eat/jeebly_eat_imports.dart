
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../../core/bloc/base_bloc.dart';
import '../../../core/http/either.dart';
import '../../../core/http/failure.dart';
import '../../../core/http/generic_data_source.dart';
import '../../../core/widgets/item_single_image.dart';
import '../../../l10n/app_localizations.dart';
import '../home_tap/views/widgets/all_restaurants.dart';
import '../home_tap/views/widgets/item.dart';
import '../home_tap/views/widgets/unique_restaurants.dart';

part 'presentation/widgets/eat_categories.dart';
part 'presentation/screens/jeebly_eat.dart';
part 'manager/eat_category_bloc/eat_category_bloc.dart';
part 'manager/eat_category_bloc/eat_category_event.dart';
part 'datasource/eat_category_datasource.dart';
part 'model/eat_category_model.dart';
