[train][211026_072450]python main.py --mode train --data_root datasets/CKPlus --train_csv train_ids_8.csv --print_losses_freq 4 --use_data_augment --visdom_env res_cls_ckp_0 --niter 50 --niter_decay 50 --gpu_ids 0 --model res_cls --solver res_cls --lambda_resface 0.1 --batch_size 16 --backend_pretrain --load_model_dir ckpts/CKPlus/res_baseline/fold_8/211024_033139 --load_epoch 100 --visdom_port 80 --visdom_ip http://63fa-1-52-35-53.ngrok.io
[ test][211026_110440]python main.py --mode test --data_root datasets/CKPlus --test_csv test_ids_1.csv --gpu_ids 0 --model res_cls --solver res_cls --batch_size 2 --load_model_dir ckpts/CKPlus/res_cls/fold_8/211026_072450 --load_epoch 10 --visdom_port 80 --visdom_ip http://777a-1-52-35-53.ngrok.io
[ test][211026_110458]python main.py --mode test --data_root datasets/CKPlus --test_csv test_ids_1.csv --gpu_ids 0 --model res_cls --solver res_cls --batch_size 2 --load_model_dir ckpts/CKPlus/res_cls/fold_8/211026_072450 --load_epoch 10 --visdom_port 80 --visdom_ip http://63fa-1-52-35-53.ngrok.io
[ test][211026_120944]python main.py --mode test --data_root datasets/CKPlus --test_csv test_ids_1.csv --gpu_ids 0 --model res_cls --solver res_cls --batch_size 2 --load_model_dir ckpts/CKPlus/res_cls/fold_8/211026_072450 --load_epoch 100
[ test][211026_121239]python main.py --mode test --data_root datasets/CKPlus --test_csv test_ids_1.csv --gpu_ids 0 --model res_cls --solver res_cls --batch_size 2 --load_model_dir ckpts/CKPlus/res_cls/fold_8/211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://6cf6-1-52-35-53.ngrok.io
[ test][211030_161149]python main.py --mode test --data_root datasets/CKPlus --test_csv test_ids_1.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 2 --load_model_dir ckpts/CKPlus/res_cls/fold_8/211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://0052-2405-4800-529f-cec-1011-d6ea-6fa0-175e.ngrok.io
[ test][211105_105727]python main.py --mode test --data_root images\userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts\CKPlus\res_cls\fold_8\211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://14f8-1-52-35-53.ngrok.io
[ test][211105_111426]python main.py --mode test --data_root images\userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts\CKPlus\res_cls\fold_8\211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://14f8-1-52-35-53.ngrok.io
[ test][211105_134400]python main.py --mode test --data_root images\userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts\CKPlus\res_cls\fold_8\211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://14f8-1-52-35-53.ngrok.io
[ test][211105_145053]python main.py --mode test --data_root images\userData --test_csv run_ids_0.csv --gpu_ids 0 --n_threads 1 --model res_cls --solver res_cls --batch_size 1 --load_model_dir ckpts\CKPlus\res_cls\fold_8\211026_072450 --load_epoch 100 --visdom_port 80 --visdom_ip http://6dee-1-52-35-53.ngrok.io
