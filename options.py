import argparse
import torch
import os
from datetime import datetime
import time
import torch 
import random
import numpy as np 
import sys



class Options(object):
    """docstring for Options"""
    def __init__(self):
        super(Options, self).__init__()
        
    def initialize(self):
        parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
        parser.add_argument('--mode', type=str, default='train', help='Mode of code. [train|test]')
        parser.add_argument('--model', type=str, default='res_cls', help='[res_cls], see model.__init__ from more details.')
        parser.add_argument('--solver', type=str, default='res_cls', help='[res_cls], see solvers.__init__ for more details.')
        parser.add_argument('--optim_policy', type=str, default='adam', help='optim policy: adam|sgd|rmsprop')
        parser.add_argument('--cls_backend', type=str, default='inception', help='cls base network: default|inception|resnet50|resnet152|densenet121')
        parser.add_argument('--backend_pretrain', action='store_true', help='if specified, use imagenet pretrained for backend.')
        
        parser.add_argument('--lucky_seed', type=int, default=0, help='seed for random initialize, 0 to use current time.')
        parser.add_argument('--visdom_env', type=str, default="main", help='visdom env.')
        parser.add_argument('--visdom_port', type=int, default=8097, help='visdom port.')
        parser.add_argument('--visdom_display_id', type=int, default=1, help='set value larger than 0 to display with visdom.')
        parser.add_argument('--visdom_ip', type=str, default="http://localhost", help='visdom IP from ngrok.')
        
        parser.add_argument('--data_root', required=True, help='paths to data set.')
        parser.add_argument('--train_csv', type=str, default="train_ids.csv", help='train images paths')
        parser.add_argument('--imgs_dir', type=str, default="imgs", help='path to image')
        parser.add_argument('--imgs_res_dir', type=str, default="imgs_res", help='path to average residual image')
        parser.add_argument('--cls_pkl', type=str, default="emotion_labels.pkl", help='emotion labels pickle dictionary.')
        parser.add_argument('--test_csv', type=str, default="test_ids.csv", help='test images paths')
        parser.add_argument('--use_data_augment', action='store_true', help='if specified, input images in order.')
        parser.add_argument('--serial_batches', action='store_true', help='if specified, input images in order.')
        parser.add_argument('--n_threads', type=int, default=12, help='number of workers to load data.')
        parser.add_argument('--max_dataset_size', type=int, default=float("inf"), help='maximum number of samples.')

        parser.add_argument('--load_size', type=int, default=320, help='scale image to this size.')
        parser.add_argument('--final_size', type=int, default=299, help='crop image to this size.')
        
        parser.add_argument('--gpu_ids', type=str, default='0', help='gpu ids, eg. 0,1,2; -1 for cpu.')
        parser.add_argument('--ckpt_dir', type=str, default='./ckpts', help='directory to save check points.')
        parser.add_argument('--load_model_dir', type=str, default='./checkpoints', help='directory to load pretrained model.')
        parser.add_argument('--load_epoch', type=int, default=0, help='load epoch; 0: do not load')
        
        parser.add_argument('--img_nc', type=int, default=3, help='image number of channel')
        parser.add_argument('--cls_nc', type=int, default=7, help='FE class number of channel')
        
        parser.add_argument('--init_type', type=str, default='xavier', help='network initialization [normal|xavier|kaiming|orthogonal]')
        parser.add_argument('--init_gain', type=float, default=0.02, help='scaling factor for normal, xavier and orthogonal.')
        parser.add_argument('--norm', type=str, default='instance', help='instance normalization or batch normalization [batch|instance|none]')
        parser.add_argument('--beta1', type=float, default=0.5, help='momentum term of adam')
        parser.add_argument('--lr', type=float, default=0.0001, help='initial learning rate for adam')
        parser.add_argument('--lr_policy', type=str, default='lambda', help='learning rate policy: lambda|step|plateau|cosine')
        parser.add_argument('--lr_decay_iters', type=int, default=50, help='multiply by a gamma every lr_decay_iters iterations')

        parser.add_argument('--epoch_count', type=int, default=1, help='the starting epoch count, we save the model by <epoch_count>, <epoch_count>+<save_latest_freq>, ...')
        parser.add_argument('--niter', type=int, default=200, help='# of iter at starting learning rate')
        parser.add_argument('--niter_decay', type=int, default=100, help='# of iter to linearly decay learning rate to zero')
        
        parser.add_argument('--use_cls_dropout', action='store_true', help='if specified, use dropout for classifier net.')
        parser.add_argument('--cls_norm', type=str, default='batch', help='instance normalization or batch normalization [batch|instance|none]')
        parser.add_argument('--log_file', type=str, default="losses.log", help='log loss')
        
        # residual face net option
        parser.add_argument('--res_use_dropout', action='store_true', help='if specified, use dropout for residual face generating net.')
        parser.add_argument('--res_norm', type=str, default='batch', help='instance normalization or batch normalization [batch|instance|none]')
        parser.add_argument('--res_n_blocks', type=int, default=4, help='residual block number for resface net.')
        parser.add_argument('--sample_img_freq', type=int, default=5, help='sample train image for every sample_img_freq step.')
        parser.add_argument('--res_lr', type=float, default=1e-5, help='initial learning rate for adam for resface gen net.')
        
        # frequency options
        parser.add_argument('--batch_size', type=int, default=32, help='input batch size.')
        parser.add_argument('--print_losses_freq', type=int, default=4, help='print log every print_losses_freq step.')
        parser.add_argument('--save_epoch_freq', type=int, default=200, help='save checkpoint every save_epoch_freq epoch.')

        parser.add_argument('--lambda_cls', type=float, default=1.0, help='discriminator weight in loss')
        parser.add_argument('--lambda_resface', type=float, default=1e-1, help='resface weight in loss')
        
        return parser

    def parse(self):
        parser = self.initialize()
        parser.set_defaults(name = datetime.now().strftime("%y%m%d_%H%M%S"))
        opt = parser.parse_args()

        # update checkpoint dir
        if opt.mode == 'train':
            dataset_name = os.path.basename(opt.data_root.strip('/'))  
                # basename() d??ng ????? l???y ?????i t?????ng l?? t??n file cu???i trong ???????ng d???n 
                # dirname() d??ng ????? l???y ?????i t?????ng l?? ???????ng d???n c??ng th?? m???c m??? c???a file cu???i trong ???????ng d???n
                # vd:   path = './PreProduceCode-FMPN-FER/datasets/CKPlus/train_ids_0.csv'
                #       print(os.path.basename(folderpath)) -> train_ids_0.csv
                #       print(os.path.dirname(folderpath)) -> ./PreProduceCode-FMPN-FER/datasets/CKPlus
                # strip('./') xo?? d???u '/' v?? '.' ??? ?????u v?? ??u??i c???a data_root 
                # vd: ./PreProduceCode-FMPN-FER/datasets/CKPlus/ -> PreProduceCode-FMPN-FER/datasets/CKPlus
            # /datasets/CKPlus/ -> datasets/CKPlus

            tmp_list = os.path.splitext(opt.train_csv)[0].split('_') 
                # splitext() ????? chia filename th??nh 2 ph???n tr?????c v?? sau d???u '.' 
                # L??u ??: ch??? t??ch ?????i s??? ???????c ch??? ?????nh th??nh hai ph???n t???i v??? tr?? d???u ch???m cu???i c??ng b??n ph???i
                    # vd:   path = './PreProduceCode-FMPN-FER/datasets/CKPlus/train_ids_0.csv'
                    #
                    #1.     base_name = os.path.basename(path)
                    #       print(basename) -> train_ids_0.csv
                    #
                    #2.     name_tuple = os.path.splitext(base_name)
                    #       print(name_tuple) -> ('train_ids_0', '.csv')
                    #
                    #3.     filename = name_tuple[0]
                    #       print(filename) -> train_ids_0
                    #
                    #4.     file_extension = name_tuple[1]
                    #       print(file_extension) -> .csv
                    #
                    # ho???c d??ng c??ch nh?? sau ????? truy c???p nhanh h??n
                    #       file_name, file_extension = os.path.splitext(base_name)
                    #       print(file_name) -> train_ids_0
                    #       print(file_extension) -> .csv
                # L??u ??, do trong k???t qu??? c???a h??m splitext() s??? bao g???m c??? d???u ch???m '.' ??? trong ??u??i file -> n??n s??? d???ng k???t h???p v???i strip('.')
                    # vd:   print(name_tuple[1].strip(".")) -> csv 
                    # ho???c  print(file_extension.strip(".")) -> csv
                # ho???c '_' ??? ph???n tr?????c ??u??i file, do ???? n??n s??? d???ng k???t h???p v???i split('_')
                # split() ????? l???y t??n file k??m t??n th?? m???c ch???a n??, h??m s??? t??ch ???????ng d???n ch??? ?????nh th??nh hai ph???n, t???i v??? tr?? d???u ph??n c??ch ???????ng d???n cu???i c??ng b??n ph???i, sau ???? l??u gi??? k???t qu??? v??o m???t tuple.
                    # vd:   path = './PreProduceCode-FMPN-FER/datasets/CKPlus/train_ids_0.csv'
                    #       print(os.path.split(path)) -> ('./PreProduceCode-FMPN-FER/datasets/CKPlus', 'train_ids_0.csv') = files
                    #       print(files[0]) -> ./PreProduceCode-FMPN-FER/datasets/CKPlus
                    #       print(files[1]) -> train_ids_0.csv
                    # ho???c d??ng c??ch nh?? sau ????? truy c???p nhanh h??n
                    #       dir_name, base_name = os.path.split(path)
                    #       print(dir_name) -> ./PreProduceCode-FMPN-FER/datasets/CKPlus
                    #       print(base_name) -> train_ids_0.csv
            # print(os.path.splitext(opt.train_csv)[0]) -> train_ids_0 = aka
            # print(aka.split('_')) ->  ['train', 'ids', '0'] = tmp_list

            fold_id = "." if len(tmp_list) < 3 else ("fold_%s" % tmp_list[2])
            # tmp_list[2] = 0 -> "fold_%s" % tmp_list[2] = fold_0
            opt.ckpt_dir = os.path.join(opt.ckpt_dir, dataset_name, opt.model, fold_id, opt.name)
            # ckpt_dir = default='./ckpts' -> ./ckpts/
            if not os.path.exists(opt.ckpt_dir): # ki???m tra ???? c?? folder t??n ckpts ch??a, n???u ch??a th?? t???o makedirs("./ckpts") -> PreProduceCode-FMPN-FER/ckpts
                os.makedirs(opt.ckpt_dir)

        # set gpu device
        str_ids = opt.gpu_ids.split(',')
        opt.gpu_ids = []
        for str_id in str_ids:
            cur_id = int(str_id)
            if cur_id >= 0:
                opt.gpu_ids.append(cur_id)
        if len(opt.gpu_ids) > 0:
            torch.cuda.set_device(opt.gpu_ids[0])

        # set seed 
        if opt.lucky_seed == 0:
            opt.lucky_seed = int(time.time())
        random.seed(a=opt.lucky_seed)
        np.random.seed(seed=opt.lucky_seed)
        torch.manual_seed(opt.lucky_seed)
        if len(opt.gpu_ids) > 0:
            torch.backends.cudnn.deterministic = True
            torch.backends.cudnn.benchmark = False
            torch.cuda.manual_seed(opt.lucky_seed)
            torch.cuda.manual_seed_all(opt.lucky_seed)
            
        # write command to file
        script_dir = opt.ckpt_dir if opt.mode == 'train' else opt.load_model_dir
        with open(os.path.join(os.path.join(script_dir, "run_script.sh")), 'a+') as f:
            f.write("[%5s][%s]python %s\n" % (opt.mode, opt.name, ' '.join(sys.argv)))

        # print and write options file
        msg = ''
        msg += '------------------- [%5s][%s]Options --------------------\n' % (opt.mode, opt.name)
        for k, v in sorted(vars(opt).items()):
            comment = ''
            default_v = parser.get_default(k)
            if v != default_v:
                comment = '\t[default: %s]' % str(default_v)
            msg += '{:>25}: {:<30}{}\n'.format(str(k), str(v), comment)
        msg += '--------------------- [%5s][%s]End ----------------------\n' % (opt.mode, opt.name)
        print(msg)
        with open(os.path.join(os.path.join(script_dir, "opt.txt")), 'a+') as f:
            f.write(msg + '\n\n')

        return opt






