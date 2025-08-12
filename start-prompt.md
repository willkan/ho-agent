# 🚀 Human-Orchestrated Multi-Agent Development Framework

## 工作流使用方法

对于**多模块项目**（2个以上模块需要集成），请使用渐进式集成工作流：

**使用方式：**
```
Claude，这个项目有多个模块，需要渐进式集成避免集成地狱。
请参考workflow.yaml执行开发。

用户需求：[描述你的项目需求]
```

Claude会自动：
1. 分析需求，设计架构，生成模块配置
2. 按依赖层级渐进式开发（Layer 1 → Layer 2 → Layer 3...）
3. 每层完成立即验证，问题早发现早解决
4. 智能问题处理，减少人工监督

**简单项目**（单模块）直接描述需求即可，无需工作流。

## 专业Agent团队

**你可以使用这些专业agents，支持并发执行：**
- requirements-analyst, technical-architect, ux-designer
- backend-developer, frontend-developer, devops-engineer  
- qa-engineer, code-reviewer, documentation-writer
- coordinator (负责多agent协调)

## 技术栈标准

### 开发技术栈
- **后端**: Node.js + Fastify + TypeScript + Prisma + SQLite
- **前端**: React + TypeScript + Vite + Shadcn + Tailwind CSS
- **认证**: JWT + 密码哈希
- **数据库**: SQLite (开发) → PostgreSQL (生产)

### 开发规范
- **开发前**: 必须做需求分析和架构设计，形成文档
- **开发中**: 提供一键重启前后端的脚本
- **部署**: Nginx静态资源服务 + API反向代理

## 质量保证

### 测试要求
- **E2E测试**: 用Playwright完成MVP核心场景测试
- **测试证明**: 录屏展示测试通过过程
- **覆盖率**: 边界测试和异常场景覆盖

### 项目结构
- 清晰的目录规范，新人可快速理解
- 完整的文档体系
- 标准化的开发和部署流程

## 渐进式集成优势

✅ **避免集成地狱** - 层级验证，问题不积累  
✅ **提高开发效率** - 智能并发 + 自动化流程  
✅ **减少人工监督** - AI问题处理 + 异常escalation  
✅ **确保代码质量** - 多层验证 + 标准化流程

