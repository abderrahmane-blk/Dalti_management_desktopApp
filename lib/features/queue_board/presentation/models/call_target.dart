import 'package:flutter/foundation.dart';

/// Where "Call next" should direct the person being called.
///
/// UI-only for now: the call endpoints (`/queue-server/{id}/call-next` and
/// `/call/{turn}`) take no target service point, so the selection is remembered
/// but does not yet change the request. The concrete service points are
/// placeholders until the service-points endpoints are wired.
// TODO(call-to): once the backend call endpoints accept a target service point
// (or once shifts decide it), feed the selected [CallTarget] into the call
// request in `QueueBoard.smartCallNext` / `callTurn`. For [AskEachCall], prompt
// the operator to pick a service point at call time.
@immutable
sealed class CallTarget {
  const CallTarget();

  /// Label shown in the dropdown / header.
  String get label;
}

/// Don't associate the call with any service point (the default).
class DontCallToServicePoint extends CallTarget {
  const DontCallToServicePoint();
  @override
  String get label => "Don't call to a service point";
}

/// Ask which service point to call to, each time.
class AskEachCall extends CallTarget {
  const AskEachCall();
  @override
  String get label => 'Ask each time';
}

/// Always call to one specific service point.
class SpecificServicePoint extends CallTarget {
  const SpecificServicePoint({required this.id, required this.name});

  final int id;
  final String name;

  @override
  String get label => name;

  @override
  bool operator ==(Object other) =>
      other is SpecificServicePoint && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// Placeholder service points so the three-way control is visible and clickable
/// before the service-points endpoints are wired.
// TODO(service-points): replace with the queue's real service points from
// `GET /queues/{queueId}/service-points` once that fetch is implemented.
const List<SpecificServicePoint> kPlaceholderServicePoints = [
  SpecificServicePoint(id: -1, name: '[Service point A] (placeholder)'),
  SpecificServicePoint(id: -2, name: '[Service point B] (placeholder)'),
];
