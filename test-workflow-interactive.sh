#!/bin/bash

# This script uses expect to interact with Claude Code
# Install expect if not available: brew install expect (macOS) or apt-get install expect (Linux)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   HO-Agent Interactive Workflow Test       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"

# Setup
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXAMPLE_DIR="${SCRIPT_DIR}/example"

# Step 1: Prepare directory
echo -e "\n${YELLOW}▶ Preparing test environment...${NC}"
rm -rf "$EXAMPLE_DIR" 2>/dev/null
mkdir -p "$EXAMPLE_DIR"

# Step 2: Run setup-workflow.sh from framework directory targeting example
echo -e "${YELLOW}▶ Running setup-workflow.sh to initialize example directory...${NC}"
cd "$SCRIPT_DIR"
if [ -f "./setup-workflow.sh" ]; then
    # Run setup script with example directory as target
    ./setup-workflow.sh "$EXAMPLE_DIR"
    echo -e "${GREEN}  ✓ Workflow setup complete${NC}"
else
    echo -e "${RED}  ✗ setup-workflow.sh not found in $SCRIPT_DIR${NC}"
    # Fallback to manual setup
    echo -e "${YELLOW}  Using manual setup...${NC}"
    mkdir -p "$EXAMPLE_DIR/.claude"
    ln -s "$SCRIPT_DIR/agents" "$EXAMPLE_DIR/.claude/agents"
    ln -s "$SCRIPT_DIR/workflows" "$EXAMPLE_DIR/.claude/workflows"
    cp "$SCRIPT_DIR/CLAUDE.md" "$EXAMPLE_DIR/CLAUDE.md"
fi

# Change to example directory for the rest of the script
cd "$EXAMPLE_DIR"
echo -e "${GREEN}  ✓ Environment ready at: $EXAMPLE_DIR${NC}"

# Step 2: Create expect script
cat > "$EXAMPLE_DIR/run-test.exp" << 'EOF'
#!/usr/bin/expect -f

set timeout -1

# Change to example directory
cd [lindex $argv 0]

# Start claude with skip permissions flag
spawn claude --dangerously-skip-permissions

# Wait for claude to be ready
expect {
    "Welcome to Claude" { }
    ">" { }
    timeout { 
        puts "Claude startup timeout"
        exit 1
    }
}

# Send the workflow command
send "按照workflow开发一个简单的登录验证服务，要求：\r"
send "1. 页面访问时检查是否已登录\r"
send "2. 未登录显示登录表单\r"
send "3. 登录成功后显示 Hello World! Welcome \[username\]\r"
send "4. 纯前端实现，使用localStorage保存登录状态\r"
send "5. 预置用户：admin/password\r"
send "\r"

# Keep the session interactive
interact
EOF

chmod +x "$EXAMPLE_DIR/run-test.exp"

# Step 3: Check if expect is installed
if ! command -v expect &> /dev/null; then
    echo -e "${YELLOW}Warning: 'expect' is not installed${NC}"
    echo "To use automated interaction, install expect:"
    echo "  macOS: brew install expect"
    echo "  Linux: sudo apt-get install expect"
    echo ""
    echo "Alternative: Run manually:"
    echo "  1. cd $EXAMPLE_DIR"
    echo "  2. claude"
    echo "  3. Paste the prompt from prompt.txt"
fi

# Step 4: Create prompt file for manual use
cat > "$EXAMPLE_DIR/prompt.txt" << 'EOF'
按照workflow开发一个简单的登录验证服务，要求：
1. 页面访问时检查是否已登录
2. 未登录显示登录表单
3. 登录成功后显示 Hello World! Welcome [username]
4. 纯前端实现，使用localStorage保存登录状态
5. 预置用户：admin/password
EOF

# Step 5: Create Python alternative (if expect not available)
cat > "$EXAMPLE_DIR/run-test.py" << 'EOF'
#!/usr/bin/env python3

import subprocess
import sys
import os
import time

def run_claude_test():
    """Run Claude with test prompt using subprocess"""
    
    prompt = """按照workflow开发一个简单的登录验证服务，要求：
1. 页面访问时检查是否已登录
2. 未登录显示登录表单
3. 登录成功后显示 Hello World! Welcome [username]
4. 纯前端实现，使用localStorage保存登录状态
5. 预置用户：admin/password
"""
    
    try:
        # Start claude process with skip permissions flag
        process = subprocess.Popen(
            ['claude', '--dangerously-skip-permissions'],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            cwd=os.path.dirname(os.path.abspath(__file__))
        )
        
        # Send prompt
        process.stdin.write(prompt + '\n')
        process.stdin.flush()
        
        # Keep process running interactively
        process.wait()
        
    except FileNotFoundError:
        print("Error: 'claude' command not found")
        print("Please ensure Claude Code is installed")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_claude_test()
EOF

chmod +x "$EXAMPLE_DIR/run-test.py"

# Step 6: Display instructions
echo -e "\n${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║          Test Setup Complete!              ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"

echo -e "\n${BLUE}Option 1: Automated with expect${NC}"
echo -e "  ${YELLOW}cd $EXAMPLE_DIR && ./run-test.exp $EXAMPLE_DIR${NC}"

echo -e "\n${BLUE}Option 2: Python script${NC}"
echo -e "  ${YELLOW}cd $EXAMPLE_DIR && python3 run-test.py${NC}"

echo -e "\n${BLUE}Option 3: Manual execution${NC}"
echo -e "  ${YELLOW}cd $EXAMPLE_DIR${NC}"
echo -e "  ${YELLOW}claude --dangerously-skip-permissions${NC}"
echo -e "  Then paste content from ${YELLOW}prompt.txt${NC}"

echo -e "\n${BLUE}Expected Workflow Stages:${NC}"
echo "  1. Requirements conversation (Stage 0)"
echo "  2. Architecture + UX parallel (Stage 1)"
echo "  3. Storyline generation & approval"
echo "  4. Project setup (Stage 2)"
echo "  5. Storyline implementation (Stage 3)"
echo "  6. Testing & deployment (Stage 4-7)"

# Try to run automatically
echo -e "\n${YELLOW}Run test now? (y/n)${NC}"
read -r response
if [[ "$response" =~ ^[Yy]$ ]]; then
    cd "$EXAMPLE_DIR"
    if command -v expect &> /dev/null; then
        echo -e "${GREEN}Starting Claude with expect...${NC}"
        ./run-test.exp "$EXAMPLE_DIR"
    else
        echo -e "${GREEN}Starting Claude manually...${NC}"
        echo -e "${YELLOW}Please paste the following prompt:${NC}"
        cat prompt.txt
        echo ""
        claude --dangerously-skip-permissions
    fi
fi