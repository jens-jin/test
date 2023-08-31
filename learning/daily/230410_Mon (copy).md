1.

```
carla@carla:~/Downloads/zros_B_DropnGo_release_stable_stable_ubuntu1804_x86_64_2023-03-01-03-08_110921177/res$ diff marker_park_slot_detector/tensorrt_slot_config.xml /home/user/zros/.out_dir_ubuntu2004_x86_64/res/marker_park_slot_detector/tensorrt_slot_config.xml 
3c3
<     <Engine_Name>../res/marker_park_slot_detector/slot_caffe_220926.engine</Engine_Name>
---
>     <Engine_Name>../res/marker_park_slot_detector/pointline_20230220_slot_c385_iter_iter_60000_4080.engine</Engine_Name>

```

周三：

```
--branch dev
git add -u
git commit -m "xxx"
git checkout DropNGoLite
--branch DropNGoLite
#-Xours 保留主分支
git merge -Xtheirs dev
git reset --soft HEAD^(不然会有dev分支的提交信息和merge信息)
git commit -m "xxx"
git push origin HEAD:refs/for/DropNGoLite

```

