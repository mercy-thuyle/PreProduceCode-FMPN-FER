[train][211203_111700]python main.py --mode train --data_root datasets/JAFFE --train_csv trainJA_ids_0.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_0 --niter 50 --niter_decay 50 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 25 --backend_pretrain --load_model_dir ckpts/JAFFE/res_baseline/fold_0/211203_071143 --load_epoch 200 --visdom_port 80 --visdom_ip http://9850-2405-4800-529f-13a5-4d-e24f-ded-284f.ngrok.io
[ test][211204_214158]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/JAFFE/res_cls/fold_0/211203_111700 --load_epoch 100 --visdom_port 80 --visdom_ip http://03b7-2405-4800-529f-13a5-45e8-fa89-7240-d476.ngrok.io
