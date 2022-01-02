#JOSH BLOCK // Module 6 // Python Turtle Graphic
import turtle

Sebastian = turtle.Turtle()

NUM_CIRCLES = 18
RADIUS = 100
ANGLE = 30
ANIMATION_SPEED = 35

Sebastian.speed(ANIMATION_SPEED)

for x in range(NUM_CIRCLES):
    Sebastian.circle(RADIUS)
    Sebastian.left(ANGLE)

turtle.done()
