# Description

Contarization home work is first hw to see basic docker commands, building dockerfile, running a container, etc., to refresh basic commands for working in linux from the term (delete files, folders, move around the file system, try to install StarSpace on your linux).

## Installation

```bash
git clone https://github.com/ivan-perkhun/mlops-course.git \ 
    cd mlops-course/containerization_hw \
    mkdir /volume
```


## Train
To use your own files, go to the .env file and change the value of the variables without file extension also add file to `containerization_hw/volume` 
[example file](https://drive.google.com/file/d/11z-oSzbmGJp2S4HAnh09nBdkaVvuxYy8/view)

For example: 
```bash
FNAME = <data>
```

## Usage

```bash
docker build -t containerization_hw .
docker-compose up
```
