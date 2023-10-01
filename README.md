# Toy Robot

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Setup

### 1. Make sure you have Ruby 2.7.6 installed

### 2. Install dependencies:

```bash
gem install bundler
bundle install
```

### 3. Run the app:

```bash
ruby app/main.rb
```

### 4. Run the tests:

```bash
bundle exec rspec
```

## Get started

It's a simple Ruby console application that supports commands of: `PLACE`, `MOVE`, `LEFT`, `RIGHT` and `REPORT`.

Example inputs and outputs:

```bash
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```
