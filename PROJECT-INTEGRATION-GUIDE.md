# 在实际项目中使用 Multi-Agent 开发框架

## 快速开始

### 1. 将框架集成到你的项目中

```bash
# 在你的项目根目录下创建 .claude 文件夹
mkdir .claude
mkdir .claude/agents
mkdir .claude/workflows
mkdir .claude/state

# 复制agent配置文件到你的项目
cp *.md .claude/agents/
cp workflow.yaml .claude/workflows/
cp quality-rules.yaml .claude/workflows/
cp human-intervention.yaml .claude/workflows/
```

### 2. 项目文件结构

```
your-project/
├── .claude/
│   ├── agents/           # Agent配置文件
│   │   ├── coordinator.md
│   │   ├── technical-architect.md
│   │   ├── frontend-developer.md
│   │   ├── backend-developer.md
│   │   └── ... (其他agent)
│   ├── workflows/        # 工作流配置
│   │   ├── workflow.yaml
│   │   ├── quality-rules.yaml
│   │   └── human-intervention.yaml
│   └── state/           # 状态管理
│       └── project.db   # 自动创建
├── src/                 # 你的源代码
├── docs/               # 项目文档
├── CLAUDE.md          # Claude Code指导文件
└── package.json       # 项目配置
```

### 3. 更新 CLAUDE.md

在你的项目根目录创建或更新 `CLAUDE.md`，包含以下内容：

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with this project.

## Multi-Agent Development Framework

This project uses a sophisticated multi-agent development framework. The agents are configured in `.claude/agents/` directory.

### Available Agents

**Primary Development Agents:**
- `coordinator`: Central orchestrator for all agent activities
- `technical-architect`: System architecture and API design
- `frontend-developer`: React/TypeScript UI components
- `backend-developer`: Node.js/Fastify API development
- `qa-engineer`: Quality validation and testing

**Supporting Agents:**
- `requirements-analyst`: Requirements gathering and documentation
- `ux-designer`: UI/UX design and prototyping
- `project-manager`: Task planning and dependency management
- `devops-engineer`: Deployment and infrastructure
- `documentation-writer`: Technical documentation
- `code-reviewer`: Code quality and architecture compliance

### Workflow Configuration

The development workflow is defined in `.claude/workflows/workflow.yaml` with:
- 8-stage progressive development process
- Multi-layer quality validation
- Human intervention points for critical decisions
- Controlled parallel execution (max 2 concurrent agents)

### Technology Stack

- **Frontend**: React.js, TypeScript, Vite, Tailwind CSS
- **Backend**: Node.js, Fastify, TypeScript
- **Database**: PostgreSQL, Redis, Prisma ORM
- **Testing**: Jest, React Testing Library, Playwright
- **Infrastructure**: Docker, Docker Compose

## Development Commands

```bash
# Development
npm run dev
npm run build
npm run test
npm run test:coverage
npm run lint
npm run typecheck

# Docker
docker-compose up -d
docker-compose build
```

## Agent Usage Instructions

To use specific agents, reference them in your requests:
- "Use the coordinator to manage this complex task"
- "Have the technical-architect design the API structure"
- "Let the frontend-developer implement this component"
- "Ask the qa-engineer to validate this implementation"
```

## 如何在项目中激活和使用Agents

### 方法一：直接引用Agent
```
请使用 technical-architect agent 为这个电商系统设计架构

请让 frontend-developer agent 实现用户登录组件

请让 coordinator agent 协调前后端开发这个订单管理功能
```

### 方法二：复制Agent配置文件
将agent的markdown文件复制到项目中，Claude Code会自动识别并使用这些配置。

### 方法三：在 CLAUDE.md 中声明
在CLAUDE.md中明确声明可用的agents，Claude会根据任务自动选择合适的agent。

## 项目集成步骤

### 步骤1：初始化项目结构
```bash
# 创建标准的多agent项目结构
mkdir -p .claude/{agents,workflows,state,docs}

# 设置权限
chmod 755 .claude
```

### 步骤2：复制核心配置文件
```bash
# 从框架复制到你的项目
cp ho-agent/workflow.yaml .claude/workflows/
cp ho-agent/quality-rules.yaml .claude/workflows/
cp ho-agent/human-intervention.yaml .claude/workflows/
cp ho-agent/*.md .claude/agents/
```

### 步骤3：定制化配置

根据你的项目需求，修改以下文件：

**1. 更新 `.claude/workflows/workflow.yaml`：**
```yaml
# 调整技术栈
settings:
  project_name: "your-project-name"
  tech_stack:
    frontend: "React/TypeScript/Vite"
    backend: "Node.js/Fastify"
    database: "PostgreSQL"
```

**2. 更新质量标准：**
```yaml
# 在 quality-rules.yaml 中调整阈值
quality_gates:
  code_quality_gate:
    required_validations: ["unit_validation"]
    blocking_conditions:
      - "unit_test_coverage < 80"  # 调整到你的标准
```

### 步骤4：创建项目特定的 CLAUDE.md

```markdown
# 项目特定信息
## Project: [你的项目名称]
## Description: [项目描述]

## Custom Configuration
- Modified quality thresholds for this project
- Specific deployment requirements
- Team-specific conventions
```

## 完整的项目模板

创建一个新项目时可以使用的完整模板：

```bash
#!/bin/bash
# setup-multiagent-project.sh

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

# 创建项目目录
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# 创建基本结构
mkdir -p {src,docs,tests,.claude/{agents,workflows,state}}

# 创建基本文件
cat > CLAUDE.md << 'EOF'
# CLAUDE.md

This project uses the Multi-Agent Development Framework.

## Agents Available
- coordinator: Task orchestration
- technical-architect: System design
- frontend-developer: UI development
- backend-developer: API development
- qa-engineer: Quality validation

Workflow configuration is in `.claude/workflows/workflow.yaml`
EOF

# 创建 package.json
cat > package.json << 'EOF'
{
  "name": "project-name",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "test": "jest",
    "test:coverage": "jest --coverage",
    "lint": "eslint src/",
    "typecheck": "tsc --noEmit"
  }
}
EOF

# 创建 docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
  backend:
    build: ./backend
    ports:
      - "8000:8000"
  database:
    image: postgres:15
    environment:
      POSTGRES_DB: app
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
EOF

echo "Multi-agent project $PROJECT_NAME created successfully!"
echo "Next steps:"
echo "1. Copy agent configurations from ho-agent framework"
echo "2. Customize .claude/workflows/workflow.yaml"
echo "3. Start development with Claude Code"
```

使用方法：
```bash
chmod +x setup-multiagent-project.sh
./setup-multiagent-project.sh my-new-project
```