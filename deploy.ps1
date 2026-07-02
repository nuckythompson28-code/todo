# 할 일 Todo — GitHub Pages 재배포
# G:\내 드라이브\work\todo 의 앱 파일을 이 repo로 복사 후 push → https://nuckythompson28-code.github.io/todo/
$ErrorActionPreference = "Stop"
$src = "G:\내 드라이브\work\todo"
$dst = $PSScriptRoot
$files = "index.html","manifest.json","sw.js","icon-192.png","icon-512.png","icon-180.png"
foreach($f in $files){ Copy-Item -Path (Join-Path $src $f) -Destination (Join-Path $dst $f) -Force }
Set-Location $dst
git add -A
$changed = git status --porcelain
if([string]::IsNullOrWhiteSpace($changed)){ Write-Host "변경 없음 — 배포 생략"; exit 0 }
$msg = "할 일 Todo 업데이트 " + (Get-Date -Format "yyyy-MM-dd HH:mm")
git -c user.name="김한별" -c user.email="onestar@soltri.com" commit -m $msg
git push
Write-Host "`n배포 완료 → https://nuckythompson28-code.github.io/todo/  (반영까지 최대 1분)"

