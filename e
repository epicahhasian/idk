import pgzrun
from random import randint 
WIDTH = 600
HEIGHT = 500
score = 0
game_over = False 
chappal =Actor("chappal")
chappal.pos =100,100 
failure=Actor("failure")
def draw (): 
    screen.blit("background",(0,0))
    failure.draw()
    chappal.draw()
    screen.draw.text("Score:"+ str (score),color = "black",topleft = (10,10))
    if game_over:
        screen.fill ("pink")
        screen.draw.text("Time's up! Your Final Score: "+str(score),midtop=(WIDTH/2,10),
        fontsize = 40, color = "red")
def place_failure():
    failure.x = randint(70,(WIDTH-70))
    failure.y = randint(70,(HEIGHT-70))
def time_up():
    global game_over
    game_over = True
def update ():
    global score
    if keyboard.left:
     chappal.x =chappal.x - 2
    if keyboard.right:
     chappal.x = chappal.x +2
    if keyboard.up:
     chappal.y = chappal.y -2
    if keyboard.down:
     chappal.y =chappal.y +2 

    failure_collected = chappal.colliderect(failure)
    if failure_collected:
       score = score + 5 
       place_failure()
clock.schedule (time_up,60.0)
pgzrun.go()
