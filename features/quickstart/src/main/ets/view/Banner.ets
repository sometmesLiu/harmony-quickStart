import {BannerClass} from '../model/BannerClass'
import { bufferToString } from '../util/BufferUtil';

@Preview
@Component
export struct Banner {
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', 'app.media.banner_pic0',
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', 'app.media.banner_pic1',
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', 'app.media.banner_pic2',
      'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', 'app.media.banner_pic3',
      'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', 'app.media.banner_pic4',
      'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', 'app.media.banner_pic5',
      'https://developer.huawei.com/consumer/cn/sdk')
  ]

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7')
    )
  }
}