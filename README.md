# Hello and Welcome to the Appetizer Menu Combination Generator!

#### This is a command-line application that accepts a text file appetizer menu with a desired total value and finds combinations of appetizers from the menu whose prices sum to the total.

#### It was developed entirely in Ruby 2.2.1, and uses the RSpec gem for testing.

### To Run the Program:

##### From the source directory in your command line, enter the runner file followed by your menu file path name to run the program. Example:

```source:> ruby runner.rb menu.txt```

##### Please note that a standard menu file (menu.txt) has been provided in this directory, along with two other text files that are used for testing. Once your file has loaded, the program will display your menu and prompt you to review it. At this point you can press 'ENTER' to continue or 'NO' to exit the program. If you choose to continue, the Appetizer Combination Generator will find all of the combinations of appetizers from the menu you submitted that add up to your desired total, and display those combination options to you before closing out.

### Assumed Format of Text Files:

##### This application works best when menu text files are formatted with the total price entered on the first line, followed by each appetizer item on a subsequent line. Appetizer items should be listed in the format "description","price". Appetizers do not need to be in alphabetical order or ordered by price. Example:

```
$15.05
mixed fruit,$2.15
french fries,$2.75
side salad,$3.35
hot wings,$3.55
mozzarella sticks,$4.20
sampler plate,$5.80
```

### To Run the Tests:

##### Please ensure that you are working with the appropriate version of RSpec by entering the following into your command line from inside the source directory:

```bundle install```

##### Then simply enter the following code, again from the source directory, to run all of the rspec tests at once:

```bundle exec rspec -f doc```

### Basic Assumptions of the Application:

##### This program assumes that menus are submitted in a text file formatted as described above. It assumes that all prices are positive numbers. Finally, it is assumed that this application will be used to calculate plausible combinations from a realistically-sized menu of appetizers. It therefore will be less efficient in handling menus of more than 50 appetizer items.

### Questions?

##### Please submit comments or issues through this repository. Thanks!
