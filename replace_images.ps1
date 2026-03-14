$filePath = "C:\Users\82107\Downloads\학심정 보고자료(서비스ver)_260309\사업계획서_학습심리_SEL_슬라이드_v8_edit.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# Replace service section (2 images)
$content = $content -replace "service:\s*\{\s*title:\s*'독립형 서비스',\s*images:\s*\[\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`"\s*\]", "service: { title: '독립형 서비스', images: [`"images/image_2.png`", `"images/image_3.png`"] }"

# Replace dashboard section (4 images)
$content = $content -replace "dashboard:\s*\{\s*title:\s*'인터랙티브 대시보드',\s*images:\s*\[\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`"\s*\]", "dashboard: { title: '인터랙티브 대시보드', images: [`"images/image_4.png`", `"images/image_5.png`", `"images/image_6.png`", `"images/image_7.png`"] }"

# Replace how section (4 images)
$content = $content -replace "how:\s*\{\s*title:\s*'HOW 가이드',\s*images:\s*\[\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`"\s*\]", "how: { title: 'HOW 가이드', images: [`"images/image_8.png`", `"images/image_9.png`", `"images/image_10.png`", `"images/image_11.png`"] }"

# Replace ai section (3 images)
$content = $content -replace "ai:\s*\{\s*title:\s*'AI 어시스턴트',\s*images:\s*\[\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`",\s*`"data:image/png;base64,[^`"]+`"\s*\]", "ai: { title: 'AI 어시스턴트', images: [`"images/image_12.png`", `"images/image_13.png`", `"images/image_14.png`"] }"

Set-Content -Path $filePath -Value $content -Encoding UTF8
Write-Host "Done!"
