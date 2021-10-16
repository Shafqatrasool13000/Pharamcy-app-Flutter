import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_model.dart';
import '../provider/products_provider.dart';
import '../provider/products_provider.dart';
class EditProductScreen extends StatefulWidget {
  static const String routeName = '/Edit-Product-Screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageEditingController=TextEditingController();
  var _formData=GlobalKey<FormState>();
  var _initialState=true;
  bool _isLoading=false;
   var _editProduct=Product(
     title: '',
     description: '',
     id: null,
     imageUrl: '',
     price: 0,
   );
   var _initValue={
     'title':'',
     'price':'',
     'description':'',
     'imageURL':'',
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _imageUrlFocusNode.addListener(_updateImage);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageEditingController.dispose();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(_initialState){
      final productId=ModalRoute.of(context).settings.arguments as String;
    if(productId!=null){
      _editProduct=Provider.of<ProductsProvider>(context).compareId(productId);
      _initValue={
        'title':_editProduct.title,
        'price':_editProduct.price.toString(),
        'description':_editProduct.description,
        'imageURL':'',

      };
      _imageEditingController.text=_editProduct.imageUrl;
    }


    }
  bool  _initState=false;

  }
  void _updateImage(){
    if(!_imageUrlFocusNode.hasFocus||(_imageEditingController.text.startsWith('http')||
        !_imageEditingController.text.startsWith('https'))||
        !_imageEditingController.text.endsWith('png')||
        !_imageEditingController.text.endsWith('.jpg')||
        !_imageEditingController.text.endsWith('jpeg')){
      setState(() {

      });
    }
  }

 void _saveFormData(){

   final _isValid= _formData.currentState.validate();
   if(!_isValid){
    return;
   }
   _formData.currentState.save();
   setState(() {
     setState(() {
       _isLoading=true;
     });
   });
  if(_editProduct.id!=null){
    Provider.of<ProductsProvider>(context,listen: false).updateProduct(_editProduct.id, _editProduct);
    setState(() {
      _isLoading=false;
    });

    Navigator.of(context).pop();

  }else{
    Provider.of<ProductsProvider>(context,listen: false).addItems(_editProduct).then((value){
    }).catchError((error){
      return showDialog(context: context,builder: (ctx)=>AlertDialog(
        title: Text('An error Occurred'),
        content: Text('Something went wrong'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(ctx).pop();
          }, child: Text('Okay')),
        ],
      ),
      ).then((error){
        print('hello ');
        setState(() {
          _isLoading=false;
        });
        Navigator.of(context).pop();
      });

    });
  }



  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveFormData,
          ),
        ],
        ),
        body:_isLoading?Center(child: CircularProgressIndicator()):Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formData,

              child: ListView(
            children: <Widget>[
              TextFormField(
               initialValue: _initValue['title'],
                textInputAction: TextInputAction.next,
                autofocus: true,
                onSaved: (value){
                  _editProduct=Product(id:_editProduct.id , title: value, imageUrl: _editProduct.imageUrl,
                      description: _editProduct.description,
                      price: _editProduct.price,isFavourite: _editProduct.isFavourite);
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Please enter the title';
                  }else{
                    return null;
                  }
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                decoration: InputDecoration(labelText: 'Enter the title'),
              ),
              TextFormField(
                initialValue: _initValue['price'],

                onSaved: (value){
                  _editProduct=Product(id:_editProduct.id , title: _editProduct.title, imageUrl: _editProduct.imageUrl,
                      description: _editProduct.description,isFavourite: _editProduct.isFavourite,
                      price: double.parse(value));
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Please Enter the price';
                  }if(double.tryParse(value)==null){
                    return 'Enter value valid price';
                  }if(double.tryParse(value)<=0){
                    return 'Please Enter value greater than zero';
                  }
                    return null;

                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter the price',
                ),
              ),
              TextFormField(
                initialValue: _initValue['description'],

                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                },

                onSaved: (value){

                  _editProduct=Product(id:_editProduct.id , title: _editProduct.title, imageUrl: _editProduct.imageUrl,
                      description: value,
                      price: _editProduct.price,isFavourite: _editProduct.isFavourite);
                },
                validator: (value){
                  if(value.isEmpty){
                    return 'Enter the value';
                  }if(value.length<9){
                   return 'Enter description correct length';
                  }
                  return null;
                },
                maxLines: 3,
                focusNode: _descriptionFocusNode,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Enter the description',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FittedBox(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: _imageEditingController.text.isEmpty?Text('Enter the Image URL',textAlign:TextAlign.center,):Image.network(_imageEditingController.text,fit: BoxFit.cover,),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red
                        )
                      ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: TextFormField(
                        initialValue: _initValue['imageUrl'],

                        onFieldSubmitted:(_){
                          _saveFormData();
                        },

                        validator: (value){
                          if(value.isEmpty){
                            return 'Enter the value';
                          }if(!value.startsWith('http')||!value.startsWith('https')){
                            return 'Please enter valid URL';
                          }

                          return null;
                        },
                        onSaved: (value){
                          _editProduct=Product(id:_editProduct.id , title: _editProduct.title, imageUrl: value,
                              description: _editProduct.description,
                              price: _editProduct.price,isFavourite: _editProduct.isFavourite);
                        },
                        controller: _imageEditingController ,
                        textInputAction: TextInputAction.done,
                      focusNode: _imageUrlFocusNode,
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                          labelText: 'Image Url',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
