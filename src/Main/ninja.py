class Ninja(object):
    def __init__(self, xpos, ypos):
        self.xpos = xpos
        self.ypos = ypos
        self.h = 20

    def display(self):
        img = loadImage("running.png")
        image(img, self.xpos, self.ypos)
        
        
