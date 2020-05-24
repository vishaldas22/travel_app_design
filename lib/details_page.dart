import 'package:flutter/material.dart';
import 'widgets/texttabs.dart';

class DetailsPage extends StatelessWidget {

  final String countryName;
  final String rating;
  final String imgSrc;

  DetailsPage({this.countryName,this.rating,this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottom(context),
      backgroundColor: Colors.brown[50],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  )
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(imgSrc,),fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              )
                            ),
                            height: MediaQuery.of(context).size.height * 0.55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:15.0,right: 12.0,top: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(icon: Icon(Icons.keyboard_backspace, color:Colors.black,size: 35), onPressed: (){
                                  Navigator.pop(context);
                                }),
                                IconButton(icon: Icon(Icons.more_horiz, color:Colors.black,size: 35), onPressed: (){})
                              ],
                            ),
                          ),
                          Positioned(
                            top: 415,
                            right: 50,
                            child: Material(
                              borderRadius: BorderRadius.circular(35),
                              elevation: 3.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30.0,
                                child: Icon(Icons.favorite,color: Colors.red,size: 35.0,),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 470,
                            left: 24,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text(countryName, style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Chip(
                                        label: Text(rating,style: TextStyle(
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black26,
                                          )
                                        ),
                                        avatar: Icon(Icons.star, color: Color(0xFF79C6D0)),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        autofocus: false,
                                      ),
                                      Chip(
                                        label: Text('12 hari',style: TextStyle(
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          )
                                        ),
                                        avatar: Icon(Icons.access_time, color: Colors.black26),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        autofocus: false,
                                      ),
                                      Chip(
                                        label: Text('120 km',style: TextStyle(
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          )
                                        ),
                                        avatar: Icon(Icons.location_on, color: Colors.black26),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        autofocus: false,
                                      )
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33.0, top: 15.0),
                child: Row(
                    children: [
                      TextTabs(
                        isChosen: true,
                        title: 'Tentang',
                      ),
                      SizedBox(width: 15.0),
                      TextTabs(
                        title: 'Ikon wisata',
                      ),
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0,top: 20.0,bottom: 20.0,),
                child: Text('$countryName, dikenal dengan lanskapnya\nyang indah dengan gunung berapi,\ngeyser, sumber air panas, dan ladang lavanya.',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w500,fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBottom(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      padding: EdgeInsets.only(left: 35.0,top: 20.0,right: 35.0,bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45)),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kisaran Harga', style: TextStyle(color: Colors.black26, fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 5),
              Text('\$800.00', style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),
          FlatButton(onPressed: (){}, child: Text("Lanjuktan", style: TextStyle(
            color: Colors.white, fontSize: 21,fontWeight: FontWeight.bold
          ),
          ),color: Color(0xFF79C6D0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          padding: EdgeInsets.all(15.0),
          )
        ],
      ),
    );
  }
}