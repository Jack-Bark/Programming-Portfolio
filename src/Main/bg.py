class Bg(object):
    def __init__(self, xpos, ypos):
        self.xpos = xpos
        self.ypos = ypos 
        
    def display(self):
        imageMode(CENTER)
        img = loadImage("background5.png")
        image(img, self.xpos, self.ypos)


            
            
    
    
            
