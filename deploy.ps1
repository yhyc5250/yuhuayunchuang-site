# 宇华云创官网 - 自动化部署脚本
# 使用 PowerShell

param(
    [string]$Action = "preview",
    [string]$Remote = ""
)

$SITE_DIR = $PSScriptRoot
$PORT = 8080

Write-Host "🦞 宇华云创官网部署工具" -ForegroundColor Cyan
Write-Host "================================"

switch ($Action) {
    "preview" {
        Write-Host "🚀 启动本地预览服务器..." -ForegroundColor Green
        Write-Host "📍 访问地址：http://localhost:$PORT" -ForegroundColor Yellow
        Write-Host "按 Ctrl+C 停止服务器" -ForegroundColor Gray
        
        # 使用 Python 启动简单 HTTP 服务器
        if (Get-Command python -ErrorAction SilentlyContinue) {
            Set-Location $SITE_DIR
            python -m http.server $PORT
        } elseif (Get-Command npx -ErrorAction SilentlyContinue) {
            Set-Location $SITE_DIR
            npx http-server -p $PORT
        } else {
            Write-Host "❌ 未找到 Python 或 Node.js，请安装其中一个" -ForegroundColor Red
            Write-Host "或者直接在浏览器中打开 index.html 文件" -ForegroundColor Yellow
        }
    }
    
    "github" {
        if ([string]::IsNullOrEmpty($Remote)) {
            Write-Host "❌ 请提供 GitHub 仓库地址" -ForegroundColor Red
            Write-Host "用法：.\deploy.ps1 -Action github -Remote <your-github-repo-url>" -ForegroundColor Yellow
            exit 1
        }
        
        Write-Host "📦 部署到 GitHub Pages..." -ForegroundColor Green
        
        Set-Location $SITE_DIR
        
        # 检查是否有远程仓库
        $hasRemote = git remote -v
        if ([string]::IsNullOrEmpty($hasRemote)) {
            git remote add origin $Remote
            Write-Host "✅ 添加远程仓库：$Remote" -ForegroundColor Green
        }
        
        # 推送到 GitHub
        git branch -M main
        git push -u origin main --force
        
        Write-Host "✅ 部署完成！" -ForegroundColor Green
        Write-Host "📍 GitHub Pages 地址：https://<your-username>.github.io/<repo-name>/" -ForegroundColor Yellow
        Write-Host "⏱️  等待 GitHub Pages 构建（通常需要 1-2 分钟）" -ForegroundColor Gray
    }
    
    "commit" {
        Write-Host "💾 提交本地更改..." -ForegroundColor Green
        
        Set-Location $SITE_DIR
        
        git add .
        $changes = git status --porcelain
        
        if ([string]::IsNullOrEmpty($changes)) {
            Write-Host "✅ 没有需要提交的更改" -ForegroundColor Green
        } else {
            git commit -m "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
            Write-Host "✅ 提交完成" -ForegroundColor Green
        }
    }
    
    default {
        Write-Host "❌ 未知操作：$Action" -ForegroundColor Red
        Write-Host "可用操作：preview, github, commit" -ForegroundColor Yellow
    }
}
