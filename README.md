# 🤖 Human-Orchestrated Multi-Agent Development Framework for Claude Code

English | [中文](README-CN.md)

**A role-based development methodology framework that enables Claude Code to approach software development from multiple specialized perspectives, simulating a complete development team within a single AI assistant.**

> ⚠️ **Important**: This is NOT a technical multi-agent system with actual agent orchestration. Instead, it's a structured methodology that guides Claude Code to systematically switch between different professional roles (architect, frontend dev, backend dev, QA, etc.) during the development process.

## ✨ Key Features

- **11 Specialized Role Definitions** - Claude Code switches between professional perspectives (architect, developer, QA, etc.)
- **Storyline-Driven Development** - Break down tasks by user journeys, bottom-up integration
- **Structured Development Process** - 8-stage workflow from requirements to deployment
- **Sequential Agent Execution** - Agents are called one by one via Task tool (no parallel execution)
- **Progressive Integration** - Solve integration issues layer by layer

## 🚀 Quick Start

### Option 1: Direct Setup (Recommended)

```bash
# Navigate to your project
cd /path/to/your/project

# Run setup script
bash /path/to/ho-agent/setup-workflow.sh
```

### Option 2: Global Command

Install once:
```bash
bash /path/to/ho-agent/install-global.sh
```

Then use anywhere:
```bash
cd any-project
ho-agent
```

## 📋 Core Rules

### 1. Storyline Lifecycle

Each storyline must complete the full development cycle:
```
Develop → Self-Test → Validate → Integrate → Complete
```
✅ **Required**: Each storyline must pass all tests before proceeding  
❌ **Forbidden**: Skipping tests to move to next storyline

### 2. Automatic Execution

- Proceeds automatically after validation
- Never asks "Should I continue?"
- Only pauses for: requirements clarification, storyline approval, deployment decisions

### 3. Multi-Agent Collaboration

- **Parallel Execution**: Independent storylines can develop simultaneously (max 3)
- **Context Isolation**: Each agent only sees their assigned storyline
- **Dependency Management**: Strict adherence to storyline dependencies

## 🎭 Available Agents

| Agent | Role |
|-------|------|
| **coordinator** | Central orchestration and conflict resolution |
| **requirements-analyst** | Requirements gathering and documentation |
| **technical-architect** | System design and architecture |
| **frontend-developer** | React/TypeScript UI development |
| **backend-developer** | Node.js/Fastify API development |
| **qa-engineer** | Quality validation and testing |
| **devops-engineer** | Infrastructure and deployment |
| **ux-designer** | User interface design |
| **project-manager** | Planning and resource management |
| **documentation-writer** | Technical documentation |
| **code-reviewer** | Code quality and best practices |

## 💬 Usage Examples

```bash
# In your project directory
cd my-project
claude  # Start Claude in the project

# Start development with workflow
> 按照workflow开发一个电商平台

# Claude Code will:
# 1. First clarify requirements through conversation
# 2. Switch to different roles (analyst, architect, UX designer) for analysis
# 3. Generate storyline breakdown with ASCII diagram
# 4. Wait for your confirmation
# 5. Systematically develop each storyline, switching between frontend/backend/QA roles as needed

# Example conversation:
> 按照workflow开发一个外卖平台
Claude: 好的，先了解一下需求。这是面向C端用户的外卖平台吗？
> 是的，类似饿了么
Claude: 需要支持移动端吗？还是先做PC版？
> 移动优先，但要响应式
Claude: 最核心的功能有哪些？
> 餐厅列表、菜单浏览、购物车、下单
Claude: 明白了。需要用户登录吗？
> MVP版本先不要，用本地存储
Claude: 了解了，需求清楚了。现在开始multi-agent开发流程...
[Stage 1: 并发执行需求分析、架构设计、UX设计...]
```

## 📂 Project Structure After Setup

```
your-project/
├── CLAUDE.md              # Claude Code configuration ⚠️ Critical!
├── .claude/
│   ├── agents/           # Agent configurations
│   ├── workflows/        # Workflow definitions
│   └── state/           # State tracking
└── [your files...]
```

## 🎯 Storyline-Driven Development

### What is a Storyline?

A storyline is a complete user journey, for example:
- "User registration and login" - not just "create user table"
- "Browse and purchase products" - not just "product list API"
- "Manage shopping cart" - complete add/remove/modify flow

### Example Storyline Dependency Graph

```
┌─────────────────────────────────────────────────────┐
│          PROJECT STORYLINE DEPENDENCY MAP           │
└─────────────────────────────────────────────────────┘

Priority 1 (Foundation - Can run in parallel):
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ User Auth    │     │Product Browse│     │ Static Pages │
│ ⏱ 3 days     │     │ ⏱ 2 days     │     │ ⏱ 1 day      │
└──────┬───────┘     └──────┬───────┘     └──────┬───────┘
       └─────────────────────┼─────────────────────┘
                            ▼
Priority 2 (Integration):
                    ┌──────────────┐
                    │Shopping Cart │
                    │ Depends: P1  │
                    │ ⏱ 2 days     │
                    └──────┬───────┘
                            ▼
Priority 3 (Top Layer):
                    ┌──────────────┐
                    │   Checkout   │
                    │ Depends:Cart │
                    │ ⏱ 3 days     │
                    └──────────────┘
```

## 🔄 Development Workflow

0. **Requirements Clarification** - Understand needs through conversation
1. **Planning** - Requirements & architecture (parallel)
2. **Storyline Breakdown** - Generate dependency graph, await confirmation
3. **Progressive Development** - Develop storylines layer by layer
4. **Self-Test Gates** - Each storyline must pass tests
5. **Integration** - Verify inter-storyline integration
6. **Deployment Prep** - Production readiness
7. **Completion** - Documentation & handover

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| [STORYLINE-TEMPLATE.md](STORYLINE-TEMPLATE.md) | Storyline definition template |
| [STORYLINE-EXAMPLE.md](STORYLINE-EXAMPLE.md) | Storyline examples |
| [WORKFLOW-SETUP.md](WORKFLOW-SETUP.md) | Detailed setup instructions |
| [VALIDATION-PROTOCOL.md](VALIDATION-PROTOCOL.md) | Temp file management details |

## 🎯 How It Works

When you tell Claude Code to "按照workflow开发[项目]", it will:

1. **Read coordinator.md** - Get orchestration instructions (NOT a subagent)
2. **Act as orchestrator** - Main Claude coordinates the workflow
3. **Use Task tool** - Delegate work to specialist subagents
4. **Chain stages** - Each subagent completes work and returns results
5. **Progress automatically** - Move through all 8 development stages

**Key Architecture:**
- **Coordinator**: Instructions for main Claude (not invoked as subagent)
- **Specialists**: True subagents with isolated context windows
- **Task Tool**: Bridge between main Claude and specialist subagents

This avoids the nested Task call problem while maintaining clean separation of concerns.

## 🎯 Philosophy

> "Every feature belongs to a storyline, every storyline tells a user's story."

Storylines are not collections of technical tasks, but complete journeys of user experience.

## 📄 License

MIT

---

Built to enable Claude Code to simulate a complete development team's expertise within a single conversation.