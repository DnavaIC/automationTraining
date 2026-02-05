# automationTraining

### Requisitos

## Python 3.10+ (recomended 3.12/3.13)
python3 --version
## Node.js 18+ (to Playwright)
node --version
## npm (Incliuded withNode)
npm --version


### 1 Create and activate virtualenv
## From repo path:

python3 -m venv .venv
source .venv/bin/activate
python -V


### 2 Install depemndences (Robot + Browser)
pip install --upgrade pip
pip install robotframework robotframework-browser

### 3 Instal Playwright (Browser library)
## Only once time per venv:

rfbrowser init

### 4 Execute tests Important: Your folder should be test/ (not tests/)

## Execute whole suite:

robot -d output test

## Executean especific file:

robot -d output test/saucedemo/login.robot

## Execute a test by name:

robot -d output --test "Log Out - valida login screen" test/saucedemo/login.robot