import re

file_path = r"C:\Users\82107\Downloads\학심정 보고자료(서비스ver)_260309\사업계획서_학습심리_SEL_슬라이드_v8_edit.html"

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace service section (2 images)
pattern = r"service:\s*\{\s*title:\s*'독립형 서비스',\s*images:\s*\[\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\"\s*\]"
replacement = """service: { title: '독립형 서비스', images: ["images/image_2.png", "images/image_3.png"] }"""
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

# Replace dashboard section (4 images)
pattern = r"dashboard:\s*\{\s*title:\s*'인터랙티브 대시보드',\s*images:\s*\[\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\"\s*\]"
replacement = """dashboard: { title: '인터랙티브 대시보드', images: ["images/image_4.png", "images/image_5.png", "images/image_6.png", "images/image_7.png"] }"""
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

# Replace how section (4 images)
pattern = r"how:\s*\{\s*title:\s*'HOW 가이드',\s*images:\s*\[\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\"\s*\]"
replacement = """how: { title: 'HOW 가이드', images: ["images/image_8.png", "images/image_9.png", "images/image_10.png", "images/image_11.png"] }"""
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

# Replace ai section (3 images)
pattern = r"ai:\s*\{\s*title:\s*'AI 어시스턴트',\s*images:\s*\[\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\",\s*\"data:image/png;base64,[^\"]+\"\s*\]"
replacement = """ai: { title: 'AI 어시스턴트', images: ["images/image_12.png", "images/image_13.png", "images/image_14.png"] }"""
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Done!")
