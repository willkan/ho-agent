#!/bin/bash
# setup-workflow.sh - 一键设置多agent工作流到目标项目

set -e

# 获取脚本所在目录（框架目录）
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FRAMEWORK_PATH="$SCRIPT_DIR"

# 目标项目目录 - 默认使用当前工作目录（运行脚本时所在的目录）
PROJECT_ROOT=$(pwd)

# 如果提供了参数，使用参数作为项目路径
if [ $# -eq 1 ]; then
    PROJECT_ROOT="$1"
    # 如果不是绝对路径，转换为绝对路径
    if [[ ! "$PROJECT_ROOT" = /* ]]; then
        PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"
    fi
fi

echo "🚀 设置Multi-Agent工作流"
echo "   框架路径: $FRAMEWORK_PATH"
echo "   目标项目: $PROJECT_ROOT"
echo ""

# 检查是否在框架目录中运行（避免覆盖框架本身）
if [ "$PROJECT_ROOT" = "$FRAMEWORK_PATH" ]; then
    echo "⚠️  警告: 不能在框架目录本身运行此脚本"
    echo "   请切换到你的项目目录后运行："
    echo "   cd /path/to/your/project"
    echo "   bash $0"
    exit 1
fi

# 检查框架文件
if [ ! -d "$FRAMEWORK_PATH/workflows" ] || [ ! -d "$FRAMEWORK_PATH/agents" ]; then
    echo "❌ 错误: 框架文件不完整"
    echo "   框架路径: $FRAMEWORK_PATH"
    echo "   请确保脚本位于ho-agent目录中"
    exit 1
fi

cd "$PROJECT_ROOT"

# 1. 创建目录结构
echo "📁 创建目录结构..."
mkdir -p .claude/{agents,workflows,state}

# 2. 复制workflow配置
echo "📋 复制workflow配置..."
cp -r "$FRAMEWORK_PATH/workflows/"* .claude/workflows/

# 3. 复制所有agent配置
echo "🤖 复制agent配置..."
cp "$FRAMEWORK_PATH/agents/"*.md .claude/agents/

# 4. 创建项目的CLAUDE.md（包含自动化规则）
echo "📝 创建CLAUDE.md..."
cat > CLAUDE.md << 'EOF'
# CLAUDE.md

This file provides guidance to Claude Code when working with this project.

## Multi-Agent Development Framework

This project uses a sophisticated multi-agent development framework located in `.claude/` directory.

## 🚨 CRITICAL RULES FOR THIS PROJECT

### 1. Validation File Protocol: Allow but Manage
**Temporary validation files are OK, but MUST complete the full cycle.**

#### Validation Lifecycle (MANDATORY):
1. **Create**: Make temp file for validation (track it!)
2. **Validate**: Test your hypothesis
3. **Apply**: Transfer solution to ORIGINAL file
4. **Clean**: DELETE the temp file
5. **Verify**: Confirm original problem is fixed

#### Common Temp Patterns (Must Track & Clean):
- `temp-*`, `test-*`, `simple-*`, `debug-*`, `validate-*`
- Created for: isolating issues, testing fixes, validating ideas
- MUST DELETE after applying solution to original

#### Forbidden: Validation File as Final Solution
- ❌ "simple-server.js works, done!" (NO! Fix server.js)
- ❌ Leaving temp files in project
- ❌ Forgetting original problem after validation succeeds

### 2. Continuous Execution Without Pauses
- **NEVER ask "Should I continue?" or "Would you like me to proceed?"**
- **AUTOMATICALLY proceed** when validation passes
- **Only pause for**: requirements approval, architecture changes, deployment

### 3. Complete the Cycle
- **ALLOWED**: Creating temp files for validation
- **REQUIRED**: Apply fixes to original code and delete temp files
- **Remember**: "Validation is the process, not the result"

### 4. Correct Execution Flow
```
✅ Stage complete → validation passed → IMMEDIATELY start next stage
✅ Issue found → create temporary test → validate → RETURN to full implementation
✅ Module validated → AUTOMATICALLY integrate with next module
✅ All tests pass → PROCEED to deployment prep without asking
```

## Available Agents

Located in `.claude/agents/`:
- **coordinator** - Central task orchestration and conflict resolution
- **requirements-analyst** - Requirements elicitation and documentation
- **technical-architect** - System design and architecture
- **frontend-developer** - React/TypeScript UI development
- **backend-developer** - Node.js/Fastify API development
- **qa-engineer** - Quality validation and testing
- **devops-engineer** - Infrastructure and deployment
- **ux-designer** - User interface and experience design
- **project-manager** - Planning and resource management
- **documentation-writer** - Technical documentation
- **code-reviewer** - Code quality and best practices

## Workflow Configuration

The development workflow is defined in `.claude/workflows/workflow.yaml` with:
- 8-stage progressive development process
- Automatic quality gates and validation
- Layer-by-layer integration to prevent integration hell
- Smart problem classification and handling

## Usage Examples

### Start a new feature:
```
请 coordinator agent 管理用户认证系统的完整开发流程
```

### Quick development:
```
请 technical-architect 设计API结构，然后 backend-developer 实现
```

### Full project:
```
使用multi-agent框架开发一个电商网站，包含商品展示、购物车、订单管理
```

## Project-Specific Configuration

[Add any project-specific instructions here]

## Remember

1. This is an automated workflow - minimize human intervention
2. Always complete the full scope, not just validation tests
3. Progress through stages automatically when validation passes
4. Track state to maintain context across the entire development cycle
EOF

# 5. 创建状态跟踪示例
echo "📊 初始化状态跟踪..."
cat > .claude/state/README.md << 'EOF'
# State Tracking

This directory maintains state for the multi-agent workflow:
- Current development stage
- Validation history
- Original task tracking (prevents forgetting after temp tests)
- Agent coordination state

Files are created automatically during workflow execution.
EOF

# 6. 创建快速参考卡
echo "📚 创建快速参考..."
cat > .claude/QUICK-REFERENCE.md << 'EOF'
# Quick Reference

## Automation Reminders
- ✅ Auto-proceed after validation
- ✅ Return to full scope after temp tests
- ❌ Never ask "Should I continue?"
- ❌ Never stop at simple-xx implementation

## Common Commands
```bash
# Check project structure
ls -la .claude/

# View current workflow
cat .claude/workflows/workflow.yaml

# List available agents
ls .claude/agents/
```

## Troubleshooting
If Claude Code asks for confirmation unnecessarily:
1. Remind it to check CLAUDE.md automation rules
2. Reference the "no pause" policy
3. Point to successful validation = auto-continue
EOF

echo ""
echo "✅ Multi-Agent Workflow设置完成！"
echo ""
echo "📁 项目路径: $PROJECT_ROOT"
echo "📁 已创建结构:"
echo "   .claude/"
echo "   ├── agents/         (11个AI agents)"
echo "   ├── workflows/      (工作流配置)"
echo "   └── state/          (状态跟踪)"
echo ""
echo "📄 已创建文件:"
echo "   CLAUDE.md          (包含自动化规则)"
echo ""
echo "🚀 使用方法:"
echo "   1. 在Claude Code中打开项目: $PROJECT_ROOT"
echo "   2. Claude Code会自动读取CLAUDE.md并应用规则"
echo "   3. 开始使用: '请coordinator agent管理[你的需求]'"
echo ""
echo "⚠️  重要提醒:"
echo "   - 临时验证文件必须完成5步生命周期"
echo "   - 验证成功后自动继续，不询问确认"
echo "   - 只在架构变更和部署时需要人工批准"