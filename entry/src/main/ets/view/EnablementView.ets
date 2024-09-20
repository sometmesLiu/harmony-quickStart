import {ArticleClass} from '../model/ArticleClass'
import { bufferToString } from '../util/BufferUtil';

@Preview
@Component
export struct EnablementView {
  @State enablementList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getEnablementDataFromJSON();
  }

  getEnablementDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('EnablementData.json').then(value => {
      // 获取buffer内容
      let buffer: ArrayBufferLike = value.buffer;
      // 转换为字符串
      let res: string =  bufferToString(buffer);
      // 解析为数据结构
      this.enablementList = JSON.parse(res) as ArticleClass[];
    })
  }

  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid(){
        ForEach(this.enablementList, (item:ArticleClass) => {
          GridItem(){
            EnablementItem({enablementitem: item})
          }
        })
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({top:2, left:16, right: 16})
    }
    .margin({ top: 18 })
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
export struct EnablementItem {

  @Prop enablementitem: ArticleClass;

  build() {
    Column() {
      Image($r(this.enablementitem.imageSrc))
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({ topLeft: 16, topRight: 16 })
      Text(this.enablementitem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })
      Text(this.enablementitem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .backgroundColor(Color.White)
  }
}