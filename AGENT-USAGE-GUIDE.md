# Multi-Agent 使用指南

## Agent 详细使用说明

### 🎯 Coordinator Agent - 中央协调器

**何时使用：**
- 复杂的多步骤任务需要协调多个环节
- 多个开发者/组件之间存在依赖关系
- 需要质量门控和进度管理
- 发生开发冲突需要仲裁

**使用方式：**
```
请使用 coordinator agent 来管理这个用户管理系统的开发，包括前端组件、后端API和数据库设计

让 coordinator 协调前后端开发团队实现订单处理流程

请 coordinator 评估当前项目进度并提供质量报告
```

**期望输出：**
- 任务分解和优先级排序
- 开发计划和时间安排
- 质量门控报告
- 冲突解决方案

---

### 🏗️ Technical Architect - 技术架构师

**何时使用：**
- 项目初期需要设计系统架构
- 需要制定技术选型和标准
- API设计和数据库建模
- 解决架构级别的技术问题

**使用方式：**
```
请 technical-architect 为这个社交媒体应用设计整体架构

让 technical-architect 设计用户认证和授权系统的API

请 technical-architect 评估当前架构并提出改进建议
```

**期望输出：**
- 系统架构图和技术栈选择
- API规范文档 (OpenAPI 3.0)
- 数据库设计和ER图
- 技术决策文档

**默认技术栈：**
- Frontend: React + TypeScript + Vite + Tailwind
- Backend: Node.js + Fastify + TypeScript  
- Database: PostgreSQL + Redis + Prisma
- Infrastructure: Docker + Nginx

---

### 💻 Frontend Developer - 前端开发

**何时使用：**
- 实现React组件和页面
- 创建响应式布局和交互
- 集成前端状态管理
- 实现前端测试

**使用方式：**
```
请 frontend-developer 实现用户个人资料页面组件

让 frontend-developer 创建购物车功能的前端实现，包括添加、删除和结算

请 frontend-developer 为这个表单添加验证和错误处理
```

**期望输出：**
- React组件代码 (TypeScript)
- 组件测试文件
- 样式实现 (Tailwind CSS)
- Mock数据和服务

**开发标准：**
- 组件隔离和可复用性
- Mock Service Workers 用于API测试
- 无障碍访问性合规
- 移动优先的响应式设计

---

### 🔧 Backend Developer - 后端开发

**何时使用：**
- 实现RESTful API接口
- 数据库操作和模型设计
- 业务逻辑实现
- API测试和文档

**使用方式：**
```
请 backend-developer 实现用户注册和登录的API接口

让 backend-developer 创建订单管理的CRUD操作，包括状态追踪

请 backend-developer 为支付系统实现webhook处理
```

**期望输出：**
- Fastify路由和控制器
- 数据库模型和迁移
- API测试套件
- 业务逻辑服务层

**开发方法：**
- TDD (测试驱动开发)
- 100%单元测试覆盖率
- Clean Architecture原则
- 完整的错误处理和日志记录

---

### 🧪 QA Engineer - 质量保证

**何时使用：**
- 功能开发完成需要验证
- 集成测试和端到端测试
- 性能和安全性测试
- 上线前的质量检查

**使用方式：**
```
请 qa-engineer 验证用户登录流程是否符合设计要求

让 qa-engineer 对购物车功能进行全面测试，包括边界情况

请 qa-engineer 进行性能测试并提供优化建议
```

**期望输出：**
- 功能验证报告
- 自动化测试脚本
- 性能测试结果
- Bug报告和修复验证

**测试范围：**
- 设计规范符合性验证
- 跨浏览器兼容性测试
- 无障碍访问性检查
- 安全漏洞扫描

---

### 📋 Requirements Analyst - 需求分析师

**何时使用：**
- 项目启动阶段收集需求
- 用户故事编写和细化
- 验收标准定义
- 需求变更管理

**使用方式：**
```
请 requirements-analyst 分析这个电商平台的用户需求

让 requirements-analyst 为移动端应用定义功能性和非功能性需求

请 requirements-analyst 将这些业务需求转换为详细的用户故事
```

**期望输出：**
- 需求规格说明书
- 用户故事和验收标准
- 功能优先级排序
- 需求追溯矩阵

---

### 🎨 UX Designer - 用户体验设计师

**何时使用：**
- 设计用户界面和交互流程
- 创建原型和线框图
- 用户体验研究和测试
- 设计系统建立

**使用方式：**
```
请 ux-designer 设计用户注册和登录的完整流程

让 ux-designer 创建移动端购物应用的原型

请 ux-designer 优化现有界面的用户体验
```

**期望输出：**
- 用户界面原型
- 交互流程图
- 组件设计规范
- 用户体验测试报告

---

### 📈 Project Manager - 项目经理

**何时使用：**
- 项目计划和时间管理
- 资源分配和风险管控
- 进度跟踪和状态报告
- 跨团队协调

**使用方式：**
```
请 project-manager 为这个3个月的项目制定详细开发计划

让 project-manager 分析当前项目风险并提出缓解措施

请 project-manager 评估增加新功能对项目时间线的影响
```

**期望输出：**
- 项目计划和里程碑
- 任务分解和依赖关系图
- 风险评估和应对策略
- 进度报告和状态更新

---

### 🚀 DevOps Engineer - 运维工程师

**何时使用：**
- 设置CI/CD流水线
- Docker容器化和部署
- 基础设施配置
- 监控和日志设置

**使用方式：**
```
请 devops-engineer 为这个Node.js应用创建Docker配置

让 devops-engineer 设置GitHub Actions的CI/CD流水线

请 devops-engineer 配置生产环境的监控和告警
```

**期望输出：**
- Dockerfile和docker-compose配置
- CI/CD流水线配置
- Kubernetes部署清单
- 监控仪表板配置

---

### 📚 Documentation Writer - 文档编写

**何时使用：**
- 编写技术文档和用户手册
- API文档生成和维护
- 创建开发者指南
- 项目知识管理

**使用方式：**
```
请 documentation-writer 为这个API创建完整的使用文档

让 documentation-writer 编写新员工onboarding指南

请 documentation-writer 更新项目的技术架构文档
```

**期望输出：**
- API文档和使用示例
- 开发者指南和最佳实践
- 用户手册和FAQ
- 技术决策记录

---

### 👀 Code Reviewer - 代码审查

**何时使用：**
- 代码质量检查和审查
- 架构合规性验证
- 安全性和性能审核
- 最佳实践指导

**使用方式：**
```
请 code-reviewer 审查这个用户认证模块的代码

让 code-reviewer 检查这次提交是否符合项目编码标准

请 code-reviewer 分析这个组件的性能和安全性
```

**期望输出：**
- 代码审查报告
- 改进建议和最佳实践
- 安全漏洞识别
- 性能优化建议

## 组合使用场景

### 场景1：新功能开发
```
1. requirements-analyst 收集和分析需求
2. technical-architect 设计技术方案
3. ux-designer 创建界面原型
4. coordinator 制定开发计划
5. frontend-developer 和 backend-developer 并行开发
6. qa-engineer 进行测试验证
7. code-reviewer 进行代码审查
8. devops-engineer 处理部署
```

### 场景2：紧急Bug修复
```
1. coordinator 评估影响范围
2. technical-architect 分析根因
3. backend-developer/frontend-developer 实施修复
4. qa-engineer 验证修复效果
5. devops-engineer 紧急部署
```

### 场景3：架构重构
```
1. technical-architect 设计新架构
2. coordinator 制定迁移计划
3. 各开发agent按计划重构模块
4. qa-engineer 验证重构质量
5. documentation-writer 更新文档
```

## 最佳实践

### 1. 明确指定Agent
```
好：请 technical-architect 设计用户认证系统
差：帮我设计用户认证系统
```

### 2. 提供足够上下文
```
好：请 frontend-developer 为电商网站实现商品列表页面，需要支持分页、筛选和排序功能
差：做一个商品列表页面
```

### 3. 指定期望输出
```
好：请 qa-engineer 对登录功能进行测试，提供测试报告和自动化测试脚本
差：测试一下登录功能
```

### 4. 利用Agent专长
- 复杂协调 → coordinator
- 架构设计 → technical-architect  
- UI实现 → frontend-developer
- API开发 → backend-developer
- 质量保证 → qa-engineer