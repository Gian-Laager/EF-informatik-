values = [True, False]

print("a\t|\tb\t||\tc")
print("#####################################")
for a in values:
    for b in values:
        g = not (a and b)
        d = not (a and g) 
        e = not (b and g)
        c = not (d and e)
        print(a, b, sep="\t|\t", end="")
        print("\t||\t", end="")
        print(c)
        print("-------------------------------------")