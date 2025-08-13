# Workflow 复制和配置指南

## 一键复制 Workflow 到项目

### 快速设置脚本

创建以下脚本来快速设置多agent工作流：

```bash
#!/bin/bash
# setup-workflow.sh - 一键设置多agent工作流

set -e

PROJECT_ROOT=${1:-$(pwd)}
FRAMEWORK_PATH=${2:-"./ho-agent"}

echo "🚀 设置多agent工作流到项目: $PROJECT_ROOT"

# 检查框架路径
if [ ! -d "$FRAMEWORK_PATH" ]; then
    echo "❌ 错误: 找不到框架路径 $FRAMEWORK_PATH"
    echo "请确保ho-agent框架在正确位置，或指定正确路径："
    echo "  $0 [项目路径] [框架路径]"
    exit 1
fi

cd "$PROJECT_ROOT"

# 1. 创建目录结构
echo "📁 创建目录结构..."
mkdir -p .claude/{agents,workflows,state,docs}
mkdir -p docs/{architecture,api,deployment}
mkdir -p scripts

# 2. 复制核心配置文件
echo "📋 复制workflow配置文件..."
cp "$FRAMEWORK_PATH/workflow.yaml" .claude/workflows/
cp "$FRAMEWORK_PATH/quality-rules.yaml" .claude/workflows/
cp "$FRAMEWORK_PATH/human-intervention.yaml" .claude/workflows/

# 3. 复制所有agent配置
echo "🤖 复制agent配置文件..."
cp "$FRAMEWORK_PATH"/*.md .claude/agents/

# 4. 创建项目特定的CLAUDE.md
echo "📝 创建CLAUDE.md..."
cat > CLAUDE.md << 'EOF'
# CLAUDE.md

This file provides guidance to Claude Code when working with this project.

## Multi-Agent Development Framework Enabled

This project uses a sophisticated multi-agent development framework located in `.claude/` directory.

## CRITICAL RULES FOR THIS PROJECT

### 1. ABSOLUTE RULE: No Escape Routes
**When encountering problems, fix them in place. NEVER create new files to bypass issues.**

#### Forbidden Patterns:
- ❌ server.js error → create simple-server.js
- ❌ Complex component → create SimpleComponent.jsx
- ❌ API issues → create mock-api.js
- ❌ "Let me create a simpler version..."

#### Required Process:
1. Find error in EXISTING file
2. Fix in ORIGINAL code
3. Test on ORIGINAL implementation

### 2. Continuous Execution
- NEVER ask "Should I continue?"
- Auto-proceed after validation
- Only pause for: requirements, architecture, deployment

### 3. Remember
**"The only way out is through" - Fix problems where they are, don't create escape routes.**

### Correct Workflow Example
```
✅ Stage 1 complete → validation passed → IMMEDIATELY start Stage 2
✅ Found issue → create temporary test → test passes → RETURN to full implementation
✅ Module validated → AUTOMATICALLY integrate with next module
✅ All tests pass → PROCEED to next phase without asking
```

### Quick Start for Claude Code

**Available Agents:**
- `coordinator` - Central task orchestration and conflict resolution
- `technical-architect` - System design and architecture
- `frontend-developer` - React/TypeScript UI development  
- `backend-developer` - Node.js/Fastify API development
- `qa-engineer` - Quality validation and testing
- `requirements-analyst` - Requirements gathering and user stories
- `ux-designer` - UI/UX design and prototyping
- `project-manager` - Planning and resource management
- `devops-engineer` - Deployment and infrastructure
- `documentation-writer` - Technical documentation
- `code-reviewer` - Code quality and best practices

### Usage Examples

**For complex tasks:**
```
请使用 coordinator agent 来管理这个用户管理系统的完整开发流程
```

**For specific development:**
```  
请 technical-architect 设计这个电商系统的架构
请 frontend-developer 实现商品列表页面组件
请 backend-developer 创建订单管理API
请 qa-engineer 验证支付流程的功能
```

### Workflow Stages

The framework follows an 8-stage development process:
1. Planning Phase - Requirements and architecture
2. Framework Setup - Basic project structure  
3. Module Development - Feature implementation
4. Quality Assurance - Multi-layer validation
5. Targeted Fixes - Issue resolution
6. Deployment Prep - Production readiness
7. Production Deployment - Go-live
8. Project Completion - Documentation and handover

### Quality Gates

- **Unit Level**: 80% test coverage, code complexity < 10
- **Contract Level**: API schema validation, type consistency
- **Integration Level**: 95% integration test pass rate
- **System Level**: E2E workflows, accessibility compliance

### Human Intervention Points

- **Mandatory**: Requirements approval, architecture changes, deployment approval
- **Recommended**: Multiple quality issues, performance degradation  
- **Optional**: Optimization opportunities, process improvements

## Project Configuration

EOF

# 5. 创建项目特定配置
echo "⚙️ 创建项目配置..."

# 创建 .claude/project-config.yaml
cat > .claude/project-config.yaml << EOF
project:
  name: "$(basename $PROJECT_ROOT)"
  version: "1.0.0"
  description: "Multi-agent development project"
  
tech_stack:
  frontend:
    framework: "React"
    language: "TypeScript" 
    build_tool: "Vite"
    styling: "Tailwind CSS"
  backend:
    runtime: "Node.js"
    framework: "Fastify"
    language: "TypeScript"
    database: "PostgreSQL"
  infrastructure:
    containerization: "Docker"
    orchestration: "Docker Compose"
    reverse_proxy: "Nginx"

development:
  test_coverage_threshold: 80
  code_complexity_limit: 10
  max_concurrent_agents: 2
  
quality_gates:
  unit_tests_required: true
  integration_tests_required: true
  e2e_tests_required: true
  security_scan_required: true
EOF

# 6. 创建 package.json scripts (如果package.json存在)
if [ -f "package.json" ]; then
    echo "📦 更新package.json scripts..."
    
    # 备份原文件
    cp package.json package.json.backup
    
    # 使用node来更新scripts
    node -e "
    const fs = require('fs');
    const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    
    pkg.scripts = pkg.scripts || {};
    
    // 添加多agent相关的scripts
    Object.assign(pkg.scripts, {
        'agents:setup': 'node scripts/setup-agents.js',
        'agents:status': 'node scripts/agent-status.js',
        'workflow:validate': 'node scripts/validate-workflow.js',
        'quality:check': 'npm run lint && npm run test && npm run typecheck',
        'quality:coverage': 'jest --coverage',
        'quality:complexity': 'npx complexity-report src/',
        'dev:full': 'concurrently \"npm run dev:frontend\" \"npm run dev:backend\"'
    });
    
    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
    "
    
    echo "✅ 已更新package.json scripts"
fi

# 7. 创建辅助脚本
echo "🔧 创建辅助脚本..."

# Agent状态检查脚本
cat > scripts/agent-status.js << 'EOF'
#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

console.log('🤖 Multi-Agent Framework Status\n');

const agentDir = '.claude/agents';
if (fs.existsSync(agentDir)) {
    const agents = fs.readdirSync(agentDir)
        .filter(file => file.endsWith('.md'))
        .map(file => file.replace('.md', ''));
    
    console.log(`Available Agents (${agents.length}):`);
    agents.forEach(agent => {
        console.log(`  ✓ ${agent}`);
    });
} else {
    console.log('❌ Agent directory not found');
}

const workflowDir = '.claude/workflows';
if (fs.existsSync(workflowDir)) {
    const workflows = fs.readdirSync(workflowDir);
    console.log(`\nWorkflow Files (${workflows.length}):`);
    workflows.forEach(file => {
        console.log(`  ✓ ${file}`);
    });
}

console.log('\n📋 Usage Examples:');
console.log('  请 coordinator agent 管理这个复杂任务');
console.log('  请 technical-architect 设计系统架构');
console.log('  请 frontend-developer 实现UI组件');
console.log('  请 backend-developer 创建API接口');
EOF

chmod +x scripts/agent-status.js

# 工作流验证脚本
cat > scripts/validate-workflow.js << 'EOF'
#!/usr/bin/env node
const fs = require('fs');
const yaml = require('yaml');

console.log('🔍 Validating Multi-Agent Workflow Configuration\n');

const checks = [
    {
        file: '.claude/workflows/workflow.yaml',
        name: 'Main Workflow'
    },
    {
        file: '.claude/workflows/quality-rules.yaml', 
        name: 'Quality Rules'
    },
    {
        file: '.claude/workflows/human-intervention.yaml',
        name: 'Human Intervention'
    }
];

let allValid = true;

checks.forEach(check => {
    if (fs.existsSync(check.file)) {
        try {
            const content = fs.readFileSync(check.file, 'utf8');
            yaml.parse(content);
            console.log(`✅ ${check.name}: Valid`);
        } catch (error) {
            console.log(`❌ ${check.name}: Invalid YAML - ${error.message}`);
            allValid = false;
        }
    } else {
        console.log(`❌ ${check.name}: File not found`);
        allValid = false;
    }
});

if (allValid) {
    console.log('\n🎉 All workflow configurations are valid!');
} else {
    console.log('\n⚠️  Some configurations have issues. Please fix before proceeding.');
    process.exit(1);
}
EOF

chmod +x scripts/validate-workflow.js

# 8. 创建Docker配置 (如果不存在)
if [ ! -f "docker-compose.yml" ]; then
    echo "🐳 创建Docker配置..."
    cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  frontend:
    build: 
      context: ./frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - VITE_API_URL=http://localhost:8000/api
    volumes:
      - ./frontend:/app
      - /app/node_modules
    depends_on:
      - backend

  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile  
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://user:password@postgres:5432/appdb
      - REDIS_URL=redis://redis:6379
      - NODE_ENV=development
    volumes:
      - ./backend:/app
      - /app/node_modules
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15-alpine
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_DB=appdb
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - frontend
      - backend

volumes:
  postgres_data:
  redis_data:
EOF
fi

# 9. 创建README更新
echo "📖 更新项目README..."
if [ -f "README.md" ]; then
    cp README.md README.md.backup
fi

cat >> README.md << 'EOF'

## 🤖 Multi-Agent Development Framework

This project uses an advanced multi-agent development framework for AI-assisted development.

### Quick Start

```bash
# Check agent status
npm run agents:status

# Validate workflow configuration  
npm run workflow:validate

# Run quality checks
npm run quality:check

# Start development environment
npm run dev:full
```

### Available Agents

- **coordinator** - Central task orchestration
- **technical-architect** - System design and architecture  
- **frontend-developer** - React/TypeScript UI development
- **backend-developer** - Node.js/Fastify API development
- **qa-engineer** - Quality validation and testing

### Usage with Claude Code

```
请 coordinator agent 管理这个用户管理功能的完整开发

请 technical-architect 为电商系统设计数据库架构

请 frontend-developer 实现响应式的商品展示组件
```

### Development Workflow

1. **Planning Phase** - Requirements analysis and architecture design
2. **Framework Setup** - Project structure and basic configuration
3. **Module Development** - Feature implementation with quality gates
4. **Quality Assurance** - Multi-layer testing and validation
5. **Deployment** - Production readiness and deployment

### Quality Standards

- 80% minimum test coverage
- Code complexity limit: 10
- All quality gates must pass
- Human approval required for architectural changes

EOF

# 10. 完成设置
echo ""
echo "🎉 Multi-Agent Workflow 设置完成!"
echo ""
echo "📁 创建的文件和目录:"
echo "  ├── .claude/"
echo "  │   ├── agents/          # Agent配置文件"
echo "  │   ├── workflows/       # 工作流配置"  
echo "  │   └── state/           # 状态管理"
echo "  ├── scripts/             # 辅助脚本"
echo "  ├── CLAUDE.md           # Claude Code指导文件"
echo "  └── docker-compose.yml  # 容器配置"
echo ""
echo "🚀 下一步:"
echo "  1. 检查agent状态: npm run agents:status"
echo "  2. 验证配置: npm run workflow:validate"  
echo "  3. 开始使用: 在Claude Code中引用specific agents"
echo ""
echo "📖 使用示例:"
echo "  请 coordinator agent 管理整个项目开发流程"
echo "  请 technical-architect 设计系统架构"
echo "  请 frontend-developer 实现用户界面"
echo ""
```

使用方法：
```bash
# 保存为脚本文件
chmod +x setup-workflow.sh

# 在项目目录中运行
./setup-workflow.sh

# 或指定项目路径和框架路径
./setup-workflow.sh /path/to/your/project /path/to/ho-agent
```

## 手动复制指南

如果不想使用脚本，可以手动执行以下步骤：

### 1. 创建目录结构
```bash
mkdir -p .claude/{agents,workflows,state}
mkdir -p docs/{architecture,api}
```

### 2. 复制核心文件
```bash
# 复制workflow配置
cp ho-agent/workflow.yaml .claude/workflows/
cp ho-agent/quality-rules.yaml .claude/workflows/  
cp ho-agent/human-intervention.yaml .claude/workflows/

# 复制所有agent配置
cp ho-agent/*.md .claude/agents/
```

### 3. 创建CLAUDE.md
```markdown
# CLAUDE.md

## Multi-Agent Framework Available

This project has multi-agent development framework configured in `.claude/` directory.

## AUTOMATION RULES FOR THIS PROJECT

### Continuous Workflow Execution
- NEVER ask "Should I continue?" after successful validation
- AUTOMATICALLY proceed to next stage when current completes
- Only pause for: requirements approval, architecture changes, deployment

### Temporary Test Recovery
- When creating temporary tests (simple-xx, test-xx, minimal-xx, etc.)
- ALWAYS return to full implementation after validation
- NEVER treat temporary test as final solution

### Quick Agent Reference
- `coordinator` - Task orchestration and conflict resolution
- `technical-architect` - System design and architecture
- `frontend-developer` - React/TypeScript UI components
- `backend-developer` - Node.js/Fastify API development
- `qa-engineer` - Quality validation and testing

### Usage
请 [agent-name] agent [具体任务描述]

Example:
请 coordinator agent 管理这个电商网站的完整开发流程
```

### 4. 项目特定配置

根据你的项目类型，修改 `.claude/workflows/workflow.yaml` 中的技术栈配置：

```yaml
# 更新技术栈部分
settings:
  tech_stack:
    frontend: "React/TypeScript/Vite"  # 或 Vue.js, Angular等
    backend: "Node.js/Fastify"         # 或 Python/FastAPI, Java/Spring等  
    database: "PostgreSQL"            # 或 MySQL, MongoDB等
```

## 验证设置

设置完成后，运行以下检查：

### 1. 检查文件结构
```bash
ls -la .claude/
# 应该看到 agents/, workflows/, state/ 目录

ls -la .claude/agents/
# 应该看到所有 *.md agent配置文件

ls -la .claude/workflows/  
# 应该看到 workflow.yaml, quality-rules.yaml 等配置文件
```

### 2. 验证配置文件
```bash
# 检查YAML语法
python -c "import yaml; yaml.safe_load(open('.claude/workflows/workflow.yaml'))"
# 或使用
node -e "const yaml=require('yaml'); console.log('Valid:', yaml.parse(require('fs').readFileSync('.claude/workflows/workflow.yaml','utf8')))"
```

### 3. 测试Claude Code集成
在Claude Code中运行：
```
请检查这个项目的multi-agent框架设置是否正确
```

如果设置正确，Claude应该能识别并列出所有可用的agents。

## 常见问题

### Q: 如何知道框架已经正确设置？
A: 在Claude Code中询问可用的agents，如果能正确列出所有agent并解释其功能，说明设置成功。

### Q: 可以选择性复制某些agents吗？  
A: 可以，但建议至少包含 coordinator, technical-architect, frontend-developer, backend-developer 这四个核心agents。

### Q: 如何自定义workflow流程？
A: 编辑 `.claude/workflows/workflow.yaml` 文件，根据项目需求调整stages和tasks。

### Q: 不同项目可以使用不同的技术栈吗？
A: 可以，在各个agent的配置文件中修改默认技术栈，或在 `.claude/project-config.yaml` 中覆盖。