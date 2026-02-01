import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mediq_webapp/_core/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool agreePrivacy = false;
  bool agreeHealth = false;

  bool get canStart => agreePrivacy && agreeHealth;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'MediQ 건강문진',
                        textAlign: TextAlign.center,
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '본 문진표는 건강검진을 위한 사전 설문입니다.\n'
                        '작성에는 약 3~5분 정도 소요됩니다.',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('(필수) 개인정보 수집 및 이용에 동의합니다.'),
                value: agreePrivacy,
                onChanged: (v) => setState(() => agreePrivacy = v ?? false),
              ),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('(필수) 건강정보 제공에 동의합니다.'),
                value: agreeHealth,
                onChanged: (v) => setState(() => agreeHealth = v ?? false),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: '시작하기',
                onPressed: canStart
                    ? () {
                        context.go('/user-info');
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
