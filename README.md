# platform-core

## Platform Rule

Before making architecture, schema, API, or feature decisions, read:

platform-docs/docs/constitution/PLATFORM_CONSTITUTION.md

Famm is the first application built on the platform. It is not the platform itself.

Monorepo for the platform domain model, API contracts, and services.

## Structure

```
platform-core/
  README.md
  CLAUDE.md
  .ai/prompts/
  .cursor/rules/
  packages/
    kernel/
      src/
        tenant/
        identity/
        permissions/
        audit/
        events/
        errors/
        time/
        money/
    domain/
      src/
        user/
        organization/
        community/
        relationship/
        activity/
        offer/
        transaction/
        conversation/
        referral/
        affiliate/
        calendar-event/
        reputation-signal/
    api-contracts/
      src/
        schemas/
          shared/
          identity/
          relationships/
          communities/
          commerce/
          messaging/
          referrals/
          notifications/
        commands/
          identity/
          ...
        queries/
          identity/
          ...
        events/
          identity/
          ...
    services/
      identity/
        src/
        tests/
      relationships/
      communities/
      commerce/
      messaging/
      referrals/
      notifications/
  docs/
    architecture.md
    domain-model.md
    adr/
  tests/
    integration/
    contract/
    permissions/
    fixtures/
```

## Branch protection

`main` is protected with a repository ruleset (see `.github/rulesets/main-protection.json`):

- Require pull request before merge
- Require status checks before merge (`CI / validate`)
- Require conversation resolution before merge
- Require linear history
- Block force pushes
- Block direct commits to main

After pushing these files to GitHub, run the **Apply branch protection** workflow from the Actions tab once. It uses the repository `GITHUB_TOKEN` with `administration: write` permission.

Alternatively, run locally with a token that has admin access:

```bash
GITHUB_TOKEN=ghp_... ./.github/scripts/apply-branch-protection.sh
```

