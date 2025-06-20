#Program pour tester la création d'un fichier UF2 pour Raspberry Pico
#test1.py est aussi enregistré comme main.py pour démarrage automatique

# 1. Le programme MAIN.PY fait clignoter la petite LED interne chaque seconde
# test1
import time
from machine import Pin
def toggle_led():
    Pin("LED", Pin.OUT).toggle()
for _ in range(10) :
    toggle_led()
    time.sleep(1)

# 2. Le programme MAIN.PY appel le module test2 qui contient la fonction toggle_led ci dessus
# Le rythme et le nombre de clignotement est différent du premier test
import test2
for _ in range(20) :
    test2.toggle_led2()
    time.sleep(0.5)
    
# 3. Idem test2 mais le module test3 est exclusivement dans la mémoire accessible par l'IDE Thonny
# Il faut donc le déposer après le premier démarrage des tests 1 et 2
import test3
for _ in range(30) :
    test3.toggle_led3()
    time.sleep(0.1)
