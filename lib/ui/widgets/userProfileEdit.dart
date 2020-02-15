import 'package:chatapp/api/imagepicker.dart';
import 'package:chatapp/api/reuseWidget.dart';
import 'package:chatapp/api/databaseApi.dart';
import 'package:chatapp/model/userdata.dart';
import 'package:chatapp/ui/widgets/loadingbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserProfileEdit extends StatefulWidget {
  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    //!Variable
    final _key = GlobalKey<FormState>();
    String _name, _about;
    ImagePic _image = Provider.of<ImagePic>(context);
    //return
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: StreamBuilder(
          stream: DB.getCurrentUserData(),
          builder: (context, userdata) {
            return (userdata.connectionState == ConnectionState.active)
                ? Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //SizedBox
                        SizedBox(
                          height: 20,
                        ),
                        //User image
                        InkWell(
                          onTap: () {
                            _image.getImage();
                          },
                          child: (_image.image == null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(500),
                                  child: Image.network(
                                    userdata.data.documents[0]['profile'] ?? '',
                                    width: 130,height: 130,fit: BoxFit.cover,
                                    loadingBuilder: (context, child, chk) {
                                      return (chk == null)
                                          ? child
                                          : Image.asset(
                                              'images/user.JPG',
                                              width: 130,
                                              height: 130,
                                            );
                                    },
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(500),
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.file(
                                        _image.image,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: ScreenUtil.screenHeight*0.03,),
                        //!User name
                        TextFormField(
                          validator: (val) {
                            return (val.isEmpty) ? 'Enter name' : null;
                          },
                          onSaved: (val) => _name = val,
                          initialValue:
                              userdata.data.documents[0]['name'] ?? '',
                          decoration: InputDecoration(
                            hintText: 'Enter name',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //!User email
                        TextFormField(
                          enabled: false,
                          initialValue:
                              userdata.data.documents[0]['email'] ?? '',
                          decoration: InputDecoration(
                            hintText: 'Enter email',
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //!User about
                        TextFormField(
                          maxLines: 2,
                          validator: (val) {
                            return (val.isEmpty) ? 'Enter about' : null;
                          },
                          onSaved: (val) => _about = val,
                          initialValue:
                              userdata.data.documents[0]['about'] ?? '',
                          decoration: InputDecoration(
                            hintText: 'about',
                            prefixIcon: Icon(
                              Icons.description,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                        //!User about
                       SizedBox(height: ScreenUtil.screenHeight*0.03,),
                        //Update button
                        RaisedButton(
                          color: Theme.of(context).canvasColor,
                          shape: reuse.getButtonStyle(),
                          child: Text(
                            "UPDATE",
                            style: reuse.getButtonTextStyle(),
                          ),
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              _key.currentState.save();
                              showLoading(context, "Updating your profile.");

                              DB.updateUserData(
                                userdata.data.documents[0].documentID,
                                User(_name, "", "", _about, _image.image.toString()),
                                _image.image,context
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
