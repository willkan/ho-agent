# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **Storyline-Driven Multi-Agent Development Framework** - an advanced collaborative system for AI-assisted software development that breaks down projects into user storylines (complete user journeys) rather than technical tasks. The repository contains configuration files and agent specifications for orchestrating multiple AI agents to develop software through progressive integration of storylines.

## Core Architecture

### Multi-Agent Framework
- **Coordinator Agent**: Central orchestrator managing all agent activities, conflict resolution, and quality gates
- **Requirements Analyst**: Elicits and documents software requirements
- **Technical Architect**: Designs system architecture with default stack (React + TypeScript frontend, Node.js + Fastify backend)
- **Frontend Developer**: Implements React components with mock backend integration
- **Backend Developer**: Implements APIs following TDD methodology
- **QA Engineer**: Validates implementation against designs and requirements
- **DevOps Engineer**: Creates Docker containers and CI/CD pipelines
- **UX Designer**: Creates prototypes and component specifications
- **Project Manager**: Plans development tasks and manages dependencies
- **Documentation Writer**: Maintains technical documentation
- **Code Reviewer**: Reviews code quality and architecture compliance

### Storyline-Based Execution Model
The framework operates through storyline-driven progressive integration:
1. **Storyline Breakdown**: Projects divided into complete user journeys (e.g., "user registration", "product purchase")
2. **Dependency Mapping**: Storylines organized in priority layers based on dependencies
3. **Progressive Integration**: Bottom-up development from foundation storylines to complex features
4. **Vertical Slices**: Each storyline implemented as complete stack (UI + API + Data)

### Quality Validation System
Multi-layer validation framework:
- **Unit Level**: Test coverage, code complexity, linting (80% coverage threshold)
- **Contract Level**: API schema consistency, data type compatibility
- **Integration Level**: Cross-module functionality (95% pass rate threshold)
- **System Level**: End-to-end workflows, accessibility (WCAG 2.1 AA), security scanning

## Key Configuration Files

### Workflow Configuration (`workflow.yaml`)
- Defines 8-stage development process with storyline-driven approach
- Stage 0: Requirements clarification through conversation
- Stage 1: Planning with storyline breakdown and dependency graph generation
- Human approval gate for storyline breakdown before development
- Progressive integration from foundation to top-layer storylines
- Automatic progression between validated storylines

### Quality Standards
- Multi-dimensional quality validation at each stage
- Progressive quality gates with validation points
- Automated testing expected (unit, integration, e2e)
- Code review before integration

### Human Intervention Points
- Mandatory: Storyline approval after Stage 1
- Mandatory: Production deployment decision
- Recommended: Architecture changes, quality issues

## Default Technology Stack

**Frontend**: React.js, TypeScript, Vite, Tailwind CSS, Shadcn
**Backend**: Node.js, Fastify, TypeScript
**Database**: SQLite (dev), PostgreSQL (prod), Redis, Prisma ORM
**Testing**: Jest, React Testing Library, Supertest, Playwright
**Infrastructure**: Docker, Docker Compose, Nginx
**CI/CD**: GitHub Actions

## Common Commands

Since this is a framework configuration repository without actual code, typical development commands depend on the projects generated:

**For generated Node.js projects:**
```bash
npm install
npm run dev
npm run build
npm run test
npm run test:coverage
npm run lint
npm run typecheck
```

**For Docker-based projects:**
```bash
docker-compose up -d
docker-compose build
docker-compose logs -f
```

## Working with This Framework

### Understanding Agent Roles
Each `.md` file defines a specific agent with:
- Responsibilities and tasks
- Available tools and context
- Standards and deliverables
- Integration points with other agents

### Quality Gates
The system enforces quality at multiple levels:
- **Code Quality Gate**: Before code review (linting, unit tests)
- **Module Quality Gate**: After module completion (contract validation, integration tests)
- **System Quality Gate**: Before deployment (E2E tests, security scans)

### Human Intervention Points
The framework requires human approval for:
- Project requirements and architecture (mandatory)
- Production deployment (mandatory) 
- Quality issues and performance concerns (recommended)

### Conflict Resolution
The coordinator agent handles:
- File lock coordination between agents
- Design disagreements requiring arbitration
- Resource allocation conflicts
- Automatic merge strategies for code conflicts

## Best Practices for Claude Code

1. **Think in Storylines**: Break down projects by user journeys, not technical components
2. **Progressive Integration**: Develop foundation storylines first, then build layers on top
3. **Complete Vertical Slices**: Each storyline should span the full stack (UI + API + Data)
4. **Honor Approval Gates**: Always get human approval for storyline breakdown before development
5. **Automatic Progression**: Once a storyline is validated, automatically proceed to the next
6. **Use Coordinator Guidance**: Main Claude reads coordinator.md for orchestration (not a subagent)

## Storyline Development Philosophy

### What is a Storyline?
A storyline is a **complete user journey** through the system, not a collection of technical tasks:
- ✅ "User browses products and makes a purchase" (complete flow)
- ✅ "User manages their profile and preferences" (full feature)
- ❌ "Create product API endpoint" (technical fragment)
- ❌ "Set up database tables" (infrastructure task)

### Storyline Layers
```
Priority 1: Foundation (no dependencies)
  └─ User Auth, Product Browse, Static Pages
Priority 2: Integration (depends on P1)
  └─ Shopping Cart, Order Management
Priority 3: Top Features (depends on P2)
  └─ Checkout, Payment Processing
```

### Benefits of Storyline-Driven Development
- **User Value First**: Each storyline delivers complete user value
- **No Integration Hell**: Progressive integration catches issues early
- **Parallel Development**: Independent storylines can be developed simultaneously
- **Clear Dependencies**: Visual dependency graph shows what can be built when
- **Incremental Delivery**: Working features delivered layer by layer

## State Management

The framework maintains shared state in `.claude/state/project.db` with tables for:
- Agent status and current tasks
- File locks and operation types  
- Task dependencies and blocking reasons
- Quality metrics and thresholds
- Storyline completion status and dependencies

This enables coordinated work across multiple AI agents while preventing conflicts and ensuring quality standards.