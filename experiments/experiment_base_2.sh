wget -N http://dl.yf.io/dilation/models/dilation8_pascal_voc.caffemodel -P models/

gpu=0
model_def=models/dilation8_pascal_voc.prototxt
model_weights=models/dilation8_pascal_voc.caffemodel
model_name=dilated_context
mean='103.939,116.779,123.68' # BGR order
pad_size=513
eps=2
attack_method=iterative_fgsm_ll

image_file=/content/adversarial-attacks/data/voc_val_jpg.txt
out_dir=/content/adversarial-attacks/output/voc_val

python main.py --gpu ${gpu} --model_def ${model_def} \
--model_weights ${model_weights} --image_file ${image_file} --pad_size ${pad_size} \
--eps ${eps} --is_seg --save_scores --out_dir ${out_dir} --attack_method ${attack_method} \
--model_name ${model_name} --mean ${mean} --is_dilated
