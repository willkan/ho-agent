# Stage vs Storyline Relationship

## Conceptual Relationship

```ascii
┌─────────────────────────────────────────────────────────────────┐
│                   STAGE vs STORYLINE                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  STAGES = Workflow Phases (Horizontal Process)                  │
│  STORYLINES = User Journeys (Vertical Slices)                  │
│                                                                  │
│  Stages:     Planning → Development → Testing → Deployment      │
│                   ↓           ↓           ↓          ↓         │
│  Storylines:  [━━━━━ User Auth Storyline ━━━━━━━━━━━━]        │
│               [━━━━━ Product Browse Storyline ━━━━━━━]        │
│               [━━━━━ Shopping Cart Storyline ━━━━━━━━]        │
│                                                                  │
│  Each Storyline flows THROUGH multiple Stages                   │
│  Each Stage processes MULTIPLE Storylines                       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Detailed Execution Flow

```ascii
┌──────────────────────────────────────────────────────────────────────────┐
│                        WORKFLOW EXECUTION MATRIX                         │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│   STAGES (Process Phases)          STORYLINES (User Journeys)           │
│        ↓                                    ↓                           │
│                                                                          │
│  ┌─────────────┐     ┌──────────────────────────────────────┐          │
│  │  Stage 0    │────▶│  Requirements Clarification           │          │
│  │ Requirements│     │  (Conversation about ALL storylines)  │          │
│  └─────────────┘     └──────────────────────────────────────┘          │
│         ↓                                                               │
│  ┌─────────────┐     ┌──────────────────────────────────────┐          │
│  │  Stage 1    │────▶│  Generate Storyline Breakdown:        │          │
│  │  Planning   │     │  • User Auth     • Product Browse     │          │
│  │             │     │  • Shopping Cart • Checkout           │          │
│  └─────────────┘     └──────────────────────────────────────┘          │
│         ↓                          ↓                                    │
│                      🛑 HUMAN APPROVAL for Storylines                  │
│         ↓                          ↓                                    │
│  ┌─────────────┐     ┌──────────────────────────────────────┐          │
│  │  Stage 2-3  │────▶│  Priority 1 Storylines:              │          │
│  │ Development │     │  ┌─────┐ ┌─────┐ ┌─────┐            │          │
│  │             │     │  │Auth │ │Browse│ │Static│           │          │
│  │             │     │  └─────┘ └─────┘ └─────┘            │          │
│  │             │     │         (Developed in parallel)       │          │
│  │             │     ├──────────────────────────────────────┤          │
│  │             │     │  Priority 2 Storylines:              │          │
│  │             │     │      ┌─────┐ ┌─────┐                │          │
│  │             │     │      │Cart │ │Orders│                │          │
│  │             │     │      └─────┘ └─────┘                │          │
│  │             │     │    (After P1 complete)               │          │
│  │             │     ├──────────────────────────────────────┤          │
│  │             │     │  Priority 3 Storylines:              │          │
│  │             │     │         ┌─────────┐                  │          │
│  │             │     │         │Checkout │                  │          │
│  │             │     │         └─────────┘                  │          │
│  └─────────────┘     └──────────────────────────────────────┘          │
│         ↓                                                               │
│  ┌─────────────┐     ┌──────────────────────────────────────┐          │
│  │  Stage 4    │────▶│  Test ALL Storylines Integration     │          │
│  │   Testing   │     │  Validate cross-storyline flows      │          │
│  └─────────────┘     └──────────────────────────────────────┘          │
│         ↓                                                               │
│  ┌─────────────┐     ┌──────────────────────────────────────┐          │
│  │  Stage 5-7  │────▶│  Integrate, Document, Deploy         │          │
│  │ Finalization│     │  ALL Storylines as complete system   │          │
│  └─────────────┘     └──────────────────────────────────────┘          │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

## Key Relationships

```ascii
┌─────────────────────────────────────────────────────────────┐
│                    KEY RELATIONSHIPS                         │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  1. STAGES are WORKFLOW PHASES:                             │
│     • Sequential process steps                              │
│     • Apply to entire project                               │
│     • Horizontal progression                                │
│                                                               │
│  2. STORYLINES are USER FEATURES:                           │
│     • Complete user journeys                                │
│     • Vertical slices (UI + API + Data)                    │
│     • Can be developed in parallel (if no dependencies)     │
│                                                               │
│  3. INTERSECTION:                                            │
│     Stage 1: DEFINES all storylines                         │
│     Stage 2-3: IMPLEMENTS storylines (by priority)          │
│     Stage 4: VALIDATES storylines work together             │
│     Stage 5-7: PACKAGES all storylines for production       │
│                                                               │
└─────────────────────────────────────────────────────────────┐
```

## Example: E-commerce Platform

```ascii
┌──────────────────────────────────────────────────────────────┐
│                  E-COMMERCE EXAMPLE                          │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│  Stage 0: "What kind of e-commerce platform?"               │
│           "B2C, mobile-responsive, MVP features"             │
│                          ↓                                   │
│  Stage 1: Planning generates storylines:                     │
│           ┌─────────────────────────────────┐               │
│           │ • User Registration & Login     │               │
│           │ • Browse Products & Search      │               │
│           │ • Shopping Cart Management      │               │
│           │ • Checkout & Payment            │               │
│           │ • Order History                 │               │
│           └─────────────────────────────────┘               │
│                          ↓                                   │
│  Stage 2-3: Development by storyline priority:               │
│                                                               │
│    Week 1: P1 Storylines (parallel)                         │
│    ┌──────────────┬────────────────┬──────────────┐        │
│    │ User Auth    │ Product Browse │ Static Pages │        │
│    │ • Frontend   │ • Frontend     │ • About      │        │
│    │ • Backend    │ • Backend      │ • Contact    │        │
│    │ • Testing    │ • Testing      │ • Terms      │        │
│    └──────────────┴────────────────┴──────────────┘        │
│                          ↓                                   │
│    Week 2: P2 Storylines (needs P1)                         │
│    ┌──────────────────┬──────────────────┐                 │
│    │ Shopping Cart    │ Order Management │                 │
│    │ • Add/Remove     │ • Create Order    │                 │
│    │ • Update Qty     │ • View History    │                 │
│    │ • Calculate      │ • Track Status    │                 │
│    └──────────────────┴──────────────────┘                 │
│                          ↓                                   │
│    Week 3: P3 Storylines (needs P2)                         │
│    ┌─────────────────────────────────────┐                 │
│    │ Checkout Process                     │                 │
│    │ • Shipping Address                   │                 │
│    │ • Payment Method                     │                 │
│    │ • Order Confirmation                 │                 │
│    └─────────────────────────────────────┘                 │
│                                                               │
│  Stage 4-7: Test integration → Deploy all storylines         │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

## Summary

```ascii
┌─────────────────────────────────────────────────────────────┐
│                         SUMMARY                              │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  STAGES:                                                     │
│  • ARE the development process (HOW we build)               │
│  • Sequential phases everyone goes through                   │
│  • 0→1→2→3→4→5→6→7                                         │
│                                                               │
│  STORYLINES:                                                 │
│  • ARE the features we build (WHAT we build)                │
│  • User journeys that create value                          │
│  • Can be parallel if independent                           │
│                                                               │
│  RELATIONSHIP:                                               │
│  • Stage 1 CREATES the storyline plan                       │
│  • Stages 2-3 EXECUTE storylines by priority               │
│  • Stages 4-7 INTEGRATE all storylines                     │
│                                                               │
│  Think of it as:                                            │
│  "Stages are the RECIPE STEPS"                             │
│  "Storylines are the INGREDIENTS"                          │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```