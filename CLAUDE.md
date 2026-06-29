# Claude Code Instructions

You are working in platform-core.

This repository owns reusable platform infrastructure for a multi-tenant relationship-commerce platform.

You must follow these rules:

1. Do not introduce Famm-specific, fitness-specific, trainer-specific, gym-specific, or workout-specific concepts into platform-core unless an ADR explicitly approves it.

2. Prefer these platform primitives:

- User
- Organization
- Community
- Relationship
- Activity
- Offer
- Transaction
- Conversation
- Referral
- Affiliate
- Event (folder: calendar-event)
- ReputationSignal

3. All tenant-sensitive models must include tenant ownership.

4. All major business actions should emit domain events.

5. APIs should be reusable by multiple industries.

6. Before changing schema or architecture, run the platform review framework from:

.ai/prompts/platform-review.md

7. Before creating or changing data models, run:

.ai/prompts/data-model-review.md

8. If a proposed change only benefits Famm, recommend implementing it in famm-app instead.

Always explain the layer classification before making significant changes.
