import strutils, sequtils, std/strformat

let calorieInput = readFile("./input.txt").strip().splitLines();
var elfCalories: seq[int];

var currentCalorieCount = 0
for calorie in calorieInput:
   if isEmptyOrWhitespace(calorie):
      elfCalories.add(currentCalorieCount)
      currentCalorieCount = 0
   else:
      currentCalorieCount.inc(parseInt(calorie))

elfCalories.add(currentCalorieCount)

let elfWithMostCalories = maxIndex(elfCalories) + 1

proc getNaturalLanguagePosition(number: int): string =
   case number mod 10:
      of 1:
         return "{number}st".fmt()
      of 2:
         return "{number}nd".fmt()
      of 3:
         return "{number}rd".fmt()
      else:
         return "{number}th".fmt()

echo "The {getNaturalLanguagePosition(elfWithMostCalories)} Elf is carrying the most calories with a total of {elfCalories[elfWithMostCalories - 1]} calories".fmt()