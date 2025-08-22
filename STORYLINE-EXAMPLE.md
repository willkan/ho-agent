# Storyline Workflow Example

This example demonstrates how to use the storyline-driven workflow for a simple blog system.

## Step 1: Initial Requirements

```
User: "I want to build a blog system where users can register, write articles, and comment on articles."
```

## Step 2: Storyline Generation (by Project Manager)

The system will generate the following storyline breakdown:

```json
{
  "project": "Blog System",
  "storylines": [
    {
      "id": "user-auth",
      "name": "User Authentication Journey",
      "priority": 1,
      "dependencies": [],
      "components": {
        "backend": ["auth-service", "user-model"],
        "frontend": ["login-form", "register-form", "profile-page"]
      },
      "acceptance_criteria": [
        "User can register with email/password",
        "User can login and receive JWT token",
        "User session persists across page refresh"
      ]
    },
    {
      "id": "article-management",
      "name": "Article Creation Journey",
      "priority": 2,
      "dependencies": ["user-auth"],
      "components": {
        "backend": ["article-service", "article-model"],
        "frontend": ["article-editor", "article-list", "article-view"]
      },
      "acceptance_criteria": [
        "Authenticated users can create articles",
        "Articles display with author information",
        "Users can edit their own articles"
      ]
    },
    {
      "id": "commenting",
      "name": "Comment Interaction Journey",
      "priority": 3,
      "dependencies": ["user-auth", "article-management"],
      "components": {
        "backend": ["comment-service", "comment-model"],
        "frontend": ["comment-form", "comment-list"]
      },
      "acceptance_criteria": [
        "Authenticated users can comment on articles",
        "Comments display in chronological order",
        "Users can delete their own comments"
      ]
    }
  ]
}
```

## Step 3: Human Approval Gate (WITH ASCII DIAGRAM)

```
System: "Here are the proposed storylines for your blog system:

┌───────────────────────────────────────────────────────────────────┐
│                    BLOG SYSTEM STORYLINE MAP                      │
│                    Total Storylines: 5                            │
│                    Estimated Time: 10 days                        │
└───────────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════════
PRIORITY 1: FOUNDATION LAYER (No Dependencies - Parallel Execution)
═══════════════════════════════════════════════════════════════════

┌─────────────────┐                    ┌─────────────────┐
│ User Auth       │                    │ Static Pages    │
│                 │                    │                 │
│ Backend:  3     │                    │ Backend:  0     │
│ Frontend: 3     │                    │ Frontend: 4     │
│ Tests:    8     │                    │ Tests:    2     │
│                 │                    │                 │
│ ⏱ Est: 3 days   │                    │ ⏱ Est: 1 day    │
│ 👥 Team: 2 devs │                    │ 👥 Team: 1 dev  │
└────────┬────────┘                    └────────┬────────┘
         │                                      │
         └──────────────┬───────────────────────┘
                       ▼
═══════════════════════════════════════════════════════════════════
PRIORITY 2: CONTENT LAYER (Depends on User Auth)
═══════════════════════════════════════════════════════════════════

                ┌─────────────────┐
                │ Article Mgmt    │
                │                 │
                │ Depends on:     │
                │ • User Auth     │
                │                 │
                │ Backend:  4     │
                │ Frontend: 5     │
                │ Tests:    10    │
                │                 │
                │ ⏱ Est: 4 days   │
                │ 👥 Team: 2 devs │
                └────────┬────────┘
                        │
         ┌──────────────┴───────────────┐
         ▼                              ▼
═══════════════════════════════════════════════════════════════════
PRIORITY 3: INTERACTION LAYER (Depends on Articles)
═══════════════════════════════════════════════════════════════════

┌─────────────────┐            ┌─────────────────┐
│ Commenting      │            │ Search & Tags   │
│                 │            │                 │
│ Depends on:     │            │ Depends on:     │
│ • Articles      │            │ • Articles      │
│ • User Auth     │            │                 │
│                 │            │ Backend:  2     │
│ Backend:  2     │            │ Frontend: 2     │
│ Frontend: 2     │            │ Tests:    4     │
│ Tests:    5     │            │                 │
│                 │            │ ⏱ Est: 1 day    │
│ ⏱ Est: 2 days   │            │ 👥 Team: 1 dev  │
└─────────────────┘            └─────────────────┘

───────────────────────────────────────────────────────────────────
EXECUTION TIMELINE:
───────────────────────────────────────────────────────────────────
Days 1-3: User Auth + Static Pages (parallel)
Days 4-7: Article Management 
Days 8-9: Commenting + Search & Tags (parallel)
Day 10: Final integration testing

───────────────────────────────────────────────────────────────────
PARALLELIZATION OPPORTUNITIES:
───────────────────────────────────────────────────────────────────
✅ Can run in parallel: User Auth & Static Pages (Priority 1)
✅ Can run in parallel: Commenting & Search (Priority 3)
⚠️  Must wait: Article Management needs User Auth completed
💡 Resource optimization: Max 2 parallel storylines at once

Please review and confirm: 'The storylines look good, proceed'"
```

## Step 4: Progressive Development

### Phase 1: User Authentication Storyline

```bash
# Coordinator initiates
Task(coordinator, "Starting storyline: user-auth
Creating progress file at .claude/storylines/user-auth/progress.md")

# Backend development
Task(backend-developer, "STORYLINE: user-auth
Develop auth-service and user-model
Update progress in .claude/storylines/user-auth/progress.md")

# Frontend development (can run in parallel)
Task(frontend-developer, "STORYLINE: user-auth
Develop login-form, register-form, profile-page
Update progress in .claude/storylines/user-auth/progress.md")

# Testing
Task(qa-engineer, "STORYLINE: user-auth
Test complete authentication journey:
- User registration flow
- Login flow
- Session persistence
Update test results in .claude/storylines/user-auth/progress.md")
```

### Progress File Updates

`.claude/storylines/user-auth/progress.md`:
```markdown
# Storyline: User Authentication Journey
**Status**: IN_PROGRESS
**Started**: 2024-01-15 10:00

## Component Progress
### Backend
- [x] auth-service - Completed [backend-developer, 10:30]
- [x] user-model - Completed [backend-developer, 10:45]

### Frontend  
- [x] login-form - Completed [frontend-developer, 10:35]
- [x] register-form - Completed [frontend-developer, 10:50]
- [ ] profile-page - In progress

## Test Results
- Unit Tests: 15/15 passed ✅
- Integration Tests: 5/5 passed ✅
- E2E Tests: 2/3 passed ❌ TESTING

## Notes
- backend-developer: Auth service complete with JWT [10:45]
- frontend-developer: Forms validated and accessible [10:50]
- qa-engineer: Testing profile page flow [11:00]
```

### Phase 2: Article Management (Only after user-auth COMPLETES)

```bash
# Coordinator checks dependencies
if storyline["user-auth"].status == "COMPLETED":
    Task(coordinator, "Starting storyline: article-management
    Dependency user-auth is COMPLETED
    Creating progress file at .claude/storylines/article-management/progress.md")
else:
    print("BLOCKED: article-management waiting for user-auth completion")
```

## Step 5: Storyline Validation Gate

Each storyline must pass ALL criteria before marked COMPLETE:

```python
def validate_storyline(storyline_id):
    progress = read_progress_file(storyline_id)
    
    # Check all components completed
    if any(component.status != "completed" for component in progress.components):
        return "BLOCKED: Not all components completed"
    
    # Check all tests passed
    if progress.tests.e2e != "100% passed":
        return "BLOCKED: E2E tests not passing"
    
    # Check acceptance criteria
    if not all(criteria.met for criteria in progress.acceptance_criteria):
        return "BLOCKED: Acceptance criteria not met"
    
    # Check no regression
    if regression_detected_in_other_storylines():
        return "BLOCKED: Regression detected"
    
    return "COMPLETED"
```

## Step 6: Master Progress Tracking

`.claude/storylines/master-progress.json`:
```json
{
  "overall_progress": "33%",
  "storylines": {
    "user-auth": {
      "status": "COMPLETED",
      "completion": "100%",
      "test_results": "all_passed"
    },
    "article-management": {
      "status": "IN_PROGRESS",
      "completion": "60%",
      "blockers": []
    },
    "commenting": {
      "status": "BLOCKED",
      "completion": "0%",
      "blockers": ["waiting for article-management"]
    }
  },
  "next_actions": [
    "Complete article-management frontend components",
    "Run E2E tests for article creation flow",
    "Prepare commenting storyline for development"
  ]
}
```

## Key Benefits

1. **Clear Dependencies**: No confusion about what can be built when
2. **Progress Visibility**: Everyone knows exactly what's complete
3. **Early Integration**: Problems found within each storyline, not at the end
4. **Parallel Work**: Independent storylines can progress simultaneously
5. **User-Centric**: Focus on complete journeys, not isolated features
6. **Quality Gates**: Each storyline must be fully working before proceeding

## Common Patterns

### Parallel Storylines
```
Priority 1: [user-auth, product-catalog] - Can develop simultaneously
Priority 2: [shopping-cart] - Waits for both Priority 1 storylines
```

### Sequential Storylines
```
admin-dashboard -> reports -> analytics
Each must complete before the next begins
```

### Integration Testing
```
After each storyline group:
- Test storyline in isolation
- Test integration with completed storylines
- Verify no regression in existing storylines
```