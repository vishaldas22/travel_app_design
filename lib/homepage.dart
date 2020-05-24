import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_app_design/details_page.dart';
import 'widgets/texttabs.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  Map<String,List<String>> imageList = {
  'image':[ 'https://image.freepik.com/free-vector/african-landscape-sunset-savannah-nature-trees-wilderness-cartoon-style-vector-illustration_114352-42.jpg','https://www.hospitalcareers.com/files/pictures/7e70a5e9dd96a6527a25af1719b06c62.png','https://helpx.adobe.com/content/dam/help/en/illustrator/how-to/drawing-basics/jcr_content/main-pars/image/drawing-basics-intro_900x506.jpg','https://cdn.dribbble.com/users/3384399/screenshots/10030043/image.png','https://66.media.tumblr.com/205835c9961626848cbf4c7510881b63/tumblr_ov6nn50y1l1tm2a88o1_1280.jpg'],
  'name':['Afrika Selatan', 'Islandia', 'Jepang', 'Indonesia','India' ], 
  'score':['4.5' ,'5.0' , '4.8' , '4.5','4.2'] }; 

  bool tapped = true;
  bool tapped1 = false;
  bool tapped2 = false;
  bool tapped3 = false;

  // updateMethod(){
  //   if(tapped==true){
  //     setState(() {
  //       tapped=true;
  //       tapped1=false;
  //       tapped2=false;
  //       tapped3=false;
  //     });
  // }else if(tapped1==true){
  //   setState(() {
  //     tapped1=true;
  //     tapped=false;
  //     tapped2=false;
  //     tapped3=false;
  //   });
  // }else if(tapped2==true){
  //   setState(() {
  //     tapped2=true;
  //     tapped1=false;
  //     tapped=false;
  //     tapped3=false;
  //   });
  // }else if(tapped3==true){
  //   setState(() {
  //     tapped3=true;
  //     tapped1=false;
  //     tapped2=false;
  //     tapped=false;
  //   });
  // }else{
  //     print("Nothing");
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hai, Bishal!', style: TextStyle(fontSize: 20,color: Colors.black26,fontWeight: FontWeight.w600),),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/me.jpg"),
                        radius: 27,
                      ),
                      Positioned(
                        left: 40,
                        top: 4,
                        child: CircleAvatar(
                        backgroundColor: Color(0xFF79C6D0),
                        radius: 6,
                      ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Mau \nLiburan \nKemana, nih?', 
              style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTabs(
                    title: "Top",
                    isChosen: true,
                  ),
                  TextTabs(
                    title: "Untukmu",
                  ),
                  TextTabs(
                    title: "Hidden gems",
                  ),
                  Icon(Icons.filter_list,color: Colors.black26,size: 28,),
                ],
              ),
              // GridImageBuilder(
              //   imageList: imageList[],
                
              // ),
              Container(
                margin: EdgeInsets.all(8),
                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    shrinkWrap: true,
                    mainAxisSpacing: 12,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailsPage(
                              countryName: imageList['name'][index],
                              imgSrc: imageList['image'][index],
                              rating: imageList['score'][index],
                            );
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage, image: imageList['image'][index],fit: BoxFit.cover,),
                              ),
                              Container(
                              margin: EdgeInsets.only(left: 15, top: 25),
                              alignment: Alignment.topLeft,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(imageList['name'][index], style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                                  Chip(
                                    elevation: 0.0,
                                    avatar: Icon(Icons.star,color: Color(0xFF79C6D0)),
                                    label: Text(imageList['score'][index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.black26)),
                                    backgroundColor: Colors.white,
                                    
                                  )
                                ],
                              ),
                            ),
                            ]
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Material bottomNavBar(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
      elevation: 4.0,
            child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 27.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    tapped = true;
                    tapped1=false;
                    tapped2=false;
                    tapped3=false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/home.svg", color: tapped ? Color(0xFF79C6D0) : Colors.black26, height: 35, width: 35),
                    SizedBox(width: 15),
                    tapped ? Text('Eksplor', style: TextStyle(color: Color(0xFF79C6D0), fontWeight: FontWeight.bold, fontSize: 18),) : Container(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    tapped1 = true;
                    tapped=false;
                    tapped2=false;
                    tapped3=false;
                  });
                  
                },
                child: Row(
                  children: [
                    Icon(Icons.insert_chart, color: tapped1 ? Color(0xFF79C6D0) : Colors.black26,size: 30,),
                    SizedBox(width: 15),
                    tapped1 ? Text('Strony', style: TextStyle(color: Color(0xFF79C6D0),  fontWeight: FontWeight.bold, fontSize: 18),) : Container(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    tapped2 = true;
                    tapped1=false;
                    tapped=false;
                    tapped3=false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/notify.svg", color: tapped2 ? Color(0xFF79C6D0) : Colors.black26, height: 27,width: 27,),
                    SizedBox(width: 15),
                    tapped2 ? Text('Notyfikować', style: TextStyle(color: Color(0xFF79C6D0),  fontWeight: FontWeight.bold, fontSize: 18),) : Container(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    tapped3 = true;
                    tapped1=false;
                    tapped2=false;
                    tapped=false;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.favorite_border, color: tapped3 ? Color(0xFF79C6D0) : Colors.black26,size: 30,),
                    SizedBox(width: 15),
                    tapped3 ? Text('Ulubiony', style: TextStyle(color: Color(0xFF79C6D0),  fontWeight: FontWeight.bold, fontSize: 18),) : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // bottomNavButtons(String title, IconData icon){
  //   return 
  // }

}

