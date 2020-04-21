# anaconda_lab
anaconda + jupyterlab on docker

- python 3.7
- preinstalled modules
    - anaconda's modules
    - jupyterlab
    - pandas-datareader
    - plotly
    - [pylbfgs](https://bitbucket.org/rtaylor/pylbfgs/src/master/) (+ liblbfgs) 


# Run jupyterlab
```bash
docker-compose up
```
Open http://localhost:9123 with your browser.
Type `password`. 

# Add modules to image
Add python package names you want to requirements.txt.
And do
```bash
# rebuild image
docker-compose build --no-cache
# remove container
docker-compose rm
# recreate container with new image
docker-compose up
```
