#!/usr/bin/env python
import difflib

file01 = "http.conf.bak"
file02 = "http.conf"

with open(f'./{file01}', 'r') as f1:
	file01_content = f1.readlines()

with open(f'./{file02}', 'r') as f2:
	file02_content = f2.readlines()

differences = difflib.HtmlDiff(wrapcolumn=79).make_file(file01_content, file02_content)

with open(f'./{file01}_{file02}_compared.html', 'w') as html_table_file:
	html_table_file.write(differences)

