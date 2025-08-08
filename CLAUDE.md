# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **Human-Orchestrated Multi-Agent Development Framework** - an advanced collaborative system for AI-assisted software development. The repository contains configuration files and agent specifications for orchestrating multiple AI agents in a controlled development workflow.

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

### Execution Model
The framework operates in progressive phases:
1. **Single Developer Enhancement**: AI assists with analysis, human does development
2. **Front-Back Separation**: AI handles frontend and backend separately, sequential execution
3. **Full Controlled Collaboration**: All agents with controlled parallelism (max 2 concurrent writers)

### Quality Validation System
Multi-layer validation framework:
- **Unit Level**: Test coverage, code complexity, linting (80% coverage threshold)
- **Contract Level**: API schema consistency, data type compatibility
- **Integration Level**: Cross-module functionality (95% pass rate threshold)
- **System Level**: End-to-end workflows, accessibility (WCAG 2.1 AA), security scanning

## Key Configuration Files

### Workflow Configuration (`workflow.yaml`)
- Defines 8-stage development process from planning to deployment
- Specifies agent roles, dependencies, and quality gates
- Configures controlled parallel execution with conflict resolution
- Sets up human intervention points for critical decisions

### Quality Rules (`quality-rules.yaml`)  
- Multi-dimensional quality validation (functional, technical, UX, process)
- Progressive quality gates with blocking/warning conditions
- Automated tool configurations (ESLint, Jest, Playwright)
- Trend analysis and predictive quality scoring

### Human Intervention (`human-intervention.yaml`)
- Mandatory intervention points: requirements approval, architecture changes, deployment
- Recommended interventions: quality issues, performance degradation  
- Escalation procedures and timeout management
- Learning framework for improving intervention decisions

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

1. **Follow the Progressive Phase Model**: Start with single-developer enhancement before moving to full collaboration
2. **Respect Quality Gates**: Don't bypass validation layers - they prevent production issues
3. **Use the Coordinator**: For complex multi-step tasks, leverage the coordinator agent for orchestration
4. **Honor Human Intervention**: Pause for human approval at mandatory intervention points
5. **Maintain Architecture Compliance**: Monitor drift scores and escalate significant deviations
6. **Document Decisions**: All architectural and design decisions should be captured for future agents

## State Management

The framework maintains shared state in `.claude/state/project.db` with tables for:
- Agent status and current tasks
- File locks and operation types  
- Task dependencies and blocking reasons
- Quality metrics and thresholds

This enables coordinated work across multiple AI agents while preventing conflicts and ensuring quality standards.