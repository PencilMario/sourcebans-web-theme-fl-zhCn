import re, os

# 匹配中文翻译语句的正则表达式
TRANSLATE_PATTERN = re.compile(r"translate chinese\s+(.*):")

# 匹配双引号括起来的文本的正则表达式
#TEXT_PATTERN = re.compile(r'\"(.*?)\"') # 这不会返回最长的
TEXT_PATTERN = re.compile(r'\"(.*)\"')

# 匹配方括号包裹的内容的正则表达式
BRACKET_PATTERN = re.compile(r'\[(.*?)\]')  

FILES = r"E:\GithubKu\sourcebans-web-theme-fl-zhCn\sourcebans-web-theme-fluent"

# 待遍历的文件列表
fs = os.listdir(FILES)
files = []

for root, dirs, fs in os.walk(FILES):
    for f in fs:
        if f.endswith('.tpl'):
            filp = os.path.join(root, f)
            files.append(filp)
            print(filp)

import re
import deepl

import deepl, time
from tqdm import tqdm
from functools import lru_cache
auth_key = "不给"  # Replace with your key
translator = deepl.Translator(auth_key)
@lru_cache(maxsize=5000)
def TranslateStr(original:str):
    stripped_text = original.strip()
    if not stripped_text:
        return original
    
    res = translator.translate_text(original, target_lang="ZH").text
    tqdm.write(f"{original.strip()} -> {res.strip()}")
    return res

def translate_tql_content(content):
    # 使用正则表达式匹配所有非HTML标签的文本，并处理花括号中的内容
    def translate_match(match):
        original_text = match.group(1)
        
        # 查找花括号中的部分，并将其从文本中去除，保留原样
        parts = re.split(r'(\{.*?\})', original_text)
        translated_parts = [TranslateStr(part) if not (part.startswith('{') and part.endswith('}')) else part for part in parts]
        
        # 拼接翻译后的结果
        translated_text = ''.join(translated_parts)
        
        # 保留HTML标签以及翻译后的内容
        return '>' + translated_text + '<'
    
    translated_content = re.sub(r">(.*?)<", translate_match, content, flags=re.DOTALL)
    return translated_content

def translate_file(file_path):
    # 读取文件内容
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # 翻译内容
    translated_content = translate_tql_content(content)
    
    # 写入翻译后的内容到新文件
    translated_file_path = file_path.replace('.tql', '_translated.tql')
    with open(translated_file_path, 'w', encoding='utf-8') as file:
        file.write(translated_content)

for i in tqdm(files):
    translate_file(os.path.join(FILES, i))

#print(translate_tql_content("<div>你好</div><div>{translate chinese \"Hello\":}</div>"))



