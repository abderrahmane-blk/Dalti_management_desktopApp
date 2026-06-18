import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/current_user_notifier.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/google_sign_in_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Login gate.
///
/// Two ways in:
///   • **Sign in with Google** — the real desktop OAuth flow (loopback + PKCE):
///     opens the browser, exchanges the code with the backend's
///     `POST /auth/google`, and stores the returned JWT.
///   • **Continue as dev** — the dev shim: the app is already "signed in" via
///     the seeded dev JWT, so this just proceeds to workspace selection.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final signIn = ref.watch(googleSignInProvider);
    final signingIn = signIn.isLoading;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Reservations Manager',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),

              // ── Google sign-in ───────────────────────────────────────────
              FilledButton.icon(
                onPressed: signingIn ? null : () => _signInWithGoogle(context, ref),
                icon: signingIn
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.login),
                label: Text(signingIn ? 'Signing in…' : 'Sign in with Google'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(44),
                ),
              ),
              if (signIn.hasError) ...[
                const SizedBox(height: 8),
                Text(
                  signIn.error is ApiException
                      ? (signIn.error as ApiException).message
                      : 'Google sign-in failed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'or',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),

              // ── Dev path ─────────────────────────────────────────────────
              user.when(
                data: (u) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _DevButton(
                      label: 'Continue as dev (${u.name})',
                      onPressed: signingIn
                          ? null
                          : () => context.go(AppRoutes.workspaceSelection),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      u.email,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                loading: () => const _DevButton(
                  label: 'Connecting…',
                  onPressed: null,
                ),
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
                      onPressed: () =>
                          ref.read(currentUserProvider.notifier).retry(),
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

  Future<void> _signInWithGoogle(BuildContext context, WidgetRef ref) async {
    final ok = await ref.read(googleSignInProvider.notifier).signIn();
    if (ok && context.mounted) {
      context.go(AppRoutes.workspaceSelection);
    }
  }
}

/// The neutral grey "Continue as dev" button — visually secondary to the
/// primary Google button above it.
class _DevButton extends StatelessWidget {
  const _DevButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        backgroundColor: scheme.surfaceContainerHighest,
        foregroundColor: scheme.onSurfaceVariant,
      ),
      child: Text(label),
    );
  }
}
