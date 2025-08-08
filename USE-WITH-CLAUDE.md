# 🚀 Claude Code 一键启用指南

## 一句话启用 Multi-Agent 框架

复制以下内容到你的项目，然后在Claude Code中说这句话即可：

```
请使用这个项目中的Multi-Agent开发框架，按照agents/和workflows/中定义的专业分工和8阶段流程来协作开发
```

## 📋 复制粘贴清单

### 1. 复制框架文件到你的项目

```bash
# 复制整个agents和workflows目录
cp -r ho-agent/agents/ your-project/
cp -r ho-agent/workflows/ your-project/
cp ho-agent/CLAUDE.md your-project/
```

### 2. 项目结构应该是这样
```
your-project/
├── agents/              # 11个专业AI agents
│   ├── coordinator.md
│   ├── technical-architect.md  
│   ├── frontend-developer.md
│   ├── backend-developer.md
│   └── ... (其他7个agents)
├── workflows/           # 开发工作流配置
│   ├── workflow.yaml
│   ├── quality-rules.yaml
│   └── human-intervention.yaml
├── CLAUDE.md           # Claude Code指导文件
└── [你的项目文件...]
```

### 3. 在Claude Code中说这句话
```
请使用这个项目中的Multi-Agent开发框架，按照agents/和workflows/中定义的专业分工和8阶段流程来协作开发
```

## ✅ 验证是否成功

Claude Code应该回复类似内容，表示已经识别到框架：

> "我看到您的项目配置了Multi-Agent开发框架，包含了11个专业agents和完整的8阶段工作流。我会按照以下方式协作：
> 
> 可用agents：coordinator（协调器）、technical-architect（架构师）、frontend-developer（前端）、backend-developer（后端）、qa-engineer（质量保证）等...
> 
> 开发流程：规划阶段 → 框架搭建 → 模块开发 → 质量保证 → 问题修复 → 部署准备 → 生产部署 → 项目完成
> 
> 现在请告诉我您想要开发什么功能，我将协调相应的agents来完成。"

## 🎯 常用启动模式

### 新功能开发
```
请coordinator agent统筹开发一个用户管理系统，包括注册、登录、个人资料管理功能
```

### 已有项目改进
```
请technical-architect分析当前项目架构，然后coordinator制定重构计划
```

### 快速原型开发
```
请按照Single Developer Enhancement模式，让technical-architect设计API，frontend-developer实现界面原型
```

## 🔧 自定义配置

如果需要修改技术栈或流程，编辑这些文件：

- `agents/technical-architect.md` - 修改默认技术栈
- `workflows/workflow.yaml` - 调整开发流程和阶段
- `workflows/quality-rules.yaml` - 调整质量标准
- `CLAUDE.md` - 添加项目特定说明

## 💡 工作原理

1. **Agent识别**: Claude读取`agents/`目录中的所有`.md`文件，理解每个agent的职责
2. **工作流加载**: Claude解析`workflows/`中的YAML配置，了解开发流程
3. **上下文整合**: `CLAUDE.md`提供项目特定的指导信息
4. **智能协作**: Claude根据任务复杂度自动选择合适的agents和流程阶段

## 🎉 就这么简单！

不需要复杂的配置，不需要学习新工具，只需要：
1. 复制文件 → 2. 说一句话 → 3. 开始协作开发！

---

**💫 现在Claude Code永远记得按照你的Multi-Agent工作流来协作开发了！**