#!/bin/bash

# 老照片修复 - GitHub 部署脚本
# 使用方法: ./deploy.sh 你的GitHub用户名

set -e

echo "🚀 老照片修复 - GitHub 部署脚本"
echo "================================"
echo ""

# 检查是否提供了用户名
if [ -z "$1" ]; then
    echo "❌ 错误：请提供GitHub用户名"
    echo ""
    echo "使用方法："
    echo "  ./deploy.sh 你的GitHub用户名"
    echo ""
    echo "示例："
    echo "  ./deploy.sh zhangsan"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="photo-restoration"

echo "📝 配置信息："
echo "  GitHub用户名: $GITHUB_USERNAME"
echo "  仓库名称: $REPO_NAME"
echo ""

# 检查是否已经配置了远程仓库
if git remote get-url origin > /dev/null 2>&1; then
    echo "⚠️  检测到已存在的远程仓库"
    CURRENT_REMOTE=$(git remote get-url origin)
    echo "  当前远程仓库: $CURRENT_REMOTE"
    echo ""
    read -p "是否要更新远程仓库地址？(y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote remove origin
        echo "✅ 已移除旧的远程仓库"
    else
        echo "⏭️  跳过远程仓库配置"
        echo ""
        echo "📤 推送代码到GitHub..."
        git push -u origin main
        echo ""
        echo "✅ 代码推送成功！"
        echo ""
        echo "🌐 访问你的网站："
        echo "  https://$GITHUB_USERNAME.github.io/$REPO_NAME/chat-style.html"
        echo ""
        echo "📚 下一步："
        echo "  1. 访问 https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
        echo "  2. 在 Source 中选择 main 分支"
        echo "  3. 点击 Save"
        echo "  4. 等待1-2分钟后访问上面的网址"
        exit 0
    fi
fi

# 添加远程仓库
echo "🔗 添加远程仓库..."
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "✅ 远程仓库添加成功"
echo ""

# 推送代码
echo "📤 推送代码到GitHub..."
git branch -M main
git push -u origin main
echo ""
echo "✅ 代码推送成功！"
echo ""

# 显示后续步骤
echo "🎉 部署准备完成！"
echo ""
echo "📚 下一步操作："
echo ""
echo "1️⃣  启用GitHub Pages："
echo "   访问: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
echo "   在 Source 中选择: main 分支"
echo "   点击 Save 按钮"
echo ""
echo "2️⃣  等待部署完成（1-2分钟）"
echo ""
echo "3️⃣  访问你的网站："
echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/chat-style.html"
echo ""
echo "💡 提示："
echo "   - 如果页面显示404，请等待几分钟后刷新"
echo "   - 可以在仓库Settings > Pages中查看部署状态"
echo "   - 详细部署指南请查看 DEPLOY.md 文件"
echo ""
echo "🔧 可选操作："
echo "   - 设置自定义域名"
echo "   - 添加Google Analytics"
echo "   - 启用PWA功能"
echo ""
echo "📖 查看完整文档："
echo "   cat DEPLOY.md"
echo ""
echo "✨ 祝你使用愉快！"
