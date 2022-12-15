import strutils as str

let
  inputFile = open("input.txt")

var
  top3 = [0,0,0]
  sum = 0

for line in inputFile.lines:
  if str.isEmptyOrWhitespace(line):
    if sum > top3[0]:
      if sum <= top3[1]:
        top3[0] = sum
      else:
        for i in low(top3) + 1 .. high(top3):
          if sum >= top3[i]:
            top3[i - 1] = top3[i]
            top3[i] = sum
    sum = 0
  else:
    sum += str.parseInt(line)

var topSum = 0
for top in top3:
  echo top
  topSum += top

echo topSum
