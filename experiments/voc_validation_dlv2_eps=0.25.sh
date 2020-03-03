# wget -N http://www.robots.ox.ac.uk/~aarnab/projects/cvpr_2018/models/fcn8_voc.caffemodel -P models/

gpu=0
model_def=models/deeplab_v2_vgg16.prototxt
model_weights=models/deeplab_v2_vgg16.caffemodel
model_name=deeplab_vgg16
mean='103.939,116.779,123.68' # BGR order
pad_size=513
eps=0.25
attack_method=iterative_fgsm_ll

image_file=data/voc_val_jpg.txt
out_dir=output/voc_val

python main.py --gpu ${gpu} --model_def ${model_def} \
--model_weights ${model_weights} --image_file ${image_file} --pad_size ${pad_size} \
--eps ${eps} --is_seg --save_scores --out_dir ${out_dir} --attack_method ${attack_method} \
--model_name ${model_name} --mean ${mean}
