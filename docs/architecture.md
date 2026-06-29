# Architecture

platform-core implements Layer 1 of the Platform Constitution: reusable platform primitives and services for a multi-tenant relationship-commerce platform.

Canonical constitution: `platform-docs/docs/constitution/PLATFORM_CONSTITUTION.md`

## Layers

| Layer | Location | Examples |
|---|---|---|
| Platform Core | platform-core | User, Relationship, Offer, Transaction |
| Application Layer | famm-app | Fitness workflows, trainer dashboards |
| User Experience | Mobile/web/SMS/voice | UI, agents, API consumers |

## Package layout

```
packages/
  kernel/          Shared IDs, tenant context, event envelopes, errors
  domain/          Pure domain model by primitive
  api-contracts/   Commands, queries, events, schemas by bounded context
  services/        Deployable bounded contexts
```

## Service map

| Service | Owns | Domain events (examples) |
|---|---|---|
| identity | User, Organization, org membership | user.created, organization.created |
| relationships | Relationship graph | relationship.created, relationship.ended |
| communities | Community, membership, roles | community.created, community.joined |
| commerce | Offer, Activity booking, Transaction | offer.created, activity.booked, transaction.completed |
| messaging | Conversation, messages | conversation.started, message.sent |
| referrals | Referral, Affiliate attribution | referral.created, referral.converted |
| notifications | Delivery orchestration | notification.sent, notification.failed |

## Graphs

Platform primitives compose into graphs defined by the constitution:

- **Relationship Graph** — Relationship
- **Community Graph** — Community, Relationship
- **Commerce Graph** — Offer, Activity, Transaction
- **Referral Graph** — Referral, Affiliate
- **Reputation Graph** — ReputationSignal
- **Activity Graph** — Activity, CalendarEvent

## Integration rules

- Services own their aggregate writes and emit domain events.
- No cross-service database joins; use queries and events.
- Notifications react to events; notifications do not own business truth.
- Every command and query runs within a resolved tenant context.

## Architectural principles

1. Relationships over workflows
2. Communities over organizations (Organization = tenant; Community = network)
3. Commerce over transactions
4. Platform primitives over industry-specific abstractions
5. APIs before interfaces
6. Events before screens
7. Multi-tenant before single-tenant
