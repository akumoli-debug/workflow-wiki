# workflow-wiki

A compounding knowledge base for AI innovation teams. Every project you ship makes the next one faster.

Built on Karpathy's [LLM Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), adapted from [claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian). Designed for teams that build AI-powered internal tools repeatedly — where the patterns, components, review frameworks, and design decisions should compound across projects instead of evaporating between sessions.

---

## The Problem

Your team builds a deal tracker this week, an underwriting dashboard next week, a risk report the week after. Each project:

- Solves similar subproblems (filter-responsive KPIs, conditional formatting on risk, sortable data tables)
- Makes similar design decisions (status-segmented cards vs. aggregate stats, chart placement, drawer patterns)
- Gets reviewed against similar criteria (does it answer the workflow question, are mechanics correct, is layout legible)
- Produces learnings that help nobody because they live in a chat thread that nobody reopens

This vault captures those learnings as structured, queryable, cross-referenced knowledge. The tenth project your team ships should take half the time of the first — not because people got faster at typing, but because the patterns are already documented, the review checklists already exist, and the reusable components are already cataloged.

---

## What It Does

You finish a project. You run `/ingest`. The system extracts:

- **Patterns** — reusable solutions (filter-responsive derived stats, risk-score conditional formatting, row-click detail drawers)
- **Components** — code blocks with documented props and behavior (KPI card, sortable table header, status pill)
- **Decisions** — what you chose and why (status-segmented KPIs over aggregate stats, chart below table instead of above, text-only status pills to avoid color collision with risk pills)
- **Reviews** — what the review caught, what was changed, what would be caught earlier next time
- **Rubrics** — evaluation frameworks extracted from project briefs, reusable for future projects

You start a new project. You run `/query what patterns do we have for pipeline dashboards`. The system pulls from every past project, cites specific pages, and gives you a head start.

You onboard a new teammate. They open the vault in Obsidian and see the graph of everything the team has built, how it connects, and where the hard-won lessons live.

---

## Quick Start

```bash
git clone https://github.com/[your-org]/workflow-wiki
cd workflow-wiki
bash bin/setup-vault.sh
```

Open in Obsidian: **Manage Vaults → Open folder as vault → select `workflow-wiki/`**

Open Claude Code in the same directory. Type `/wiki`.

---

## Vault Structure

```
workflow-wiki/
├── .raw/                        # Source material (read-only)
│   ├── briefs/                  # Project briefs and take-home prompts
│   ├── builds/                  # Completed project code snapshots
│   ├── reviews/                 # Review transcripts and feedback
│   └── references/              # External articles, docs, prior art
│
├── wiki/                        # AI-generated knowledge base
│   ├── index.md                 # Master catalog of all pages
│   ├── log.md                   # Chronological operation log
│   ├── hot.md                   # Recent context cache (~500 words)
│   ├── overview.md              # Executive summary of team knowledge
│   │
│   ├── projects/                # One page per shipped project
│   │   └── _index.md
│   ├── patterns/                # Reusable solutions
│   │   └── _index.md
│   ├── components/              # Documented, reusable code blocks
│   │   └── _index.md
│   ├── decisions/               # Design decisions with rationale
│   │   └── _index.md
│   ├── rubrics/                 # Evaluation and review frameworks
│   │   └── _index.md
│   ├── antipatterns/            # What failed and why
│   │   └── _index.md
│   ├── stack/                   # Tools, libraries, APIs used
│   │   └── _index.md
│   └── meta/                    # Dashboards, lint reports, conventions
│       └── dashboard.md
│
├── _templates/                  # Obsidian Templater templates
│   ├── project.md
│   ├── pattern.md
│   ├── component.md
│   ├── decision.md
│   ├── rubric.md
│   └── antipattern.md
│
├── CLAUDE.md                    # Project instructions for Claude Code
├── WIKI.md                      # Full schema reference
└── bin/
    └── setup-vault.sh           # One-time vault configuration
```

---

## The Six Page Types

### Projects
One page per shipped build. Links to every pattern used, component created, decision made.

```yaml
---
type: project
title: "Deal Tracker Dashboard"
created: 2026-04-20
status: shipped
brief: "[[.raw/briefs/deal-tracker-challenge.pdf]]"
stack: [React, Tailwind, Lucide]
time_constraint: "30 minutes"
patterns_used:
  - "[[Filter-Responsive Derived Stats]]"
  - "[[Risk-Score Conditional Formatting]]"
  - "[[Row-Click Detail Drawer]]"
components_created:
  - "[[KPI Status Card]]"
  - "[[Sortable Table Header]]"
decisions:
  - "[[Status-Segmented KPIs Over Aggregate Stats]]"
review_score: 4/5
---
```

### Patterns
Reusable solutions that transfer across projects. Named by what they solve, not how they're implemented.

```yaml
---
type: pattern
title: "Filter-Responsive Derived Stats"
created: 2026-04-20
status: proven
complexity: intermediate
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - dashboard
  - state-management
---

## Problem
Dashboard summary stats should reflect current filters, not the full dataset.

## Solution
Derive all stats from the same `filtered` array via useMemo. KPIs, table, and chart
all consume this single source of truth.

## Why It Matters
Users expect what they see in the table to match what they see in the KPIs.
If the KPI shows $1.4M but the table only shows 7 Under Review deals worth $585K,
the dashboard is lying.

## Implementation Notes
- Create filtered array first, then derive everything downstream
- Default sort should also operate on filtered, not raw data
- Empty state needs to propagate: if filtered is empty, KPIs show zero and chart
  shows an empty state message, not flat bars

## First Used
[[Deal Tracker Dashboard]] — April 2026
```

### Components
Documented code blocks. Not a component library — more like a recipe book with context.

```yaml
---
type: component
title: "KPI Status Card"
created: 2026-04-20
status: stable
framework: React
props: [label, value, count, accentColor]
projects_used:
  - "[[Deal Tracker Dashboard]]"
---
```

### Decisions
Architecture Decision Records, lightweight. What you chose, what you didn't, and why.

```yaml
---
type: decision
title: "Status-Segmented KPIs Over Aggregate Stats"
created: 2026-04-20
project: "[[Deal Tracker Dashboard]]"
status: active
---

## Context
Dashboard needs 3 KPI cards. Obvious approach: total pipeline, deal count, avg risk.

## Decision
Show pipeline value segmented by status: Funded / Under Review / Declined as three
separate cards.

## Why
In lending the dollars are the signal, not the deal count. A sales lead glancing at
the dashboard should immediately know how much is stuck in Under Review without
clicking anything. Aggregate stats require interaction to answer that question.

## Trade-off
Loses the avg risk score from the top-level view. Mitigated by adding a secondary
summary line below the cards that shows total, count, and avg risk in a compact row.
```

### Rubrics
Evaluation frameworks extracted from project briefs and review sessions.

```yaml
---
type: rubric
title: "Internal Dashboard Review Checklist"
created: 2026-04-20
status: developing
projects_applied:
  - "[[Deal Tracker Dashboard]]"
---

## 1. Does it answer the workflow question?
- Can the user answer their core question on first paint, without interaction?
- Are the KPIs informative or just decorative?
- Does filtering update everything, or just the table?

## 2. Are the core mechanics correct?
- Status filter actually filters
- Search works (case-insensitive, trimmed)
- Numeric sort works for amounts and scores
- Date sort converts to timestamps, not string comparison
- Chart sums values correctly

## 3. Is the layout legible?
- Summary above controls above working surface
- Chart supports the table, doesn't compete with it
- Currency formatting uses tabular-nums for column alignment
- Conditional formatting colors don't collide with status colors
```

### Antipatterns
What failed. Equally valuable as patterns — maybe more, because they prevent repeat mistakes.

```yaml
---
type: antipattern
title: "Date Sorting as String Comparison"
severity: high
caught_in: "[[Deal Tracker Dashboard]]"
---

## What Happened
Dates stored as ISO strings (YYYY-MM-DD). Sorting with `av - bv` on strings
produces NaN. Sort silently breaks — no error, just wrong order.

## Fix
Convert to timestamps before comparison: `new Date(av).getTime()`

## Prevention
Any sortable column that isn't a number needs explicit type coercion in the
sort comparator. Add to the review checklist.
```

---

## Commands

| You say | The vault does |
|---|---|
| `/wiki` | Setup check, scaffold, or continue where you left off |
| `ingest [project]` | Read project artifacts, extract patterns/components/decisions, update index |
| `what patterns do we have for X?` | Search index → relevant pages → synthesized answer with citations |
| `lint the wiki` | Health check: orphan pages, missing cross-references, stale patterns |
| `update hot cache` | Refresh hot.md with latest context |
| `/save` | File the current conversation as a wiki note |

---

## Cross-Project Access

Point any Claude Code project at this vault. Add to that project's `CLAUDE.md`:

```markdown
## Workflow Knowledge Base
Path: ~/path/to/workflow-wiki

Before starting a new build:
1. Read wiki/hot.md (recent context)
2. Read wiki/index.md (full catalog)
3. Query relevant patterns: wiki/patterns/_index.md
4. Check relevant antipatterns: wiki/antipatterns/_index.md
5. Review applicable rubrics: wiki/rubrics/_index.md

Do NOT read the wiki for generic coding questions.
Use it for: "have we solved this before?" and "what should I watch out for?"
```

---

## How Knowledge Compounds

**Project 1 (Deal Tracker):** Everything is new. You build filter-responsive stats, conditional formatting, a detail drawer. Takes 25 minutes.

**Project 3 (Merchant Risk Report):** You query the vault. Filter-responsive stats is a proven pattern. Conditional formatting on risk scores — already documented with the color collision antipattern. The review rubric for internal dashboards already exists. You ship in 15 minutes and the review catches nothing new.

**Project 10 (Underwriting Pipeline v2):** The vault has 30 patterns, 15 components, 8 antipatterns, and 4 rubrics. A new team member opens Obsidian, sees the graph, reads the three highest-priority antipatterns, and ships a clean build on day one.

That's the compound interest.

---

## Adapting This

This vault is designed for any AI innovation team's workflow, and the structure works for any team that ships repeatedly in the same domain:

- **Design teams**: patterns become design patterns, components become UI primitives, decisions become design rationale
- **Data teams**: patterns become pipeline patterns, antipatterns become data quality traps, rubrics become validation checklists
- **Sales ops teams**: patterns become playbook moves, decisions become positioning choices, rubrics become deal review frameworks

The taxonomy (projects / patterns / components / decisions / rubrics / antipatterns) is the transferable structure. The content is yours.

---

*Adapted from [claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian) by AgriciDaniel. Built for teams that ship.*
