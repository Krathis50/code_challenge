# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   how to make a a new user:
#
#   #DEPRECATE STARTS HERE
#   user = User.create(:email => 'email here', :password => '123asd')   
#   user.role = 1       ;assigns role of admin.
#   user.save           ;saves the user's info and is ready to be logged in
#   
#   how to check if a user is admin:
#   user.admin?
#   the console should return either true of false.
#   if you need to make an admin, do:
#       user.role = 1
#   which will set to admin, and 0 to set to default level user.
#
#   #DEPRECATE ENDS HERE
#   
#
#   HOW TO MAKE YOURSELF ADMIN.
#   Go to bash console, terminal, shell console or where you put linux commands in.
#   type: rails c
#   This should open up rails console and your commandline should look like:
#   irb(main):numbers:numbers>
#   type in User = User.find([number]) where number is an id.
#   if you find your id, which the only way to distinguish whos who is by email,
#   do the following
#   User.update_attribute(:role, 1)
#   it should update to postgresql after that.
#   Congratulations, you're an admin!
#

user = User.new
user.email = 'SUPERUSER@wtamu.edu'
user.password = "getPassword152"
user.password_confirmation = 'getPassword152'
user.scoreboard_name = nil
user.scoreboard_school = nil
user.role = 1
user.save!

#======================
# BASIC CHALLENGE
#======================

challenge = Challenge.new
challenge.name = "1.0 Basic Challenge"
challenge.description = "First challenge of today."
challenge.pdescription = "Assign a variable x where it'll take any input, and have it print 'x = 5' .
<br><br>
Assigning a variable:<br>
    any name you assign before an equal sign can become a variable in Python.<br>
        x = 2<br>
    is a variable along with<br>
        whatami = 2<br>
    can be used. They are both assigned with an number 2.
    <br>
    The limit to these is you want letter only names and avoid using numbers to prevent confusion.
    <br><br>
Getting input from the top bar into your program:<br>
    In python you use:<br>
        x = input(\"insert something here\")<br>
    the input will be assigned to x and your output will have 'insert something here' as a response from
    your program to the server, which it replied with the inputs you had in your input bar.
    <br><br>
Printing your code:<br>
    For pythin you use <br>
    print(\"Hello World!\") <br>
    which will print Hello World without the single quotes. This is one of the many
    and common ways to print messages onto the screen in Python."
    
challenge.save!

id = challenge.id

problem = ProblemSet.new
problem.arguments = "Problem 1"
problem.answer = "x=5"
problem.challenge_id = id
problem.save!



#======================
# EVEN OR ODD
#======================
#CODE USED
#weight = int(input("Put weight here."))
#weight = weight * 16
#print("his weight is: ",weight)


challenge = Challenge.new
challenge.name = "1.1 Gravity and Weight"
challenge.description = "Lets say we go to Alpha Centauri."
challenge.pdescription = "Lets say a man goes to an uninhabited and life-supportive planet.
The gravity of the planet is 16 m/s squared, and due to a rough landing into the planet after an asteroid bashed the hull of his spaceship and forced him onto the planet. 
<br><br>
Create a program that will calculate someone's weight with unnamed planet's new gravity. And then 
enter the man's weight into the program and get the output. 
<br><br>
Have this line of code be the last line in your program:
<br><br>
print(\"his weight is: \",weight)
<br><br>
and then submit to get your points"
challenge.save!

id = challenge.id

problem = ProblemSet.new
problem.arguments = "Problem 1"
problem.answer = "Put weight here.his weight is:  2464"
problem.challenge_id = id
problem.save!

#======================
# CIRCLE
#======================
#from math import sin,cos,pi
#
# Ask the user for the values of r and theta
#r = float(input("Enter r: "))
#d = float(input("Enter theta in degrees: "))
#
# Convert the angle to radians
#theta = d*pi/180
#
# Calculate the equivalent Cartesian coordinates
#x = r*cos(theta)
#y = r*sin(theta)

# Print out the results
#print("x = ",x,", y = ",y)

challenge = Challenge.new
challenge.name = "1.2 Cartesian to Polar"
challenge.description = "Hints inside."
challenge.pdescription = "Convert cartesian to polar where <br>
x = 12 <br>
y = 42 <br>
Make sure your first line of code is 
from math import sin,cos,pi 
and convert radius and theta into floats. "
challenge.save!

id = challenge.id

problem = ProblemSet.new
problem.arguments = "Problem 1"
problem.answer = "x =  8.917737905728732 , y =  8.029567276306299"
problem.challenge_id = id
problem.save!

#======================
# FIBONACCI
#======================
#f1,f2 = 1,1
#while f2<1000:
#    print(f2)
#    f1,f2 = f2,f1+f2

challenge = Challenge.new
challenge.name = "1.4 Fibonacci"
challenge.description = "Golden Sprials"
challenge.pdescription = "The Fibonacci Sequence is the series of numbers:<br><br>

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...<br><br>

The next number is found by adding up the two numbers before it.<br><br>

The 2 is found by adding the two numbers before it (1+1)<br>
The 3 is found by adding the two numbers before it (1+2),<br>
And the 5 is (2+3),<br>
and so forth. <br><br>

Example: the next number in the sequence above is 21+34 = 55<br><br>

Here is a longer list:<br><br>

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765<br><br>

0 + 1 = 1<br>
1 + 1 = 2<br>
2 + 1 = 3<br>
3 + 2 = 5<br>
<br>
Now make a program that follows this logic."
challenge.save!

id = challenge.id

problem = ProblemSet.new
problem.arguments = "Problem 1"
problem.answer = "987"
problem.challenge_id = id
problem.save!