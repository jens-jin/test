Test node:

1.泊车

- 车位释放
- 车位剔除
- 泊入泊出

接口：

am_parkin初始化

```
  amparkin_ = AmFactory::Instance()->GetApplicationModelClient<zros::am_parkin::AmParkInInterface>("am_parkin");
  amparkin_->Initialize(event_loop_);
  amparkin_->RegisterObserver(this);
```





