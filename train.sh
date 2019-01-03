#!/bin/bash
dataset=westclass/agnews
model=cnn
sup_source=labels

export CUDA_VISIBLE_DEVICES=0

if [ $model == "cnn" ]
then
if [ $dataset == "westclass/agnews" ]
then
class_type=topic
pretrain_epochs=20
update_interval=50
self_lr=1e-3
max_sequence_length=100
elif [ $dataset == "westclass/yelp" ]
then
class_type=sentiment
pretrain_epochs=30
update_interval=50
self_lr=1e-4
max_sequence_length=500
fi

python -m westclass.main \
--dataset ${dataset} \
--model ${model} \
--sup_source ${sup_source} \
--with_evaluation True \
--pretrain_epochs ${pretrain_epochs} \
--update_interval ${update_interval} \
--self_lr ${self_lr} \
--max_sequence_length ${max_sequence_length}

elif [ $model == "rnn" ]
then
if [ $dataset == "westclass/agnews" ]
then
class_type=topic
pretrain_epochs=100
update_interval=50
self_lr=1e-3
sent_len=45
doc_len=10
elif [ $dataset == "westclass/yelp" ]
then
class_type=sentiment
pretrain_epochs=200
update_interval=100
self_lr=1e-4
sent_len=30
doc_len=40
fi

python -m westclass.main \
--dataset ${dataset} \
--model ${model} \
--sup_source ${sup_source} \
--with_evaluation True \
--class_type ${class_type} \
--pretrain_epochs ${pretrain_epochs} \
--update_interval ${update_interval} \
--self_lr ${self_lr} \
--sent_len ${sent_len} \
--doc_len ${doc_len}

fi
