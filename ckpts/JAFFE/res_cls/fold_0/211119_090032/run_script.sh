[train][211119_090032]python main.py --mode train --data_root datasets/JAFFE --train_csv trainJA_ids_0.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_0 --niter 50 --niter_decay 50 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 16 --backend_pretrain --load_model_dir ckpts/JAFFE/res_baseline/fold_0/211118_115934 --load_epoch 200 --visdom_port 80 --visdom_ip http://684b-2405-4800-52a7-1c4f-9969-b0c-9d03-6934.ngrok.io/
