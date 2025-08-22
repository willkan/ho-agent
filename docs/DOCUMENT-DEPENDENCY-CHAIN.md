# Document Dependency Chain Analysis

## Stage 0: Requirements Discovery
**Agent**: Main Claude (conversation)
- **Inputs**: User conversation
- **Outputs**: Requirements understanding (kept in context)
- **Files Created**: None (conversation only)

## Stage 1: Planning & Storyline Generation

### 1.1 Requirements Analysis
**Agent**: requirements-analyst
- **Inputs**: Context from Stage 0
- **Outputs**: 
  - `docs/requirements.md` ✅
  - `docs/acceptance-criteria.json` ✅

### 1.2 Parallel Design
**Architecture** (technical-architect):
- **Inputs**: `docs/requirements.md` (needs to read)
- **Outputs**: 
  - `docs/architecture.md` ✅
  - `docs/api-spec.yaml` ✅
  - `docs/database-design.md` ✅

**UX Design** (ux-designer):
- **Inputs**: `docs/requirements.md` (needs to read)
- **Outputs**: 
  - `docs/ux-design.md` ✅
  - `docs/component-specs.md` ✅
  - `docs/user-flows.md` ✅
  - `docs/design-system.md` ✅

### 1.3 Storyline Generation
**Agent**: project-manager
- **Inputs**: 
  - `docs/requirements.md`
  - `docs/architecture.md`
  - `docs/ux-design.md`
- **Outputs**: 
  - `.claude/storylines/storyline-breakdown.json` ✅
  - `.claude/storylines/*/progress.md` ✅
  - `docs/project-timeline.md` ✅
  - `docs/task-breakdown.md` ✅

### 🛑 APPROVAL GATE
Present storylines to user for approval

## Stage 2: Project Setup
**Agent**: frontend-developer + backend-developer
- **Inputs**: 
  - `docs/architecture.md` (MUST READ to know structure)
- **Outputs**: 
  - Project directory structure
  - Configuration files
  - Empty entry points

## Stage 3: Storyline Development

### Per Storyline (P1 → P2 → P3)

**Backend Developer**:
- **Inputs MUST READ**: 
  - `docs/requirements.md`
  - `docs/api-spec.yaml` (BIBLE)
  - `docs/database-design.md`
  - `docs/architecture.md`
  - `.claude/storylines/{storyline}/acceptance-criteria.md`
- **Outputs**: 
  - Backend implementation for storyline
  - Update `.claude/storylines/{storyline}/progress.md`

**Frontend Developer**:
- **Inputs MUST READ**: 
  - `docs/requirements.md`
  - `docs/api-spec.yaml`
  - `docs/ux-design.md`
  - `docs/component-specs.md`
  - `docs/architecture.md`
  - `.claude/storylines/{storyline}/acceptance-criteria.md`
- **Outputs**: 
  - Frontend implementation for storyline
  - Update `.claude/storylines/{storyline}/progress.md`

**QA Engineer**:
- **Inputs**: 
  - `docs/requirements.md`
  - `docs/acceptance-criteria.json`
  - `.claude/storylines/{storyline}/acceptance-criteria.md`
- **Outputs**: 
  - Test results
  - Update `.claude/storylines/{storyline}/progress.md`

## Stage 4-7: Integration → Documentation → Deployment
(Continue with similar pattern)

---

## 🔍 IDENTIFIED ISSUES

### ✅ Fixed Issues:
1. Stage 2 now reads architecture.md to determine structure
2. Stage 1 requirements-analyst creates docs/requirements.md

### ❌ Remaining Issues:
1. **Stage 1 agents don't explicitly mention reading requirements.md**
   - Technical architect should read requirements.md
   - UX designer should read requirements.md

2. **Storyline acceptance criteria generation**
   - Project manager should create `.claude/storylines/{storyline}/acceptance-criteria.md`
   - Not just progress.md

3. **Backend/Frontend document discovery**
   - They use Glob patterns but should be instructed to do so

4. **Database design document**
   - Technical architect should create `docs/database-design.md`
   - Backend developer expects it but it's not explicitly created

## 📋 Recommendations

1. **Update technical-architect.md** to explicitly create database-design.md
2. **Update project-manager.md** to create acceptance-criteria.md per storyline
3. **Ensure all agents explicitly read their required documents**
4. **Add validation that required documents exist before proceeding**