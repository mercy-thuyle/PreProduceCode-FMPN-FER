[train][211119_184552]python main.py --mode train --data_root datasets/JAFFE --train_csv trainJA_ids_9.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_9 --niter 50 --niter_decay 50 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 16 --backend_pretrain --load_model_dir ckpts/JAFFE/res_baseline/fold_9/211119_045617 --load_epoch 200 --visdom_port 80 --visdom_ip http://eeca-2405-4800-52a7-1c4f-9c89-aeb3-c474-376a.ngrok.io
[ test][211203_144144]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/JAFFE/res_cls/fold_9/211119_184552 --load_epoch 100 --visdom_port 80 --visdom_ip http://9850-2405-4800-529f-13a5-4d-e24f-ded-284f.ngrok.io
