#!/usr/bin/env python3

import csv

input = "participants.csv"
badges = []

def generate(file) :
  with open(file, newline="", encoding='utf-8-sig') as csvfile :
    people = csv.DictReader(csvfile, delimiter=";", quotechar='"')

    for member in people:
      name = member["Last Name"]
      fname = member["First Name"]
      affiliation = member["Institution"]
      country = member["Country"]
      isorga = member["Orga"]
      hasrest = member["Restrictions"]
      activity = member["Activity"]
      badges.append(f"nom = {{{name}}}, pnom = {{{fname}}}, inst = {{{affiliation}}}, pays = {{{country}}}, orga = {{{isorga}}}, act = {{{activity}}}, rest = {{{hasrest}}}")
      
    csvfile.close()

def write_aux(file, tab):
  n = len(tab)
  for i in range(0, n, 6) :
    file.write("  \\begin{tikzpicture}[rotate = 90, transform shape]\n")
    k = 0

    while k < 6 :
      x = 0
      if k%2 :
        x = 10.5
      if i+k < n:
        file.write("    \\draw (" + str(x) + ", " + str(-(k//2)*6.5) + ") pic {badge = {" + tab[i+k] + "}};\n")
      else :
        file.write("    \\draw (" + str(x) + ", " + str(-(k//2)*6.5) + ") pic {badge};\n")
      k += 1

    file.write("  \\end{tikzpicture}\n\n  \\begin{tikzpicture}[rotate = -90, transform shape]\n")
    k = 0

    while k < 6:
      x = 10.5
      if k%2 :
        x = 0
      if i+k < n:
        file.write("    \\draw (" + str(x) + ", " + str(-(k//2)*6.5) + ") pic {badge = {" + tab[i+k] + "}};\n")
      else :
        file.write("    \\draw (" + str(x) + ", " + str(-(k//2)*6.5) + ") pic {badge};\n")
      k += 1

    file.write("  \\end{tikzpicture}\n\n")


def write_tex() :
  all = open("badges.tex", "w", encoding="utf-8")
  all.write("\\documentclass[a4]{article}\n\n" 
            + "\\usepackage{badge}\n\\usepackage[top = 2cm, left = 0cm, bottom = 2cm, right = 0cm]{geometry}\n\\usepackage{fontspec}\n\\setmainfont{Poppins}\n" 
            + "\\pagestyle{empty}\n\n\\begin{document}\n    \\centering\n\n")
  
  write_aux(all, badges)
    
  all.write("\\end{document}\n")
  all.close()


generate(input)
write_tex()
