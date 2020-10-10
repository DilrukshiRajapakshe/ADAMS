from Translater import translate

number = {
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
    16: "sixteen",
    17: "seventeen",
    18: "eighteen",
    19: "nineteen",
    20: "twenty",
    21: "twenty-one",
    22: "twenty-two",
    23: "twenty-three",
    24: "twenty-four",
    25: "twenty-five",
    26: "twenty-six",
    27: "twenty-seven",
    28: "twenty-eight",
    29: "twenty-nine",
    30: "thirty",
    31: "thirty-one",
    32: "thirty-two",
    33: "thirty-three",
    34: "thirty-four",
    35: "thirty-five",
    36: "thirty-six",
    37: "thirty-seven",
    38: "thirty-eight",
    39: "thirty-nine",
    40: "forty",
    41: "forty-one",
    42: "forty-two",
    43: "forty-three",
    44: "forty-four",
    45: "forty-five",
    46: "forty-six",
    47: "forty-seven",
    48: "forty-eight",
    49: "forty-nine",
    50: "fifty",
    51: "fifty-one",
    52: "fifty-two",
    53: "fifty-three",
    54: "fifty-four",
    55: "fifty-five",
    56: "fifty-six",
    57: "fifty-seven",
    58: "fifty-eight",
    59: "fifty-nine",
    60: "sixty",
    61: "sixty-one",
    62: "sixty-two",
    63: "sixty-three",
    64: "sixty-four",
    65: "sixty-five",
    66: "sixty-six",
    67: "sixty-seven",
    68: "sixty-eight",
    69: "sixty-nine",
    70: "seventy",
    71: "seventy-one",
    72: "seventy-two",
    73: "seventy-three",
    74: "seventy-four",
    75: "seventy-five",
    76: "seventy-six",
    77: "seventy-seven",
    78: "seventy-eight",
    79: "seventy-nine",
    80: "eighty",
    81: "eighty-one",
    82: "eighty-two",
    83: "eighty-three",
    84: "eighty-four",
    85: "eighty-five",
    86: "eighty-six",
    87: "eighty-seven",
    88: "eighty-eight",
    89: "eighty-nine",
    90: "ninety",
    91: "ninety-one",
    92: "ninety-two",
    93: "ninety-three",
    94: "ninety-four",
    95: "ninety-five",
    96: "ninety-six",
    97: "ninety-seven",
    98: "ninety-eight",
    99: "ninety-nine",
    100: "one hundred",
    101: "one hundred and one",
    102: "one hundred and two",
    103: "one hundred and three",
    104: "one hundred and four",
    105: "one hundred and five",
    106: "one hundred and six",
    107: "one hundred and seven",
    108: "one hundred and eight",
    109: "one hundred and nine",
    110: "one hundred and ten",
    111: "one hundred and eleven",
    112: "one hundred and twelve",
    113: "one hundred and thirteen",
    114: "one hundred and fourteen",
    115: "one hundred and fifteen",
    116: "one hundred and sixteen",
    117: "one hundred and seventeen",
    118: "one hundred and eighteen",
    119: "one hundred and nineteen",
    120: "one hundred and twenty",
    121: "one hundred and twenty-one",
    122: "one hundred and twenty-two",
    123: "one hundred and twenty-three",
    124: "one hundred and twenty-four",
    125: "one hundred and twenty-five",
    126: "one hundred and twenty-six",
    127: "one hundred and twenty-seven",
    128: "one hundred and twenty-eight",
    129: "one hundred and twenty-nine",
    130: "one hundred and thirty",
    131: "one hundred and thirty-one",
    132: "one hundred and thirty-two",
    133: "one hundred and thirty-three",
    134: "one hundred and thirty-four",
    135: "one hundred and thirty-five",
    136: "one hundred and thirty-six",
    137: "one hundred and thirty-seven",
    138: "one hundred and thirty-eight",
    139: "one hundred and thirty-nine",
    140: "one hundred and forty",
    141: "one hundred and forty-one",
    142: "one hundred and forty-two",
    143: "one hundred and forty-three",
    144: "one hundred and forty-four",
    145: "one hundred and forty-five",
    146: "one hundred and forty-six",
    147: "one hundred and forty-seven",
    148: "one hundred and forty-eight",
    149: "one hundred and forty-nine",
    150: "one hundred and fifty",
    151: "one hundred and fifty-one",
    152: "one hundred and fifty-two",
    153: "one hundred and fifty-three",
    154: "one hundred and fifty-four",
    155: "one hundred and fifty-five",
    156: "one hundred and fifty-six",
    157: "one hundred and fifty-seven",
    158: "one hundred and fifty-eight",
    159: "one hundred and fifty-nine",
    160: "one hundred and sixty",
    161: "one hundred and sixty-one",
    162: "one hundred and sixty-two",
    163: "one hundred and sixty-three",
    164: "one hundred and sixty-four",
    165: "one hundred and sixty-five",
    166: "one hundred and sixty-six",
    167: "one hundred and sixty-seven",
    168: "one hundred and sixty-eight",
    169: "one hundred and sixty-nine",
    170: "one hundred and seventy",
    171: "one hundred and seventy-one",
    172: "one hundred and seventy-two",
    173: "one hundred and seventy-three",
    174: "one hundred and seventy-four",
    175: "one hundred and seventy-five",
    176: "one hundred and seven",
    177: "one hundred and seventy-seven",
    178: "one hundred and seventy-eight",
    179: "one hundred and seventy-nine",
    180: "one hundred and eighty",
    181: "one hundred and eighty-one",
    182: "one hundred and eighty-two",
    183: "one hundred and eighty-three",
    184: "one hundred and eighty-four",
    185: "one hundred and eighty-five",
    186: "one hundred and eighty-six",
    187: "one hundred and eighty-seven",
    188: "one hundred and eighty-eight",
    189: "one hundred and eighty-nine",
    190: "one hundred and ninety",
    191: "one hundred and ninety-one",
    192: "one hundred and ninety-two",
    193: "one hundred and ninety-three",
    194: "one hundred and ninety-four",
    195: "one hundred and ninety-five",
    196: "one hundred and ninety-six",
    197: "one hundred and ninety-seven",
    198: "one hundred and ninety-eight",
    199: "one hundred and ninety-nine",
    200: "two hundred"
}
word = [" days old",
        " month old",
        " year old",
        " days-old",
        " month-old",
        " year-old",
        "-days-old",
        "-month-old",
        "-year-old"
        ]


def getAge(sentences):
    en = translate(sentences)
    returnValue = ""
    for key_n, values_n in number.items():
        for i in range(len(word)):
            c = (str(values_n) + word[i])
            if c in en:
                returnValue = str(key_n)
    return returnValue