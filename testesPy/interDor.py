numUsu = int(input())
# Superior: (0,0,2,0)
# Esquerda: (0,1,0,4)
# Centro: (1,1,1,4)
# Direita: (2,1,2,4)
# Inferior: (0,5,2,5)

superior = esquerda = centro = direita = inferior = 0

for inutil in range(0 , numUsu):
    for i in range(0 , 6):
        entrada = input().replace(" ","")
        for j in range(0 , 3):
            if int(entrada[j]):
                if(i == 0):
                    superior+=1
                elif(i == 5):
                    inferior+=1
                elif(j == 0):
                    esquerda+=1
                elif(j == 1):
                    centro+=1
                elif(j == 2):
                    direita+=1

principal = max([superior, esquerda ,centro ,direita , inferior])

if(superior == principal):
    print("superior")
elif(esquerda == principal):
    print("esquerda")
elif(centro == principal):
    print("centro")
elif(direita == principal):
    print("direita")
elif(inferior == principal):
    print("inferior")