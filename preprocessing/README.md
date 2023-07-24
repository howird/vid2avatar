
# Setup simple romp and run preprocessing

- Install [simple-romp](https://github.com/Arthur151/ROMP/blob/master/simple_romp/README.md#installation)
```
pip install simple-romp scikit-learn
```

- Download files from [this link](https://github.com/Arthur151/ROMP/releases/download/V2.0/smpl_model_data.zip)
- Extract them to `vid2avatar/code/lib/smpl/smpl_model`, where we previously installed SMPL models
- Use install them to `romp`
```
romp.prepare_smpl -source_dir=/root/vid2avatar/code/lib/smpl/smpl_model --gender male
```