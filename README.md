# flutter_shared_ui

ChimeraNext shared Flutter UI monorepo.

- `packages/shared_ui_core` — backend selector (`material`/`fluent`/`cupertino` via `material_ui`/`fluent_2`) + centralized style-dictionary `tokens.json` reader (`TokensReader` + `DesignTokenModel`).
- `packages/vertivolatam_ui` — Vertivo brand (tokens + typed accessors).

Brand packages to come (same pattern — own `tokens.json` + thin accessor over core):
- `packages/altrupets_ui`
- `packages/habitanexus_ui`
- `packages/aduanext_ui`

Rule: parsing logic lives in core **once**; brands only ship tokens + accessors.
