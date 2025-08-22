# HO-Agent Workflow Execution Guide

## Overview: Storyline-Driven Development Orchestration

```ascii
┌─────────────────────────────────────────────────────────────┐
│         STORYLINE-DRIVEN WORKFLOW ORCHESTRATION              │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  User: "按照workflow开发[项目]"                              │
│              ↓                                                │
│  Stage 0: Requirements Clarification (Conversation)           │
│              ↓                                                │
│  Stage 1: Generate Storyline Dependency Graph                 │
│              ↓                                                │
│  ┌─────────────────────────────────────────────────────┐    │
│  │  Priority 1: Foundation Storylines (Parallel)        │    │
│  │  ┌──────┐  ┌──────┐  ┌──────┐                      │    │
│  │  │Auth  │  │Browse│  │Static│                      │    │
│  │  └──┬───┘  └──┬───┘  └──┬───┘                      │    │
│  │     └─────────┼──────────┘                          │    │
│  │               ▼                                      │    │
│  │  Priority 2: Integration Storylines                  │    │
│  │         ┌──────────┐                                │    │
│  │         │Cart+Order│                                │    │
│  │         └────┬─────┘                                │    │
│  │              ▼                                      │    │
│  │  Priority 3: Top-Layer Storylines                   │    │
│  │         ┌──────────┐                                │    │
│  │         │ Checkout │                                │    │
│  │         └──────────┘                                │    │
│  └─────────────────────────────────────────────────────┘    │
│              ↓                                                │
│  Progressive Integration: Bottom-up, Layer by Layer           │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

## 🎯 Storyline-Driven Development Process

### What is a Storyline?
A **storyline** is a complete user journey through the system, NOT a technical task:
- ✅ "User browses and purchases products" (complete flow)
- ❌ "Create product API endpoint" (technical fragment)

### Storyline Breakdown Process

```ascii
┌──────────────────────────────────────────┐
│  Stage 1: Storyline Generation           │
│  After requirements & architecture       │
└────────────────┬─────────────────────────┘
                 ↓
    ┌────────────────────────────┐
    │  Project Manager Agent      │
    │  Generates:                 │
    │  • User storylines list     │
    │  • Dependency graph         │
    │  • Priority layers          │
    │  • Integration sequence     │
    └────────────┬───────────────┘
                 ↓
    ┌────────────────────────────┐
    │  Human Approval Gate       │
    │  User reviews & approves    │
    │  storyline breakdown        │
    └────────────┬───────────────┘
                 ↓
    ┌────────────────────────────┐
    │  Progressive Development   │
    │  Bottom-up integration      │
    │  Layer by layer validation  │
    └────────────────────────────┘
```

## Stage-by-Stage Execution with Storylines

### Stage 0: Requirements Clarification (Conversation)

```ascii
┌──────────────────────────────────────────┐
│  Main Claude (Direct Conversation)       │
│  NOT using Task tool - Direct dialogue   │
└────────────────┬─────────────────────────┘
                 ↓
    Questions to User:
    • "What are you building?"
    • "Who are the target users?"
    • "Core features for MVP?"
    • "Technical constraints?"
                 ↓
    User confirms: "需求清楚了"
                 ↓
```

### Stage 1: Planning, Design & Storyline Generation

```ascii
┌──────────────────────────────────────────┐
│  Planning Phase (Sequential Tasks)       │
└────────────────┬─────────────────────────┘
                 ↓
    [Task: Requirements Analyst]
    Creates: docs/requirements.md
                 ↓
    [Task: Technical Architect]
    Creates: docs/architecture.md, api-spec.yaml
                 ↓
    [Task: UX Designer]
    Creates: docs/ux-design.md, component-specs.md
                 ↓
    ┌─────────────────────────────────────┐
    │  [Task: Project Manager]            │
    │  CRITICAL: Storyline Generation     │
    │  • Analyzes all docs                │
    │  • Generates storyline breakdown    │
    │  • Creates dependency graph         │
    │  • Defines integration sequence     │
    └────────────┬────────────────────────┘
                 ↓
    ┌─────────────────────────────────────┐
    │  📊 Storyline Presentation to User  │
    │                                     │
    │  Priority 1 (Foundation):           │
    │  ├─ User Authentication            │
    │  ├─ Product Browsing               │
    │  └─ Static Pages                   │
    │                                     │
    │  Priority 2 (Integration):          │
    │  └─ Shopping Cart & Orders         │
    │                                     │
    │  Priority 3 (Top Layer):            │
    │  └─ Checkout & Payment             │
    │                                     │
    │  [ASCII Dependency Graph]           │
    └────────────┬────────────────────────┘
                 ↓
    🛑 HUMAN APPROVAL GATE
    User: "Storylines look good, proceed"

### Stage 2-3: Storyline-Based Development

```ascii
┌──────────────────────────────────────────┐
│  Progressive Storyline Implementation    │
└────────────────┬─────────────────────────┘
                 ↓
    ╔══════════════════════════════════╗
    ║  Priority 1 Storylines (Parallel) ║
    ╠══════════════════════════════════╣
    ║  For each foundation storyline:  ║
    ║  1. Frontend Dev implements UI   ║
    ║  2. Backend Dev implements API   ║
    ║  3. QA validates storyline       ║
    ║  4. Integration test passes      ║
    ╚═════════════╤════════════════════╝
                  ↓
    ╔══════════════════════════════════╗
    ║  Priority 2 Storylines           ║
    ╠══════════════════════════════════╣
    ║  Build on P1 foundation:         ║
    ║  • Shopping Cart (needs Products)║
    ║  • Order Management (needs Auth) ║
    ╚═════════════╤════════════════════╝
                  ↓
    ╔══════════════════════════════════╗
    ║  Priority 3 Storylines           ║
    ╠══════════════════════════════════╣
    ║  Top-layer features:             ║
    ║  • Checkout (needs Cart+Orders)  ║
    ║  • Payment Processing            ║
    ╚══════════════════════════════════╝
```

#### Example: Developing "User Authentication" Storyline

```ascii
┌────────────────────────────────────────┐
│  Storyline: User Authentication        │
├────────────────────────────────────────┤
│  Orchestrator delegates:               │
│                                        │
│  [Task: Frontend Developer]            │
│  "Implement auth UI: login, register,  │
│   password reset, profile management"  │
│              ↓                         │
│  [Task: Backend Developer]             │
│  "Implement auth API: JWT, validation, │
│   session management, security"        │
│              ↓                         │
│  [Task: QA Engineer]                   │
│  "Validate complete auth flow works"   │
│              ↓                         │
│  ✅ Storyline Complete & Tested        │
└────────────────────────────────────────┘
```

### Stage 4-7: Integration, Quality & Deployment

```ascii
┌──────────────────────────────────────────┐
│  System-Level Integration & Validation   │
└────────────────┬─────────────────────────┘
                 ↓
    Stage 4: Cross-Storyline Testing
    • Validate storyline interactions
    • End-to-end user journey tests
                 ↓
    Stage 5: System Integration
    • Merge all storylines
    • Resolve conflicts
    • Performance optimization
                 ↓
    Stage 6: Documentation
    • User guides per storyline
    • API documentation
    • Deployment guides
                 ↓
    Stage 7: Deployment
    • Progressive rollout by storyline
    • Feature flags for storylines
                 ↓
    ┌────────────────────────────┐
    │  Project Complete!          │
    │  • All storylines working   │
    │  • Integrated & tested      │
    │  • Ready for production     │
    └────────────────────────────┘
```

## Core Mechanisms

### 1. Storyline-Driven Orchestration

```ascii
┌─────────────────────────────────────────────┐
│         STORYLINE ORCHESTRATION             │
├─────────────────────────────────────────────┤
│                                             │
│  User Story → Storyline → Tasks → Agents   │
│                                             │
│  Example: "User purchases product"          │
│     ↓                                       │
│  Storyline Components:                      │
│  • Browse products (Frontend + Backend)     │
│  • Add to cart (Frontend + Backend)         │
│  • View cart (Frontend + Backend)           │
│  • Proceed to checkout (Integration)        │
│     ↓                                       │
│  Each component = Complete vertical slice   │
│                                             │
└─────────────────────────────────────────────┘
```

### 2. Progressive Integration Pattern

```ascii
┌─────────────────────────────────────────────┐
│         BOTTOM-UP INTEGRATION               │
├─────────────────────────────────────────────┤
│                                             │
│  Layer 1: Foundation (No dependencies)      │
│    └─ Can develop in parallel              │
│                                             │
│  Layer 2: Integration (Depends on Layer 1)  │
│    └─ Combines foundation components       │
│                                             │
│  Layer 3: Top Features (Depends on Layer 2) │
│    └─ Complex workflows using L1+L2        │
│                                             │
│  Benefits:                                  │
│  • No integration hell                      │
│  • Early validation of dependencies         │
│  • Parallel development where possible      │
│                                             │
└─────────────────────────────────────────────┘
```

### 3. Task Tool Delegation for Storylines

```ascii
┌─────────────────────────────────────────────┐
│      STORYLINE TASK DELEGATION              │
├─────────────────────────────────────────────┤
│                                             │
│  Main Claude (Orchestrator):                │
│  "Working on 'User Auth' storyline"         │
│              ↓                              │
│  Task(                                      │
│    subagent_type="general-purpose",        │
│    description="Implement auth frontend",   │
│    prompt="You are a frontend developer.   │
│     Implement the complete authentication  │
│     storyline UI including: login,         │
│     register, password reset, profile..."   │
│  )                                          │
│              ↓                              │
│  Subagent completes entire storyline       │
│  component, not just fragments             │
│                                             │
└─────────────────────────────────────────────┘
```

## Key Principles

### 1. Storyline Completeness
```
✅ Each storyline = Complete user journey
✅ Vertical slices through entire stack
❌ NOT technical tasks or API endpoints
```

### 2. Progressive Integration
```
Layer 1 (Foundation) → Test → Layer 2 (Integration) → Test → Layer 3 (Top)
Bottom-up approach prevents integration hell
```

### 3. No Nested Task Calls
```
❌ WRONG: Coordinator subagent → Task → Another subagent
✅ RIGHT: Main Claude → Task → Subagent
```

### 4. Automatic Progression
```
Storyline validated → Next storyline → No "Should I continue?"
Layer complete → Next layer → Automatic advancement
```

## Common Patterns

### Pattern 1: Storyline Task Delegation
```javascript
// Main Claude delegating a complete storyline
Task(
  subagent_type="general-purpose",
  description="Implement shopping cart storyline",
  prompt="You are a frontend developer. Implement the complete shopping cart storyline including: browse products, add to cart, update quantities, remove items, calculate totals. Read docs/requirements.md for the shopping cart user stories..."
)
```

### Pattern 2: Storyline Validation
```javascript
// QA validating a complete storyline
Task(
  subagent_type="general-purpose",
  description="Validate user auth storyline",
  prompt="You are a QA engineer. Validate the complete user authentication storyline works end-to-end: registration, login, password reset, session management. Test all edge cases and user flows."
)
```

### Pattern 3: Progressive Layer Building
```javascript
// Building on previous layer
Task(
  subagent_type="general-purpose",
  description="Implement checkout (requires cart)",
  prompt="Build checkout storyline on top of existing cart functionality. The cart storyline is already complete and tested. Now implement: shipping address, payment method, order review, order confirmation."
)
```

## Troubleshooting

### Issue: Workflow Hangs
**Cause**: Trying to invoke coordinator as subagent
**Solution**: Coordinator.md is guidance only, not a subagent

### Issue: Documents Not Found
**Cause**: Hardcoded filenames don't match
**Solution**: Use Glob patterns for flexible finding

### Issue: Parallel Execution Not Working
**Cause**: Task tool limitation
**Solution**: Accept sequential execution, design accordingly

## Example Workflow Execution

### Complete E-commerce Platform Development

```
User: 按照workflow开发电商平台

Claude: Let me understand your requirements first.
- Is this for C2C or B2C?
- Mobile-first or desktop?
- Core features needed?

User: B2C, mobile-responsive, browse/cart/checkout

Claude: Requirements clear. Starting multi-agent workflow...

Stage 1: Planning & Storyline Generation
[Tasks execute: Requirements → Architecture → UX → Project Manager]

📊 Storyline Breakdown:
┌─────────────────────────────────────┐
│  Priority 1 (Can parallelize):       │
│  • User Authentication (3 days)      │
│  • Product Browsing (2 days)         │
│  • Static Pages (1 day)              │
│                                      │
│  Priority 2 (Needs P1):              │
│  • Shopping Cart (2 days)            │
│  • Order Management (2 days)         │
│                                      │
│  Priority 3 (Needs P2):              │
│  • Checkout Process (3 days)         │
│  • Payment Integration (2 days)      │
└─────────────────────────────────────┘

User: Looks good, proceed

Claude: Starting Priority 1 storylines...
[Delegates auth, browsing, static pages to agents]
[Each storyline: Frontend → Backend → QA → Integration]

✅ Priority 1 Complete. Starting Priority 2...
[Cart and orders build on P1 foundation]

✅ Priority 2 Complete. Starting Priority 3...
[Checkout leverages cart+orders]

✅ All storylines integrated and tested!
```

## Summary

The HO-Agent workflow transforms Claude Code into a storyline-driven development orchestrator:

1. **Storyline-First**: Break down by user journeys, not technical tasks
2. **Progressive Integration**: Bottom-up, layer by layer to avoid integration hell  
3. **Orchestrated Delegation**: Main Claude coordinates specialist subagents
4. **Complete Vertical Slices**: Each storyline spans full stack
5. **Automatic Progression**: Validated storylines advance without prompting

This storyline-driven approach ensures:
- User value delivered incrementally
- Integration issues caught early
- Parallel development where possible
- Clear dependencies and sequencing
- Professional, systematic development