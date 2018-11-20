import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../api/api.dart';
import '../utils/httpUtil.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new SwiperPageState();
  }
}

class SwiperPageState extends State<HomePage> {
  var imgList = 'https://img.wochu.cn/newretail/d005e796f3d142d2355f64f0be83a658.jpg';
  var count = 4;

   getIndexData() async {
    String url = Api.INDEX;
    HttpUtil.post(url).then((data) {
      var datas = json.decode(data);
      if (datas['rs']) {
        print(datas['data']['bannerList'].length);
        setState(() {
          //imgList = datas['data']['bannerList'];
         // count = datas['data']['bannerList'].length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //getIndexData();
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(350),
        child: Swiper(
          itemWidth: ScreenUtil().setWidth(750),
          itemHeight: ScreenUtil().setHeight(350),
          itemBuilder: (BuildContext context, int index) {
             //print("1111：" + imgList);
            // print(imgList[index].image_path);
            return Image.network(
              imgList,
              fit: BoxFit.fill,
              height: ScreenUtil().setHeight(350),
              width: ScreenUtil().setWidth(750),
            );
          },
          itemCount: count,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.redAccent,
              ),
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(10.0)),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ),
      ),
    );
  }
}
