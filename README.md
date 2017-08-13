# _DJAPI Rest Test_

### _13 August 2017_

#### By Cory Olson

## Description
_DJAPI Rest Test_ is an app for testing and working with the Dow Jones REST APIs

## Goal:
Create a set of pages to test working with the DJ APIs

### It uses:
- html
- javascript
- css
- ruby
- sinatra

## Setup:
You will need to create a .env file in the root directory using the following parameters:

    SESSION_SECRET="THIS IS a SuPer 123 secret"
    DJ_USER="xxxxxxx"
    DJ_NS="xxxx"
    DJ_PW="xxxxxxxx"

SESSION_SECRET is used for protecting your session variables in sinatra
DJ_USER is your Dow Jones username
DJ_NS is your Dow Jones account Namespace
DJ_PW is your Dow Jones password

### License
#### The MIT License (MIT)
Copyright (c) 2016 Cory Olson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
