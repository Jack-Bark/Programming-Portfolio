from ninja import Ninja
from bg import Bg
from obstacle import Obstacle
myNinja1 = Ninja(600, 290)
myBg1 = Bg(500, 0)
obstacles = []
obsdist = 0
screen = 1

def setup():
    size(1000,800)
    global img
    global screen
    noCursor()
    img = loadImage("startscreen2.png")
    for i in range (3):
        obstacle = Obstacle(random(1000,1200), random(150, 600), random(3,10))
        obstacles.append(obstacle)

def draw(): 
    global myNinja1
    global obstacles 
    print(screen)
    if screen == 1:
        startScreen()
    elif screen >= 2:
        playScreen()
    obsdist = []
    for obstacle in obstacles:
        dist_value = dist(myNinja1.xpos, myNinja1.ypos, obstacle.xpos, obstacle.ypos)
        obsdist.append(dist_value)
    if min(obsdist) <= 100:
        gameOver()

def mouseClicked():
    global screen
    if screen == 1:
        screen = 2
    elif screen == 2:
        screen = 3
    elif screen == 3:
        resetGame()
        screen = 2
        
def startScreen():
    global img
    image(img, 0, 0)

def playScreen():
    global myBg1
    global Ninja
    global obstacle
    background(0)
    img = loadImage("background5.png")
    image(img, 500, 400)
    imageMode(CENTER)
    myNinja1.display()
    for obstacle in obstacles:
        obstacle.display()
        obstacle.move()
        
def gameOver():
    background(0)
    imageMode(CENTER)
    img = loadImage("gameover2.png")
    image(img, 500, 400)
    noLoop()
    
def keyPressed():
    global ninja
    if 10 <= myNinja1.ypos <= 610:
        if keyCode == UP or key == 'w':
            myNinja1.ypos -= 15
    if 0 <= myNinja1.ypos <= 600:
        if keyCode == DOWN or key == 's':
            myNinja1.ypos += 15
    if -10 <= myNinja1.xpos <= 810:
        if keyCode == RIGHT or key == 'd':
            myNinja1.xpos += 15
    if 10 <= myNinja1.xpos <= 830:
        if keyCode == LEFT or key == 'a':
            myNinja1.xpos -= 15
