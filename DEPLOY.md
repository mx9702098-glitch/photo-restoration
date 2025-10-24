# 🚀 部署指南

## 方法1：部署到GitHub Pages（推荐）

### 步骤1：创建GitHub仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `photo-restoration` 或 `老照片修复`
   - **Description**: `老照片修复 - 小耕AI 移动端网页应用`
   - **Public** (公开仓库才能使用免费的GitHub Pages)
   - ❌ 不要勾选 "Add a README file"
3. 点击 **Create repository**

### 步骤2：推送代码

在终端执行以下命令（替换成你的GitHub用户名）：

```bash
# 进入项目目录
cd /Users/maimai/codebuddy/老照片修复

# 添加远程仓库
git remote add origin https://github.com/你的用户名/photo-restoration.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤3：启用GitHub Pages

1. 进入仓库页面
2. 点击 **Settings** (设置)
3. 在左侧菜单找到 **Pages**
4. 在 **Source** 下拉菜单中选择：
   - Branch: `main`
   - Folder: `/ (root)`
5. 点击 **Save**
6. 等待1-2分钟，页面会显示访问链接

### 步骤4：访问网站

你的网站将部署在：
```
https://你的用户名.github.io/photo-restoration/chat-style.html
```

---

## 方法2：使用GitHub CLI（命令行）

如果你安装了GitHub CLI，可以一键创建并推送：

```bash
# 安装GitHub CLI（如果还没安装）
brew install gh

# 登录GitHub
gh auth login

# 创建仓库并推送
cd /Users/maimai/codebuddy/老照片修复
gh repo create photo-restoration --public --source=. --remote=origin --push

# 启用GitHub Pages
gh api repos/:owner/photo-restoration/pages -X POST -f source[branch]=main -f source[path]=/
```

---

## 方法3：部署到Vercel（更快）

Vercel提供更快的部署速度和CDN加速：

### 使用Vercel CLI

```bash
# 安装Vercel CLI
npm install -g vercel

# 登录Vercel
vercel login

# 部署
cd /Users/maimai/codebuddy/老照片修复
vercel --prod
```

### 使用Vercel网页

1. 访问 https://vercel.com
2. 点击 **Import Project**
3. 选择你的GitHub仓库
4. 点击 **Deploy**
5. 等待部署完成

---

## 方法4：部署到Netlify

Netlify也是一个很好的选择：

### 拖拽部署

1. 访问 https://app.netlify.com/drop
2. 直接拖拽整个项目文件夹
3. 等待部署完成
4. 获得访问链接

### 使用Netlify CLI

```bash
# 安装Netlify CLI
npm install -g netlify-cli

# 登录Netlify
netlify login

# 部署
cd /Users/maimai/codebuddy/老照片修复
netlify deploy --prod
```

---

## 📝 部署后的配置

### 设置默认页面

如果你想让用户访问根目录时直接打开 `chat-style.html`，可以：

**方法1：重命名文件**
```bash
mv chat-style.html index.html
git add .
git commit -m "chore: 重命名主文件为index.html"
git push
```

**方法2：创建重定向**

创建 `index.html` 文件：
```html
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="0; url=chat-style.html">
    <title>跳转中...</title>
</head>
<body>
    <p>正在跳转到老照片修复...</p>
    <script>
        window.location.href = 'chat-style.html';
    </script>
</body>
</html>
```

### 自定义域名（可选）

如果你有自己的域名：

1. 在仓库根目录创建 `CNAME` 文件：
```bash
echo "your-domain.com" > CNAME
git add CNAME
git commit -m "chore: 添加自定义域名"
git push
```

2. 在域名DNS设置中添加CNAME记录：
   - Type: `CNAME`
   - Name: `@` 或 `www`
   - Value: `你的用户名.github.io`

---

## 🔍 验证部署

部署完成后，测试以下功能：

- [ ] 页面能正常打开
- [ ] 点击Action Bar能打开上传模态框
- [ ] 能选择图片上传
- [ ] 处理动画正常显示
- [ ] 能查看对比效果
- [ ] 滑动对比功能正常
- [ ] 能保存图片
- [ ] 发布页面正常工作

---

## 📱 移动端测试

使用手机浏览器访问部署的网址，测试：

- [ ] 相机功能（需要HTTPS）
- [ ] 触摸滑动对比
- [ ] 页面布局适配
- [ ] 按钮点击响应
- [ ] Toast提示显示

---

## 🐛 常见问题

### 1. GitHub Pages显示404

**原因**：GitHub Pages需要几分钟才能生效

**解决**：等待2-5分钟后刷新页面

### 2. 相机功能不工作

**原因**：相机API需要HTTPS环境

**解决**：
- GitHub Pages自动提供HTTPS ✅
- 本地测试使用 `localhost` ✅
- 不要使用HTTP访问 ❌

### 3. 图片无法保存

**原因**：浏览器安全限制

**解决**：
- 确保使用HTTPS
- 检查浏览器权限设置
- 尝试其他浏览器

### 4. 页面样式错乱

**原因**：文件路径问题

**解决**：
- 检查所有资源路径是否正确
- 使用相对路径而非绝对路径
- 清除浏览器缓存

---

## 📊 监控和分析

### 添加Google Analytics（可选）

在 `chat-style.html` 的 `<head>` 标签中添加：

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## 🔄 更新部署

当你修改代码后，重新部署：

```bash
# 提交更改
git add .
git commit -m "feat: 添加新功能"
git push

# GitHub Pages会自动重新部署
# Vercel/Netlify也会自动重新部署（如果连接了Git）
```

---

## 💡 优化建议

### 1. 添加PWA支持

创建 `manifest.json`：
```json
{
  "name": "老照片修复 - 小耕AI",
  "short_name": "照片修复",
  "description": "AI智能修复老照片",
  "start_url": "/chat-style.html",
  "display": "standalone",
  "background_color": "#f5f5f5",
  "theme_color": "#5B7FFF",
  "icons": [
    {
      "src": "icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    }
  ]
}
```

### 2. 添加Service Worker

实现离线访问功能

### 3. 图片压缩

使用CDN或图片压缩服务优化加载速度

---

## 📞 获取帮助

如果遇到问题：

1. 查看GitHub Pages文档：https://docs.github.com/pages
2. 查看Vercel文档：https://vercel.com/docs
3. 查看Netlify文档：https://docs.netlify.com
4. 在仓库中提Issue

---

**祝部署顺利！** 🎉
