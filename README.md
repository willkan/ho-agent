# 🤖 Human-Orchestrated Multi-Agent Development Framework

A sophisticated multi-agent development framework for AI-assisted software development with Claude Code.

## ✨ Key Features

- **11 Specialized AI Agents** - From requirements to deployment
- **8-Stage Development Workflow** - Structured development process
- **Validation File Management** - Smart handling of temporary test files
- **Automatic Execution** - No unnecessary confirmation prompts
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

### 1. Validation File Lifecycle

✅ **Allowed**: Create temporary files for validation  
✅ **Required**: Complete 5-step lifecycle
```
Create → Validate → Apply → Delete → Verify
```
❌ **Forbidden**: Stopping at "temp file works!"

### 2. Automatic Execution

- Never asks "Should I continue?"
- Proceeds automatically after validation
- Only pauses for: requirements, architecture, deployment

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
# Complex task coordination
请 coordinator agent 管理用户认证系统的完整开发

# Direct agent usage
请 technical-architect 设计数据库架构
请 frontend-developer 实现响应式UI组件

# Full project
使用multi-agent框架开发电商网站
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

## 🔄 Development Workflow

1. **Planning** - Requirements & architecture
2. **Setup** - Project structure
3. **Development** - Layer-by-layer modules
4. **Testing** - Quality validation
5. **Fixes** - Issue resolution
6. **Deployment Prep** - Production readiness
7. **Deploy** - Go live
8. **Completion** - Documentation & handover

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| [USE-WITH-CLAUDE.md](USE-WITH-CLAUDE.md) | How to use with Claude Code |
| [WORKFLOW-SETUP.md](WORKFLOW-SETUP.md) | Detailed setup instructions |
| [VALIDATION-PROTOCOL.md](VALIDATION-PROTOCOL.md) | Temp file management details |

## 🎯 Philosophy

> "Validation is the process, not the result."

Temporary files are tools, not products. Always complete the full cycle.

## 📄 License

MIT

---

Built to solve the "simple-server.js works, we're done!" problem.