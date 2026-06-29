# platform-core

Monorepo for the platform domain model, API contracts, and services.

## Structure

```
platform-core/
  README.md
  packages/
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
        event/
    api-contracts/
      src/
        commands/
        queries/
        events/
        schemas/
    services/
      identity/
      relationships/
      communities/
      commerce/
      messaging/
      referrals/
      notifications/
  docs/
    architecture.md
    domain-model.md
  tests/
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

