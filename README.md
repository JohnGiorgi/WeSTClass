[![Build Status](https://travis-ci.org/JohnGiorgi/WeSTClass.svg?branch=master)](https://travis-ci.org/JohnGiorgi/WeSTClass)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c4cb523a093a405db7e2b56b3c856d53)](https://www.codacy.com/app/JohnGiorgi/WeSTClass?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=JohnGiorgi/WeSTClass&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/c4cb523a093a405db7e2b56b3c856d53)](https://www.codacy.com/app/JohnGiorgi/WeSTClass?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=JohnGiorgi/WeSTClass&amp;utm_campaign=Badge_Coverage)

# WeSTClass

The source code used for Weakly-Supervised Neural Text Classification, published in CIKM 2018.

## Requirements

Before running, you need to first install the required packages by typing following commands:

```
$ pip3 install -r requirements.txt
```

Python 3.6 is strongly recommended; using older python versions might lead to package incompatibility issues.

## Quick Start

```
python -m westclass.main --dataset ${dataset} --sup_source ${sup_source} --model ${model}
```
where you need to specify the dataset in ```${dataset}```, the weak supervision type in ```${sup_source}``` (could be one of ```['labels', 'keywords', 'docs']```), and the type of neural model to use in ```${model}``` (could be one of ```['cnn', 'rnn']```).

An example run is provided in ```train.sh```, which can be executed by
```
./train.sh
```

More advanced settings on training and hyperparameters are commented in ```main.py```.

## Inputs

The weak supervision sources ```${sup_source}``` can come from any of the following:
  - Label surface names (```labels```); you need to provide class names for each class in ```./${dataset}/classes.txt```, where each line begins with the class id (starting from ```0```), followed by a colon, and then the class label surface name.
  - Class-related keywords (```keywords```); you need to provide class-related keywords for each class in ```./${dataset}/keywords.txt```, where each line begins with the class id (starting from ```0```), followed by a colon, and then the class-related keywords separated by commas.
  - Labeled documents (```docs```); you need to provide labeled document ids for each class in ```./${dataset}/doc_id.txt```, where each line begins with the class id (starting from ```0```), followed by a colon, and then document ids in the corpus (starting from ```0```) of the corresponding class separated by commas.

Examples are given under ```./datasets/agnews/``` and ```./datasets/yelp/```.

## Outputs

The final results (document labels) will be written in ```${dataset}/out.txt```, where each line is the class label id for the corresponding document.

Intermediate results (e.g. trained network weights, self-training logs) will be saved under ```results/${dataset}/${model}/```.

## Running on a New Dataset

To execute the code on a new dataset, you need to

 1. Create a directory named ```${dataset}```.
 2. Put raw corpus (with or without true labels) under ```${dataset}```.
 3. Specify parameter settings (e.g. ```update_interval```, ```pretrain_epochs```) for the new dataset, e.g.

 ```
 >> dataset=path/to/new/dataset
 >> sup_source=labels
 >> model=cnn
 >> class_type=topic

 >> python -m westclass.main \
--dataset ${dataset} \
--sup_source ${sup_source} \
--model ${model} \
--class_type ${class_type}
 ```

You can always refer to the example datasets when adapting the code for a new dataset.

## Citations

Please cite the following paper if you find the code helpful for your research.
```
@inproceedings{meng2018weakly,
  title={Weakly-Supervised Neural Text Classification},
  author={Meng, Yu and Shen, Jiaming and Zhang, Chao and Han, Jiawei},
  booktitle={Proceedings of the 27th ACM International Conference on Information and Knowledge Management},
  pages={983--992},
  year={2018},
  organization={ACM}
}
```
