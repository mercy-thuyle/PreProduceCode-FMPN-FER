[train][211124_033549]python main.py --mode train --data_root datasets/CKPlus --train_csv trainCK_ids_1.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_1 --niter 25 --niter_decay 25 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 25 --backend_pretrain --load_model_dir ckpts/CKPlus/res_baseline/fold_1/211121_125255 --load_epoch 60 --visdom_port 80 --visdom_ip http://f11a-2405-4800-52a7-1c4f-b4aa-9900-183e-40e0.ngrok.io/
[ test][211203_124500]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_1/211124_033549 --load_epoch 50 --visdom_port 80 --visdom_ip http://9850-2405-4800-529f-13a5-4d-e24f-ded-284f.ngrok.io
