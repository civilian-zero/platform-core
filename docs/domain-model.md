# Domain Model

Industry-neutral platform primitives for a multi-tenant relationship-commerce platform.

Data model rules: `platform-docs/docs/standards/DATA_MODEL_RULES.md`

## Primitives

| Primitive | Folder | Description |
|---|---|---|
| User | `domain/src/user` | Human or service account |
| Organization | `domain/src/organization` | Tenant / business account |
| Community | `domain/src/community` | Group, cohort, or audience |
| Relationship | `domain/src/relationship` | Directed link between actors |
| Activity | `domain/src/activity` | Bookable unit of work |
| Offer | `domain/src/offer` | Priceable capability |
| Transaction | `domain/src/transaction` | Payment, refund, or payout |
| Conversation | `domain/src/conversation` | Communication thread |
| Referral | `domain/src/referral` | Invite and attribution |
| Affiliate | `domain/src/affiliate` | Commission-bearing promotion |
| CalendarEvent | `domain/src/calendar-event` | Scheduled occurrence |
| ReputationSignal | `domain/src/reputation-signal` | Review, rating, or trust signal |

## Cross-cutting kernel

Shared concepts live in `packages/kernel`, not in domain primitives:

- TenantContext
- ActorRef
- PermissionScope
- DomainEventEnvelope
- AuditRecord

## Tenant ownership

Every tenant-sensitive record includes:

- `organization_id` or `tenant_id`
- `created_at`, `updated_at`
- `created_by` when appropriate
- `deleted_at` when soft deletion applies

## Relationship types

The platform supports many relationship semantics through a single Relationship primitive:

- Provider ↔ customer
- Follow
- Referral
- Membership
- Business ↔ provider
- Customer ↔ customer

## Commerce model

Commerce composes three primitives:

- **Offer** — what can be sold (one-time, subscription, package, credit)
- **Activity** — what gets delivered or booked
- **Transaction** — money movement (capture, refund, payout)

## Event naming

Domain events use past-tense dot notation:

- `user.created`
- `relationship.created`
- `activity.booked`
- `transaction.completed`
- `referral.converted`

Every event payload includes: `event_id`, `tenant_id`, `aggregate_type`, `aggregate_id`, `occurred_at`, `actor_id`, `correlation_id`.
