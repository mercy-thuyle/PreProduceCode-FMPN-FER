[train][211123_040916]python main.py --mode train --data_root datasets/CKPlus --train_csv trainCK_ids_0.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_0 --niter 25 --niter_decay 25 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 25 --backend_pretrain --load_model_dir ckpts/CKPlus/res_baseline/fold_0/211121_125238 --load_epoch 60 --visdom_port 80 --visdom_ip http://7b20-2405-4800-52a7-1c4f-1dd7-3ad9-dadf-5cb1.ngrok.io/
[ test][211203_123210]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50 --visdom_port 80 --visdom_ip http://9850-2405-4800-529f-13a5-4d-e24f-ded-284f.ngrok.io
[ test][211217_150621]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_121436]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_121615]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_122752]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_130025]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_130058]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_130611]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_131746]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_131854]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_132029]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_133900]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --gpu_ids -1 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_134329]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50
[ test][211219_134432]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50 --gpu_ids -1
[ test][211219_134611]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50 --gpu_ids -1
[ test][211219_134851]python main.py --mode test --data_root images/userData --test_csv run_ids_0.csv --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts/CKPlus/res_cls/fold_0/211123_040916 --load_epoch 50 --gpu_ids -1
