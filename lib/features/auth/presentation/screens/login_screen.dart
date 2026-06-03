import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/current_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Login gate. Google sign-in is not implemented yet (see CLAUDE.md › Auth):
/// the user is already "signed in" via the dev JWT, so this just confirms the
/// identity read from that token and offers a single "Continue as `<name>`"
/// button that proceeds to workspace selection.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Reservations Manager',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              user.when(
                data: (u) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledButton(
                      onPressed: () =>
                          context.go(AppRoutes.workspaceSelection),
                      child: Text('Continue as ${u.name}'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      u.email,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                loading: () => const Text('Connecting…'),
                error: (error, _) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      error is ApiException
                          ? error.message
                          : 'Something went wrong.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => ref
                          .read(currentUserProvider.notifier)
                          .retry(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
