import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import '../main.dart';
import '../provider/product_model.dart';
import 'package:provider/provider.dart';
import './chatScreen.dart';
import '../provider/products_provider.dart';
import '../widgets/drawer_app.dart';
import './search_screen.dart';
import '../widgets/product_item.dart';
import '../provider/products_provider.dart';
import './product_details_screen.dart';
List<Product> _items=[
  Product(
      id: 'p1',
      title: 'Lipiget 10mg',
      description: 'As an adjunct to diet to reduce elevated total-C, LDL-C, Apo B, and TG levels and to increase HDL levels in primary hypercholesterolemia and mixed dyslipidemia, hypertriglyceridemia, primary dysbetalipoproteinemia, homozygous familial hypercholesterolemia, heterozygous familial hypercholesterolemia (boys and postmenarchal girls 10-17 years of age), and in prevention of cardiovascular disease.',
      price: 29.99,
      imageUrl:
      'https://cdn.shopify.com/s/files/1/0088/4758/9476/products/04942_1535x1027.jpg?v=1561674419'
  ),
  Product(
      id: 'p2',
      title: 'Agnar',
      description: 'Agnar™ Indication: Provides complete bone care. Helps to maintain bone strength and reduces probability of fractures.',
      price: 540.00,
      imageUrl:
      'https://medicalstore.com.pk/wp-content/uploads/2020/05/874agnar-tablets.jpg'
  ),
  Product(
      id: 'p3',
      title: 'Cipesta 500mg',
      description: 'For the treatment of following urinary tract infections, caused by susceptible isolates of designated microorganisms: Uncomplicated Urinary Tract Infections (Acute Cystitis) Complicated Urinary Tract Infections. Acute Uncomplicated Pyelonephritis.',
      price: 151.09,
      imageUrl:
      'https://products.dawaai.pk/2016/05/1427/zoom/cip1427_101500970396.jpg'
  ),
  Product(
      id: 'p4',
      title: 'Gonadil F',
      description: 'Gonadil-F is a unique formulation of the natural extract of Tribulus terrestris, a highly effective and safe compound, widely used by millions of people for successful treatment of a wide range of male sexual health disorders.',
      price: 740.99,
      imageUrl:
      'https://d11zer3aoz69xt.cloudfront.net/media/catalog/product/cache/1/image/1200x/9df78eab33525d08d6e5fb8d27136e95/k/a/karachi_shop_gonadil-f_multivitamins_tonic_for_male_infertility.jpg'
  ),
  Product(id: 'p5', title: 'COva H 160/12.5', imageUrl: 'https://sehat.com.pk/product_images/y/664/Cova_%26_Cova-H.160mg.12.5__37638_zoom.jpg', description: 'Lowering blood pressure reduces the risk of fatal and nonfatal cardiovascular events, primarily strokes and myocardial infarctions.', price: 247.00),
  Product(id: 'p6', title: 'Covam 5+80', imageUrl: 'https://sehat.com.pk/product_images/t/931/covam__96154_zoom.jpg', description:'For the treatment of hypertension in: Patients whose blood pressure is not adequately controlled on either monotherapy. Patients who are likely to need multiple drugs to achieve their blood pressure goals.' , price: 261.55),
  Product(id: 'p7', title: 'Diampa 10mg', imageUrl:'https://sehat.com.pk/product_images/zoomImage/4861_zoom.jpg',
      description: 'In combination with other glucose–lowering medicinal products including insulin, when these, together with diet and exercise, do not provide adequate glycemic control.'
      , price: null),
  Product(id: 'p8', title: 'Treviamet 50/500', imageUrl: 'https://cdn.shopify.com/s/files/1/0088/4758/9476/products/13086_2_1636x1167.jpg?v=1566977123',
      description: 'As an adjunct to diet and exercise to improve glycemic control in patients with type 2 diabetes mellitus inadequately controlled on Metformin HCl or Sitagliptin alone r in patients already being treated with the combination of Sitagliptin and Metformin HCl.', price: 375.25),
  Product(id: 'p9', title: 'Gaviscon Syrup 120ml', imageUrl: 'https://products.dawaai.pk/2014/05/416/zoom/_1_1481131956.jpg', description: 'This medication is used to treat the symptoms of too much stomach acid such as stomach upset, heartburn, and acid indigestion. Aluminum and magnesium antacids work quickly to lower the acid in the stomach. Liquid antacids usually work faster/better than tablets or capsules.', price: 83.07),
  Product(id: 'p10', title: 'Cef OD 400mg', imageUrl:'https://cdn11.bigcommerce.com/s-km6aq5/images/stencil/1280x1280/products/932/809/CEF-OD_400__76339.1468498888.jpg?c=2&imbypass=on', description: 'Cefixime is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria. This antibiotic treats only bacterial infections.', price: 350.00),
  Product(id: 'p11', title: 'Eskem 40mg', imageUrl: 'https://cdn.shopify.com/s/files/1/0088/4758/9476/products/04022_1_1709x1227.jpg?v=1561671408', description: 'Esomeprazole is used to treat certain stomach and esophagus problems (such as acid reflux, ulcers). It works by decreasing the amount of acid your stomach makes. It relieves symptoms such as heartburn, difficulty swallowing, and persistent cough.', price: 399.67),
  Product(id: 'p12', title: 'Rabixin 20mg', imageUrl: 'https://cdn.shopify.com/s/files/1/0088/4758/9476/products/04906_1590x1160.jpg?v=1561674293', description: 'Robaxin (methocarbamol) is a muscle relaxer. It works by blocking nerve impulses (or pain sensations) that are sent to your brain. Robaxin is used together with rest and physical therapy to treat skeletal muscle conditions such as pain or injury', price:345.00),
  Product(id: 'p13', title: 'Thergran Ultra', imageUrl: 'https://1.bp.blogspot.com/-3t-ax_v4xwc/Xfu0kuggPbI/AAAAAAAAAn8/VVdQ3YNyMF8T_iH-sn2Xrwlc88ifJpaZQCLcBGAsYHQ/s1600/theragran-ultra-tablets-multivitamins-minerals-formula.gif', description: ' This medication is a multivitamin and iron product used to treat or prevent vitamin deficiency due to poor diet, certain illnesses, or during pregnancy. Vitamins and iron are important building blocks of the body and help keep you in good health.', price: 412.88),
  Product(id: 'p14', title: 'Sensival 25mg', imageUrl: 'https://sehat.com.pk/product_images/c/557/IMG_9179__23450_zoom.JPG', description: 'Sensival is used to treat depression and nocturnal (night time) bedwetting in children. It restores the chemical imbalance in the brain and enhances mood and behavior. In some cases, it may also be prescribed to relieve neuropathic (nerve) pain', price: 65.00),
  Product(id: 'p15', title: 'Kestine 10mg', imageUrl: 'https://cdn.shopify.com/s/files/1/0088/4758/9476/products/04991_1710x947.jpg?v=1561674635', description: 'Kestine tablets are used for symptomatic treatment of allergic rhinitis (runny nose) and urticaria (nettle rash). Do not use Kestine 10 mg: if you are allergic to ebastine or any other ingredients of this medicine', price: 166.73),
];

class FrontScreen extends StatelessWidget {
  static const routeName='front-page';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final showAllProducts=Provider.of<ProductsProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        drawer: DrawerData(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Medicx Shop'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlidesOFFrontPages(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: IconsOfUploads(
                            iconTitle: 'request pill',
                            title: 'Request \n Medicine'),

                      splashColor: Colors.red,onTap: (){

                      },),
                      IconsOfUploads(
                          iconTitle: 'Schedule', title: 'Schedule \n Refills'),
                      IconsOfUploads(
                          iconTitle: 'UploadMedicine',
                          title: 'Upload \n Prescription'),
                      IconsOfUploads(
                          iconTitle: 'pill reminder',
                          title: 'Pill \n Reminders'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Today \'s Deals'),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProductsOverView.routeName);
                        },
                        child: Text('View More'),
                      ),

                    ],
                  ),
                ),
              Container(
                height: 180,

                child: GridView.builder(
                    itemCount: _items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,childAspectRatio: 1,
                  crossAxisSpacing: 10,
                ),
                 itemBuilder: (ctx,index)=>ClipRRect(
                   borderRadius: BorderRadius.circular(10) ,
                   child: GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, ProductDetails.productDetails,);
                     },
                     child: GridTile(
                         footer: GridTileBar(


                         ),
                         child:Image.network('${_items[index].imageUrl}') ),
                   ),


                 ),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlidesOFFrontPages extends StatelessWidget {
  const SlidesOFFrontPages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: 350.0,
      child: Carousel(
        images: [
          AssetImage('assets/images/ads1.jpg'),
          AssetImage('assets/images/ads2.jpg'),
          AssetImage('assets/images/ads3.jpg'),
          AssetImage('assets/images/ads4.jpg'),
        ],
        dotSize: 1.0,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 0.0,
        borderRadius: true,
      ),
    );
  }
}

class IconsOfUploads extends StatelessWidget {
  const IconsOfUploads({
    Key key,
    @required this.title,
    @required this.iconTitle,
  }) : super(key: key);

  final String title;
  final String iconTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/imageIcons/$iconTitle.png')),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
