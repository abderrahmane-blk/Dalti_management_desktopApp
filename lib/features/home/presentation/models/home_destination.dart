import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';

/// What the home content area is showing, chosen from the sidebar.
///
/// Only [QueueTodayDestination] is implemented (the Today board); the rest are
/// placeholders for now. Queue destinations carry their [ManagedQueue] so the
/// target screen has the queue id and name.
sealed class HomeDestination {
  const HomeDestination();
}

class QueueTodayDestination extends HomeDestination {
  const QueueTodayDestination(this.queue);
  final ManagedQueue queue;
}

class QueueHistoryDestination extends HomeDestination {
  const QueueHistoryDestination(this.queue);
  final ManagedQueue queue;
}

class QueueWalkInDestination extends HomeDestination {
  const QueueWalkInDestination(this.queue);
  final ManagedQueue queue;
}

class QueueFutureDestination extends HomeDestination {
  const QueueFutureDestination(this.queue);
  final ManagedQueue queue;
}

class OrgEditDestination extends HomeDestination {
  const OrgEditDestination();
}

class OrgStatisticsDestination extends HomeDestination {
  const OrgStatisticsDestination();
}

class SettingsDestination extends HomeDestination {
  const SettingsDestination();
}
