[train][211123_034305]python main.py --mode train --data_root datasets/CKPlus --train_csv trainCK_ids_3.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_3 --niter 25 --niter_decay 25 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 25 --backend_pretrain --load_model_dir ckpts/CKPlus/res_baseline/fold_3/211121_125417 --load_epoch 60 --visdom_port 80 --visdom_ip http://7b20-2405-4800-52a7-1c4f-1dd7-3ad9-dadf-5cb1.ngrok.io/