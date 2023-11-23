import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumemaker/view/widgets/custom_textFormField.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../utils/const/textStyle.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController firstNA = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double? _distanceToField;
  TextfieldTagsController? _controller;
  String firstName = '';
  String lastName = '';
  String jobTitle = '';
  String jobStatus = '';
  String aboutMe = '';
  DateTime? selectedDate;
  XFile? image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text('User Information Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        image != null ? FileImage(File(image!.path)) : null,
                    child: image == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey[600],
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',

                    contentPadding: EdgeInsets.all(10),
                    errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                    border: OutlineInputBorder(
                      // Add this line to include a bord
                      //er
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    // hintText: hintText,

                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'last Name',

                    contentPadding: EdgeInsets.all(10),
                    errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                    border: OutlineInputBorder(
                      // Add this line to include a bord
                      //er
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    // hintText: hintText,

                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      lastName = value;
                    });
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'job title',

                    contentPadding: EdgeInsets.all(10),
                    errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                    border: OutlineInputBorder(
                      // Add this line to include a bord
                      //er
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    // hintText: hintText,

                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      jobTitle = value;
                    });
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'job status',

                    contentPadding: EdgeInsets.all(10),
                    errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                    border: OutlineInputBorder(
                      // Add this line to include a bord
                      //er
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    // hintText: hintText,

                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      jobStatus = value;
                    });
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'about me',

                    contentPadding: EdgeInsets.all(10),
                    errorStyle: TextStyle1(color: Colors.red[400], size: 11),
                    border: OutlineInputBorder(
                      // Add this line to include a bord
                      //er
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    // hintText: hintText,

                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onChanged: (value) {
                    setState(() {
                      aboutMe = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(selectedDate != null
                      ? 'Date of Birth: ${selectedDate!.toLocal()}'
                          .split(' ')[0]
                      : 'Select Date of Birth'),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('SKILLS'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldTags(
                  textfieldTagsController: _controller,
                  initialTags: const [
                    'pick',
                    'your',
                    'favorite',
                    'programming',
                    'language'
                  ],
                  textSeparators: const [' ', ','],
                  letterCase: LetterCase.normal,
                  validator: (String tag) {
                    if (tag == 'php') {
                      return 'No, please just no';
                    } else if (_controller!.getTags!.contains(tag)) {
                      return 'you already entered that';
                    }
                    return null;
                  },
                  inputfieldBuilder:
                      (context, tec, fn, error, onChanged, onSubmitted) {
                    return ((context, sc, tags, onTagDelete) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: tec,
                          focusNode: fn,
                          decoration: InputDecoration(
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                width: 3.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                width: 3.0,
                              ),
                            ),
                            helperText: 'Enter language...',
                            helperStyle: const TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1),
                            ),
                            hintText:
                                _controller!.hasTags ? '' : "Enter tag...",
                            errorText: error,
                            prefixIconConstraints: BoxConstraints(
                                maxWidth: _distanceToField! * 0.74),
                            prefixIcon: tags.isNotEmpty
                                ? SingleChildScrollView(
                                    controller: sc,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: tags.map((String tag) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                '#$tag',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onTap: () {
                                                print("$tag selected");
                                              },
                                            ),
                                            const SizedBox(width: 4.0),
                                            InkWell(
                                              child: const Icon(
                                                Icons.cancel,
                                                size: 14.0,
                                                color: Color.fromARGB(
                                                    255, 233, 233, 233),
                                              ),
                                              onTap: () {
                                                onTagDelete(tag);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                                  )
                                : null,
                          ),
                          onChanged: onChanged,
                          onSubmitted: onSubmitted,
                        ),
                      );
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Job Expriences'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 100,
                  width: 500,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis
                                .vertical, // Adjust the scroll direction if needed
                            itemCount:
                                5, // Set the itemCount according to your data
                            itemBuilder: (context, index) {
                              return Container(
                              alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 10 , left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('job title'),
                                    Text('company name '),
                                    Text('about the job'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                     // Add other widgets here, like IconButton
                      IconButton(
                        onPressed: () {
                          print('the button is pressed');
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Color.fromRGBO(143, 148, 251, 1))),
                ),
                          Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Education'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 100,
                  width: 500,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis
                                .vertical, // Adjust the scroll direction if needed
                            itemCount:
                                5, // Set the itemCount according to your data
                            itemBuilder: (context, index) {
                              return Container(
                              alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 10 , left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('job title'),
                                    Text('company name '),
                                    Text('about the job'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                     // Add other widgets here, like IconButton
                      IconButton(
                        onPressed: () {
                          print('the button is pressed');
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Color.fromRGBO(143, 148, 251, 1))),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(143, 148, 251, 1))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // You can process or send this data as needed
                      // For the image, you can use the `image.path` or upload it to a server
                      print('First Name: $firstName');
                      print('Last Name: $lastName');
                      print('Date of Birth: $selectedDate');
                      if (image != null) {
                        print('Image Path: ${image!.path}');
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
