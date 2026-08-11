abstract class OnboardingEvent {}

class OnboardingPageChanged extends OnboardingEvent {
  final int index;

  OnboardingPageChanged(this.index);
}

class OnboardingNextPressed extends OnboardingEvent {}

class OnboardingSkipPressed extends OnboardingEvent {}