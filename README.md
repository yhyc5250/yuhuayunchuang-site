# 宇华云创企业官网

这是一个为宇华云创（河北雄安）供应链管理有限公司创建的静态企业官网。

**最新版本：** 已添加公司 LOGO（页面左上角）

---

## 推荐域名

- **yuhuayunchuang.com** (全拼，易记)
- **yhyc.com** (缩写，简短)
- **yuhuayunchuang.cn** (国内域名)
- **yhyc.cn** (缩写国内域名)

## 🚀 快速部署

### 自动化部署脚本（推荐）

本项目包含自动化部署脚本 `deploy.ps1`，支持以下操作：

**1. 本地预览**
```powershell
cd yuhuayunchuang-site
.\deploy.ps1 -Action preview
```
然后在浏览器访问 http://localhost:8080

**2. 提交更改**
```powershell
.\deploy.ps1 -Action commit
```

**3. 部署到 GitHub Pages**
```powershell
.\deploy.ps1 -Action github -Remote https://github.com/your-username/yuhuayunchuang-site.git
```

---

## 部署方式

### 方式一：Vercel（推荐）

1. 访问 https://vercel.com
2. 使用 GitHub 账号登录
3. 点击 "Add New Project"
4. 导入此文件夹
5. 选择域名并部署

命令行部署：
```bash
npm install -g vercel
cd yuhuayunchuang-site
vercel --prod
```

### 方式二：Netlify

1. 访问 https://netlify.com
2. 注册/登录账号
3. 将 `yuhuayunchuang-site` 文件夹拖拽到 Netlify Drop
4. 绑定自定义域名

### 方式三：GitHub Pages

1. 创建 GitHub 仓库
2. 将此文件夹内容推送到仓库
3. 在 Settings → Pages 中启用 GitHub Pages
4. 绑定自定义域名

### 方式四：传统主机

将 `index.html` 上传到任何 web 服务器的根目录即可。

## 购买域名

推荐域名注册商：
- 阿里云（万网）：https://wanwang.aliyun.com/domain
- 腾讯云：https://cloud.tencent.com/product/domain
- Namecheap：https://namecheap.com
- GoDaddy：https://godaddy.com

## 网站内容

网站包含以下部分：
- 首页（Hero Section）
- 关于我们（公司概况、地理位置、企业使命）
- 业务领域（货物出口、商务考察、供应链管理、国际贸易咨询）
- 联系我们（地址、法人、商务合作）

## 自定义

如需修改内容，直接编辑 `index.html` 文件即可。
