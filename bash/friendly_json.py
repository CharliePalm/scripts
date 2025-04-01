import re
import pyperclip
import sys

blob = ' '.join(sys.argv[1:]) if len(sys.argv) > 1 else input('paste the json you want to parse here: ')

blob = str.replace(blob, '\'', '\"')
blob = re.sub(r"(?<!['\"\w])([a-zA-Z_]\w*)(?=\s*:)", r'"\1"', blob)
pyperclip.copy(blob)
print('friendly JSON copied to clipboard')
