import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mediq_webapp/_core/widgets/primary_button.dart';
import 'package:mediq_webapp/features/user_info/widget/birth_date_field.dart';
import 'package:mediq_webapp/features/user_info/widget/gender_selector.dart';
import 'user_info_viewmodel.dart';

class UserInfoPage extends ConsumerWidget {
  const UserInfoPage({super.key});

  Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 30),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      ref.read(userInfoProvider.notifier).updateBirthDate(picked);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userInfoProvider);
    final vm = ref.read(userInfoProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('기본 정보 입력')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '이름',
                        hintText: '홍길동',
                      ),
                      onChanged: vm.updateName,
                    ),
                    const SizedBox(height: 24),

                    BirthDateField(
                      value: state.birthDate,
                      onTap: () => _pickDate(context, ref),
                    ),
                    const SizedBox(height: 24),

                    const Text('성별'),
                    const SizedBox(height: 8),

                    GenderSelector(
                      selected: state.gender,
                      onChanged: vm.updateGender,
                    ),
                  ],
                ),
              ),

              PrimaryButton(
                label: '다음',
                onPressed: state.isValid
                    ? () {
                        context.go('/questionnaire');
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
