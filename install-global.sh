#!/bin/bash
# install-global.sh - 全局安装ho-agent命令

set -e

# 获取脚本所在目录（框架目录）
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🚀 安装ho-agent全局命令"
echo ""

# 创建符号链接到 /usr/local/bin
LINK_PATH="/usr/local/bin/ho-agent"

# 创建一个wrapper脚本
cat > /tmp/ho-agent-wrapper << EOF
#!/bin/bash
# ho-agent wrapper - 在当前目录初始化multi-agent工作流

# 框架路径（硬编码）
FRAMEWORK_PATH="$SCRIPT_DIR"

# 执行setup脚本，使用当前目录作为项目目录
bash "\$FRAMEWORK_PATH/setup-workflow.sh"
EOF

# 安装wrapper
if [ -w "/usr/local/bin" ]; then
    cp /tmp/ho-agent-wrapper "$LINK_PATH"
    chmod +x "$LINK_PATH"
    echo "✅ 已安装到: $LINK_PATH"
else
    echo "需要sudo权限来安装到 /usr/local/bin"
    sudo cp /tmp/ho-agent-wrapper "$LINK_PATH"
    sudo chmod +x "$LINK_PATH"
    echo "✅ 已安装到: $LINK_PATH"
fi

# 清理临时文件
rm /tmp/ho-agent-wrapper

echo ""
echo "📋 使用方法："
echo "   1. 进入你的项目目录"
echo "   2. 运行: ho-agent"
echo ""
echo "示例："
echo "   cd /path/to/your/project"
echo "   ho-agent"
echo ""
echo "✨ 现在你可以在任何项目目录中运行 'ho-agent' 来初始化工作流了！"