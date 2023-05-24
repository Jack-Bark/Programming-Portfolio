from ninja import Ninja
class Obstacle(object):
    def __init__ (self, xpos, ypos, xspeed):
        self.xpos = xpos
        self.ypos = ypos
        self.xspeed = xspeed
        
    def display(self):
        imageMode(CENTER)
        img = loadImage("rock.png")
        image(img, self.xpos, self.ypos)
    
    def move(self):
        self.xpos = self.xpos + self.xspeed;
        if self.xpos > width:
            self.xpos = -50
    
    def resetPos(self):
        self.xpos = random(1000, 1200)
        self.ypos = random(150, 600)
