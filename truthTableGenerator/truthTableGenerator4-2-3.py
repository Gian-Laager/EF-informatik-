values = [True, False]

print("a\t|\tb\t|\tc\t|\td\t||\tx\t|\ty\t|\tr")
print("#####################################################################################################")
for a in values:
    for b in values:
        for c in values:
            for d in values:
                x = a and b 
                y = x or c
                r = d ^ y
                print(a, b, c, d, sep="\t|\t", end="")
                print("\t||\t", end="")
                print(x,y,r, sep="\t|\t")
                print("-----------------------------------------------------------------------------------------------------")
