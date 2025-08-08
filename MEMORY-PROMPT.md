# Claude Code 记忆 Prompt

## 系统级记忆Prompt

将以下内容添加到你的Claude Code会话开始时，让Claude Code在每次交互中都记住workflow流程：

```
# 系统上下文：Multi-Agent Development Framework

我正在使用一个高级多agent开发框架。请在每次交互中记住以下关键信息：

## 可用Agents及其职责
- **coordinator**: 中央协调器，管理复杂任务、解决冲突、执行质量门控
- **technical-architect**: 技术架构师，系统设计、API规范、技术选型
- **frontend-developer**: 前端开发，React/TypeScript UI组件实现
- **backend-developer**: 后端开发，Node.js/Fastify API开发，遵循TDD
- **qa-engineer**: 质量保证，功能验证、测试自动化、质量报告
- **requirements-analyst**: 需求分析师，需求收集、用户故事、验收标准
- **ux-designer**: UX设计师，界面设计、原型制作、用户体验
- **project-manager**: 项目经理，计划管理、资源协调、进度跟踪
- **devops-engineer**: 运维工程师，容器化、CI/CD、基础设施
- **documentation-writer**: 文档编写，技术文档、API文档、用户指南
- **code-reviewer**: 代码审查，质量检查、最佳实践、安全审核

## 8阶段开发流程
1. **Planning Phase**: 需求分析和架构设计
2. **Framework Setup**: 项目框架和基础配置
3. **Module Development**: 模块开发和功能实现
4. **Quality Assurance**: 多层质量验证
5. **Targeted Fixes**: 问题修复和优化
6. **Deployment Prep**: 部署准备和配置
7. **Production Deployment**: 生产环境部署
8. **Project Completion**: 项目收尾和文档

## 质量门控标准
- Unit Level: 80%测试覆盖率，代码复杂度<10
- Contract Level: API契约一致性验证
- Integration Level: 95%集成测试通过率
- System Level: E2E测试、无障碍性、安全扫描

## 默认技术栈
Frontend: React + TypeScript + Vite + Tailwind CSS
Backend: Node.js + Fastify + TypeScript
Database: PostgreSQL + Redis + Prisma ORM
Testing: Jest + React Testing Library + Playwright
Infrastructure: Docker + Docker Compose + Nginx

## 人工介入点
- **强制**: 需求审批、架构变更、生产部署
- **推荐**: 质量问题、性能下降、进度延误
- **可选**: 优化机会、流程改进建议

当我提出任务时，请：
1. 识别最适合的agent或agent组合
2. 考虑当前所处的开发阶段
3. 应用相应的质量标准
4. 必要时建议人工介入点
5. 遵循渐进式开发原则（单人→前后端分离→全协作）

示例用法：
- 复杂协调任务 → "请使用 coordinator agent"  
- 系统设计 → "请 technical-architect agent"
- UI开发 → "请 frontend-developer agent"
- API开发 → "请 backend-developer agent"
- 质量验证 → "请 qa-engineer agent"
```

## 项目特定记忆Prompt

针对特定项目，可以创建更具体的上下文：

```
# 项目上下文：[项目名称]

除了通用的Multi-Agent框架外，这个项目有以下特点：

## 项目信息
- 项目类型: [电商网站/管理后台/移动应用等]
- 主要功能: [核心功能描述]
- 用户群体: [目标用户]
- 技术栈: [如有自定义技术栈]

## 项目特定配置
- 测试覆盖率要求: [如果不同于默认80%]
- 代码复杂度限制: [如果不同于默认10]
- 特殊质量要求: [性能、安全性等特殊要求]

## 当前阶段
我们目前处于 [具体阶段] 阶段，已完成：
- [已完成的工作]
- [当前进展]

接下来需要：
- [下一步计划]
- [待解决问题]

请在后续交互中记住这些项目特定信息，并相应调整建议和方案。
```

## 自动记忆设置方法

### 方法1: 在.claude/memory.md中设置
```bash
# 在项目根目录创建
mkdir -p .claude
cat > .claude/memory.md << 'EOF'
# Claude Code Session Memory

这个项目使用Multi-Agent Development Framework。

每次会话开始时，请记住：
1. 我们有11个专业agents可用
2. 遵循8阶段渐进式开发流程  
3. 应用多层质量验证标准
4. 考虑人工介入时机

默认技术栈: React + TypeScript + Node.js + Fastify + PostgreSQL

使用格式: "请 [agent-name] agent [具体任务]"
EOF
```

### 方法2: 在CLAUDE.md中添加记忆提示
```markdown
## Session Context for Claude Code

**Important**: Please remember this Multi-Agent framework context throughout our session:

- **Available Agents**: coordinator, technical-architect, frontend-developer, backend-developer, qa-engineer, etc.
- **Development Flow**: 8-stage progressive workflow from planning to deployment
- **Quality Standards**: 80% test coverage, complexity < 10, multi-layer validation
- **Human Intervention**: Required for architecture changes and deployments
- **Usage Pattern**: "请 [agent] agent [task description]"

Keep this context active for all subsequent interactions in this session.
```

### 方法3: 使用初始化脚本
```bash
#!/bin/bash
# init-claude-session.sh

echo "🧠 初始化Claude Code记忆上下文..."

cat << 'EOF'
请在这个会话中始终记住：

我们使用Multi-Agent开发框架，包含以下agents:
• coordinator - 任务协调和冲突解决
• technical-architect - 系统架构设计  
• frontend-developer - React/TS前端开发
• backend-developer - Node.js/Fastify后端开发
• qa-engineer - 质量验证和测试

开发流程：规划→框架→模块开发→质量验证→修复→部署→完成

质量标准：80%覆盖率、复杂度<10、多层验证

使用方式：请 [agent名] agent [任务描述]

现在开始我们的开发工作...
EOF
```

## 高级记忆技巧

### 1. 状态追踪提示
```
# 会话状态追踪

请在每次回复开始时简要确认：
1. 当前使用的agent
2. 所处的开发阶段  
3. 下一步计划

这样可以保持上下文连贯性。
```

### 2. 阶段性总结提示
```
# 阶段性总结提醒

每完成一个重要开发阶段时，请主动：
1. 总结已完成的工作
2. 更新项目状态
3. 规划下一阶段任务
4. 识别潜在风险点

保持项目全局视野。
```

### 3. 质量检查提示
```
# 自动质量检查

在每次代码实现后，自动考虑：
1. 是否满足质量门控标准
2. 是否需要qa-engineer验证
3. 是否触发人工介入条件
4. 是否需要更新文档

确保质量标准一致性。
```

## 使用建议

### 在会话开始时
1. 粘贴通用记忆prompt
2. 添加项目特定信息
3. 确认Claude理解了框架

### 在会话进行中  
1. 经常引用agent名称
2. 提及当前开发阶段
3. 参考质量标准
4. 考虑人工介入时机

### 在会话结束时
1. 总结完成的工作
2. 记录下次会话的起点
3. 更新项目状态文档

这样可以确保Claude Code在每次交互中都能充分利用Multi-Agent框架的能力，提供最佳的开发协助。