import { QuickStartPage } from '@ohos/quickstart';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      QuickStartPage()
    }
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })s

    // RelativeContainer() {
    //   Text(this.message)
    //     .id('IndexHelloWorld')
    //     .fontSize(50)
    //     .fontWeight(FontWeight.Bold)
    //     .alignRules({
    //       center: { anchor: '__container__', align: VerticalAlign.Center },
    //       middle: { anchor: '__container__', align: HorizontalAlign.Center }
    //     })
    // }
    // .height('100%')
    // .width('100%')
  }
}