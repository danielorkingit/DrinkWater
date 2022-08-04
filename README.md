# DrinkWater
A simple Python program to welcome somebody with a custom e-mail when the person connects with your WiFi.

## Installation
### Install dependencies
```bash
pip3 install sendgrid
```
### Install and run whoisaround
```bash
git clone https://github.com/danielorkingit/whoisaround/
cd whoisaround
```
Create a free [Sendgrid account](https://signup.sendgrid.com/) and create a new API Key
Replace the placeholders with your data
(API Key, email, message, device ip adress)
```bash
python main.py
```
### Run whoisaround as a backround service
```bash
cd whoisaround
pythonw main.py
```
To kill the process, go to the task-manager (Windows) or the activity monitor (Mac) and search for the Python task.


*A free Sendgrid account is requierd.*

*You can add a custom HTML template within the code and extend the code for adicional usage.*
