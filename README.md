# Prerequisites
1. Install common dependencies:
  - Install python
  - Install Robot Framework
2. Install Library dependencies:
  - Install seleniumlibrary '''pip install --upgrade robotframework-seleniumlibrary
3. Install web testing
  - Install chromedriver (For running web automation on chrome browser). 
    https://chromedriver.chromium.org/downloads
  - Install geckodriver (For running web automation on firefox browser). 
    https://github.com/mozilla/geckodriver/releases
  - After that, extract and move Chromedriver to python version folder

##Run automation
1. After clone this repo, open cmd and run web automation below:
  - robot testcase_checkout.robot
2. open cmd and run api automation below:
  - robot testcase_api_create_user.robot
  - robot testcase_api_get_user.robot
