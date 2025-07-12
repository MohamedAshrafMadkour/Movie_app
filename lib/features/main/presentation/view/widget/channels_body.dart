import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/channels_cubit/channels_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_picker.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';

class ChannelsBody extends StatelessWidget {
  const ChannelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChannelsCubit(getIt.get<MainRepo>()),
      child: const ChannelsBodyOverAll(),
    );
  }
}

class ChannelsBodyOverAll extends StatefulWidget {
  const ChannelsBodyOverAll({super.key});

  @override
  State<ChannelsBodyOverAll> createState() => _ChannelsBodyOverAllState();
}

class _ChannelsBodyOverAllState extends State<ChannelsBodyOverAll> {
  String selectedCountryCode = 'EG';

  void _selectCountry() {
    CountryPicker.show(context, (code) {
      setState(() {
        selectedCountryCode = code;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: ChannelsHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),
              child: CustomCountryButton(
                onPressed: _selectCountry,
                title:
                    'Select Country (${CountryPicker.countries[selectedCountryCode] ?? selectedCountryCode})',
              ),
            ),
          ),
          ChannelsList(countryCode: selectedCountryCode),
        ],
      ),
    );
  }
}
