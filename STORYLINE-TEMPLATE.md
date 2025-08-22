# Storyline Template

This template helps break down projects into user-centric storylines for bottom-up integration.

## ASCII Dependency Graph Template

When presenting storylines to users for approval, ALWAYS include this visual representation:

```ascii
┌───────────────────────────────────────────────────────────────────┐
│                 [PROJECT NAME] STORYLINE MAP                      │
│                    Total Storylines: X                            │
│                    Estimated Time: Y days                         │
└───────────────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════════
PRIORITY 1: FOUNDATION LAYER (No Dependencies - Parallel Execution)
═══════════════════════════════════════════════════════════════════

┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│ [Storyline 1]   │     │ [Storyline 2]   │     │ [Storyline 3]   │
│                 │     │                 │     │                 │
│ Backend:  [X]   │     │ Backend:  [X]   │     │ Backend:  [X]   │
│ Frontend: [Y]   │     │ Frontend: [Y]   │     │ Frontend: [Y]   │
│ Tests:    [Z]   │     │ Tests:    [Z]   │     │ Tests:    [Z]   │
│                 │     │                 │     │                 │
│ ⏱ Est: X days   │     │ ⏱ Est: Y days   │     │ ⏱ Est: Z days   │
│ 👥 Team: 2 devs │     │ 👥 Team: 2 devs │     │ 👥 Team: 1 dev  │
└────────┬────────┘     └────────┬────────┘     └────────┬────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                │
                                ▼
═══════════════════════════════════════════════════════════════════
PRIORITY 2: INTEGRATION LAYER (Depends on Priority 1)
═══════════════════════════════════════════════════════════════════

                        ┌─────────────────┐
                        │ [Storyline 4]   │
                        │                 │
                        │ Depends on:     │
                        │ • Storyline 1   │
                        │ • Storyline 2   │
                        │                 │
                        │ Backend:  [X]   │
                        │ Frontend: [Y]   │
                        │ Tests:    [Z]   │
                        │                 │
                        │ ⏱ Est: X days   │
                        │ 👥 Team: 3 devs │
                        └────────┬────────┘
                                │
                                ▼
═══════════════════════════════════════════════════════════════════
PRIORITY 3: TOP LAYER (Depends on Priority 2)
═══════════════════════════════════════════════════════════════════

                        ┌─────────────────┐
                        │ [Storyline 5]   │
                        │                 │
                        │ Depends on:     │
                        │ • Storyline 4   │
                        │                 │
                        │ ⏱ Est: X days   │
                        └─────────────────┘

───────────────────────────────────────────────────────────────────
LEGEND:
───────────────────────────────────────────────────────────────────
⏱  Estimated completion time        Backend:  Number of backend components
👥 Team size needed                 Frontend: Number of frontend components
──▶ Direct dependency               Tests:    Number of test suites
═══ Priority boundaries             [X]:      Actual count

───────────────────────────────────────────────────────────────────
EXECUTION TIMELINE:
───────────────────────────────────────────────────────────────────
Week 1: Priority 1 (Storylines 1,2,3 in parallel)
Week 2: Complete Priority 1, Start Priority 2
Week 3: Complete Priority 2, Start Priority 3
Week 4: Complete Priority 3, Integration testing

───────────────────────────────────────────────────────────────────
PARALLELIZATION OPPORTUNITIES:
───────────────────────────────────────────────────────────────────
✅ Can run in parallel: Storylines 1, 2, 3 (no dependencies)
⚠️  Sequential required: Storyline 4 after 1&2, Storyline 5 after 4
💡 Resource optimization: 3 parallel tracks maximum
```

## Storyline Definition Format

```json
{
  "storyline_id": "unique-identifier",
  "name": "Human-readable storyline name",
  "description": "What user journey does this cover?",
  "priority": 1,  // 1 = foundation, 2 = depends on priority 1, etc.
  "dependencies": ["list", "of", "prerequisite", "storyline_ids"],
  
  "components": {
    "backend": [
      "service-name-1",
      "service-name-2"
    ],
    "frontend": [
      "component-name-1",
      "component-name-2"
    ],
    "database": [
      "table-or-schema-changes"
    ]
  },
  
  "acceptance_criteria": [
    "User can perform action X",
    "System validates Y correctly",
    "Error case Z is handled gracefully"
  ],
  
  "test_scenarios": [
    "Happy path: successful flow",
    "Edge case: boundary conditions",
    "Error case: invalid inputs",
    "Performance: load testing"
  ],
  
  "integration_points": [
    "API endpoints used by other storylines",
    "Shared data models",
    "Event triggers"
  ]
}
```

## Example: E-commerce Platform Storylines

### Foundation Layer (Priority 1 - No Dependencies)

#### 1. User Registration Storyline
```json
{
  "storyline_id": "user-registration",
  "name": "User Registration Journey",
  "description": "Complete flow from landing page to verified account",
  "priority": 1,
  "dependencies": [],
  
  "components": {
    "backend": [
      "auth-service",
      "user-model",
      "email-service",
      "validation-service"
    ],
    "frontend": [
      "registration-form",
      "email-verification-page",
      "welcome-dashboard"
    ],
    "database": [
      "users-table",
      "verification-tokens-table"
    ]
  },
  
  "acceptance_criteria": [
    "User can register with email/password",
    "Email verification link works",
    "Duplicate emails are prevented",
    "Password meets security requirements",
    "User profile is created successfully"
  ],
  
  "test_scenarios": [
    "Happy path: valid registration and verification",
    "Invalid email formats rejected",
    "Weak passwords rejected",
    "Duplicate email handling",
    "Verification token expiry",
    "Concurrent registration attempts"
  ],
  
  "integration_points": [
    "POST /api/auth/register",
    "GET /api/auth/verify/:token",
    "User model shared with all storylines"
  ]
}
```

#### 2. Product Catalog Storyline
```json
{
  "storyline_id": "product-catalog",
  "name": "Product Discovery Journey",
  "description": "Browse, search, and view product details",
  "priority": 1,
  "dependencies": [],
  
  "components": {
    "backend": [
      "product-service",
      "search-service",
      "category-service"
    ],
    "frontend": [
      "product-grid",
      "product-detail-page",
      "search-bar",
      "category-navigation"
    ],
    "database": [
      "products-table",
      "categories-table",
      "product-images-table"
    ]
  },
  
  "acceptance_criteria": [
    "Products display with images and prices",
    "Search returns relevant results",
    "Categories filter products correctly",
    "Product details show all information",
    "Pagination works for large catalogs"
  ]
}
```

### Integration Layer (Priority 2 - Depends on Foundation)

#### 3. Shopping Cart Storyline
```json
{
  "storyline_id": "shopping-cart",
  "name": "Cart Management Journey",
  "description": "Add products to cart and manage quantities",
  "priority": 2,
  "dependencies": ["user-registration", "product-catalog"],
  
  "components": {
    "backend": [
      "cart-service",
      "cart-persistence-service"
    ],
    "frontend": [
      "add-to-cart-button",
      "cart-sidebar",
      "cart-page",
      "quantity-selector"
    ],
    "database": [
      "cart-items-table",
      "cart-sessions-table"
    ]
  },
  
  "acceptance_criteria": [
    "Logged-in users have persistent carts",
    "Guest users have session-based carts",
    "Cart survives page refresh",
    "Quantity updates work correctly",
    "Out-of-stock items handled"
  ],
  
  "integration_points": [
    "Requires valid user session from user-registration",
    "Requires product data from product-catalog",
    "Cart data used by checkout storyline"
  ]
}
```

### Top Layer (Priority 3 - Depends on Integration)

#### 4. Checkout Storyline
```json
{
  "storyline_id": "checkout",
  "name": "Purchase Completion Journey",
  "description": "Complete purchase from cart to order confirmation",
  "priority": 3,
  "dependencies": ["shopping-cart"],
  
  "components": {
    "backend": [
      "order-service",
      "payment-gateway",
      "inventory-service",
      "notification-service"
    ],
    "frontend": [
      "checkout-form",
      "payment-form",
      "order-confirmation-page",
      "order-email-template"
    ]
  }
}
```

## Storyline Dependency Rules

1. **Foundation storylines** (Priority 1):
   - MUST have no dependencies
   - Can be developed in parallel
   - Provide core functionality for other storylines

2. **Integration storylines** (Priority 2+):
   - MUST wait for ALL dependencies to complete
   - Can reference completed storyline APIs/data
   - Add value by combining foundation features

3. **Parallel Execution**:
   - Only storylines with SAME priority AND no shared dependencies
   - Maximum 3 parallel storylines
   - Each must have independent test suites

## Progress Tracking Structure

```
.claude/storylines/
├── master-progress.json          # Overall storyline status
├── storyline-breakdown.json      # Complete storyline definitions
├── user-registration/
│   ├── progress.md              # Detailed progress tracking
│   ├── acceptance-criteria.md   # Criteria checklist
│   └── test-results.json        # Test execution results
├── product-catalog/
│   ├── progress.md
│   ├── acceptance-criteria.md
│   └── test-results.json
└── [other-storylines]/
```

## Storyline Completion Criteria

A storyline is COMPLETE only when:
1. ✅ All components implemented
2. ✅ All acceptance criteria met
3. ✅ All test scenarios pass
4. ✅ Integration points documented
5. ✅ No regression in existing storylines
6. ✅ Performance benchmarks met

## Human Approval Points

1. **After Storyline Generation**: User reviews and approves storyline breakdown
2. **Priority Adjustments**: User can re-prioritize storylines
3. **Dependency Changes**: User can modify dependencies if needed
4. **Completion Sign-off**: User confirms storyline meets business requirements