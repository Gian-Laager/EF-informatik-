values = [True, False]

print("a\t|\tb\t|\tc\t||\tx\t|\ty\t|\tr")
print("#####################################################################################")
for a in values:
    for b in values:
        for c in values:
            x = a ^ b
            z = a and x
            y = b and c
            r = z or y

            print(a, b, c, sep="\t|\t", end="")
            print("\t||\t", end="")
            print(x,y,r, sep="\t|\t")
            print("-------------------------------------------------------------------------------------")