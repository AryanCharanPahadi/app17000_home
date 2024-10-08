import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:app17000ft_new/constants/color_const.dart';

import 'package:app17000ft_new/helper/database_helper.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../base_client/baseClient_controller.dart';

import 'package:app17000ft_new/forms/issue_tracker/issue_tracker_modal.dart';
import 'package:app17000ft_new/forms/issue_tracker/lib_issue_modal.dart';

import 'package:app17000ft_new/forms/issue_tracker/playground_issue.dart';

import 'package:flutter/cupertino.dart';

import 'alexa_issue.dart';
import 'digilab_issue.dart';
import 'furniture_issue.dart';

class IssueTrackerController extends GetxController with BaseController {
  var counterText = ''.obs;

  String? _tourValue;
  String? get tourValue => _tourValue;

  String? _schoolValue;
  String? get schoolValue => _schoolValue;

  bool isLoading = false;

  final TextEditingController correctUdiseCodeController =
      TextEditingController();
  final TextEditingController libraryDescriptionController =
      TextEditingController();
  final TextEditingController playgroundDescriptionController =
      TextEditingController();
  final TextEditingController digiLabDescriptionController =
      TextEditingController();
  final TextEditingController classroomDescriptionController =
      TextEditingController();
  final TextEditingController alexaDescriptionController =
      TextEditingController();
  final TextEditingController otherSolarDescriptionController =
      TextEditingController();
  final TextEditingController tabletNumberController = TextEditingController();
  final TextEditingController dotDeviceMissingController =
      TextEditingController();
  final TextEditingController dotDeviceNotConfiguredController =
      TextEditingController();
  final TextEditingController dotDeviceNotConnectingController =
      TextEditingController();
  final TextEditingController dotDeviceNotChargingController =
      TextEditingController();
  final TextEditingController dotOtherIssueController = TextEditingController();
  final TextEditingController tabletNumber3Controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dateController2 = TextEditingController();
  final TextEditingController dateController3 = TextEditingController();
  final TextEditingController dateController4 = TextEditingController();
  final TextEditingController dateController5 = TextEditingController();
  final TextEditingController dateController6 = TextEditingController();
  final TextEditingController dateController7 = TextEditingController();
  final TextEditingController dateController8 = TextEditingController();
  final TextEditingController dateController9 = TextEditingController();
  final TextEditingController dateController10 = TextEditingController();

  bool validateRegister = false;
  bool isImageUploaded = false;

  bool validateRegister2 = false;
  bool isImageUploaded2 = false;

  bool validateRegister3 = false;
  bool isImageUploaded3 = false;

  bool validateRegister4 = false;
  bool isImageUploaded4 = false;

  bool validateRegister5 = false;
  bool isImageUploaded5 = false;

  bool dateFieldError = false; // For the date
  bool dateFieldError2 = false; // For the date
  bool dateFieldError3 = false; // For the date
  bool dateFieldError4 = false; // For the date
  bool dateFieldError5 = false; // For the date
  bool dateFieldError6 = false; // For the date
  bool dateFieldError7 = false; // For the date
  bool dateFieldError8 = false; // For the date
  bool dateFieldError9 = false; // For the date
  bool dateFieldError10 = false; // For the date

  String? selectedValue = ''; // For the UDISE code
  String? selectedValue2 = ''; // For the issue of library
  String? selectedValue3 = ''; // For the which part of library issue
  String? selectedValue4 = ''; // For the issue reported by
  String? selectedValue5 = ''; // For the library issue status
  String? selectedValue6 = ''; // For the issue of playground
  String? selectedValue7 = ''; // For the  which part of playground issue
  String? selectedValue8 = ''; // For the  issue reported by playground
  String? selectedValue9 = ''; // For the  playground issue status
  String? selectedValue10 = ''; // For the issue of DigiLab
  String? selectedValue11 = ''; // For the issue reported by digiLab
  String? selectedValue12 = ''; // For the digiLab issue status
  String? selectedValue13 = ''; // For the part of digilab issue
  String? selectedValue14 = ''; // For the issue of Classroom
  String? selectedValue15 = ''; // For the part of classroom issue
  String? selectedValue16 = ''; // For the issue reported by Clssssroom
  String? selectedValue17 = ''; // For the Classroom issue status
  String? selectedValue18 = ''; // For the issue of alexa
  String? selectedValue19 = ''; // For the part of alexa issue
  String? selectedValue20 = ''; // For the issue reported by alexa
  String? selectedValue21 = ''; // For the alexa issue status
  String? selectedValue22 = ''; // For the alexa issue status
  String? selectedValue26 = ''; // For the alexa issue status

  // End of selecting Field error

  // Start of radio Field
  bool radioFieldError = false; // For the UDISE code
  bool radioFieldError2 = false; // For the issue of library
  bool radioFieldError3 = false; // For the which part of library issue
  bool radioFieldError4 = false; // For the  issue reported by
  bool radioFieldError5 = false; // For the  library issue status
  bool radioFieldError6 = false; // For the  issue of playground
  bool radioFieldError7 = false; // For the  which part of playground issue
  bool radioFieldError8 = false; // For the  issue reported by playground
  bool radioFieldError9 = false; // For the  playground issue status
  bool radioFieldError10 = false; // For the issue of DigiLab
  bool radioFieldError11 = false; // For the issue reported by digiLab
  bool radioFieldError12 = false; // For the digiLab issue status
  bool radioFieldError13 = false; // For the part of digilab issue
  bool radioFieldError14 = false; // For the issue of Classroom
  bool radioFieldError15 = false; // For the part of classroom issue
  bool radioFieldError16 = false; // For the issue reported by Clssssroom
  bool radioFieldError17 = false; // For the Classroom issue status
  bool radioFieldError18 = false; // For the issue of alexa
  bool radioFieldError19 = false; // For the part of alexa issue
  bool radioFieldError20 = false; // For the issue reported by alexa
  bool radioFieldError21 = false; // For the alexa issue status
  bool radioFieldError22 = false; // For the alexa issue status
  bool radioFieldError23 = false; // For the alexa issue status
  bool radioFieldError24 = false; // For the alexa issue status
  bool radioFieldError26 = false; // For the alexa issue status

  // End of radio Field error

  // Start of Showing Fields
  bool showBasicDetails = true; // For show Basic Details
  bool showLibrary = false; // For show Library
  bool showPlayground = false; // For show Playground
  bool showDigiLab = false; // For show Playground
  bool showClassroom = false; // For show classroom
  bool showAlexa = false; // For show alexa

  // End of Showing Fields

  final FocusNode _tourIdFocusNode = FocusNode();
  FocusNode get tourIdFocusNode => _tourIdFocusNode;

  final FocusNode _schoolFocusNode = FocusNode();
  FocusNode get schoolFocusNode => _schoolFocusNode;

  List<IssueTrackerRecords> _issueTrackerList = [];
  List<IssueTrackerRecords> get issueTrackerList => _issueTrackerList;

  // Lib issue list
  List<LibIssue> _libIssueList = [];
  List<LibIssue> get libIssueList => _libIssueList;

  // Play issue list
  List<PlaygroundIssue> _playgroundIssueList = [];
  List<PlaygroundIssue> get playgroundIssueList => _playgroundIssueList;

  //digilab issue list
  List<DigiLabIssue> _digiLabIssueList = [];
  List<DigiLabIssue> get digiLabIssueList => _digiLabIssueList;

  //furniture issue list
  List<FurnitureIssue> _furnitureIssueList = [];
  List<FurnitureIssue> get furnitureIssueList => _furnitureIssueList;

  //alexa issue list
  List<AlexaIssue> _alexaIssueList = [];
  List<AlexaIssue> get alexaIssueList => _alexaIssueList;

  List<String> _staffNames = [];
  List<String> get staffNames => _staffNames;

  final List<XFile> _multipleImage = [];
  List<XFile> get multipleImage => _multipleImage;
  List<String> _imagePaths = [];
  List<String> get imagePaths => _imagePaths;

  final List<XFile> _multipleImage2 = [];
  List<XFile> get multipleImage2 => _multipleImage2;

  List<String> _imagePaths2 = [];
  List<String> get imagePaths2 => _imagePaths2;

  final List<XFile> _multipleImage3 = [];
  List<XFile> get multipleImage3 => _multipleImage3;

  List<String> _imagePaths3 = [];
  List<String> get imagePaths3 => _imagePaths3;

  final List<XFile> _multipleImage4 = [];
  List<XFile> get multipleImage4 => _multipleImage4;

  List<String> _imagePaths4 = [];
  List<String> get imagePaths4 => _imagePaths4;

  final List<XFile> _multipleImage5 = [];
  List<XFile> get multipleImage5 => _multipleImage5;

  List<String> _imagePaths5 = [];
  List<String> get imagePaths5 => _imagePaths5;

  final List<XFile> _multipleImage6 = [];
  List<XFile> get multipleImage6 => _multipleImage6;

  List<String> _imagePaths6 = [];
  List<String> get imagePaths6 => _imagePaths6;

  final List<XFile> _multipleImage7 = [];
  List<XFile> get multipleImage7 => _multipleImage7;

  List<String> _imagePaths7 = [];
  List<String> get imagePaths7 => _imagePaths7;

  final List<XFile> _multipleImage8 = [];
  List<XFile> get multipleImage8 => _multipleImage8;

  List<String> _imagePaths8 = [];
  List<String> get imagePaths8 => _imagePaths8;

  final List<XFile> _multipleImage9 = [];
  List<XFile> get multipleImage9 => _multipleImage9;

  List<String> _imagePaths9 = [];
  List<String> get imagePaths9 => _imagePaths9;

  Future<String> compressImage(String imagePath) async {
    // Load the image
    final File imageFile = File(imagePath);
    final img.Image? originalImage =
        img.decodeImage(imageFile.readAsBytesSync());

    if (originalImage == null)
      return imagePath; // Return original path if decoding fails

    // Resize the image (optional) and compress
    final img.Image resizedImage =
        img.copyResize(originalImage, width: 768); // Change the width as needed
    final List<int> compressedImage =
        img.encodeJpg(resizedImage, quality: 40); // Adjust quality (0-100)

    // Save the compressed image to a new file
    final Directory appDir = await getTemporaryDirectory();
    final String compressedImagePath =
        '${appDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File compressedFile = File(compressedImagePath);
    await compressedFile.writeAsBytes(compressedImage);

    return compressedImagePath; // Return the path of the compressed image
  }

  Future<String> takePhoto(ImageSource source, int index) async {
    final ImagePicker picker = ImagePicker();
    List<XFile> selectedImages = [];
    XFile? pickedImage;

    // Determine which list to use based on the index parameter
    List<XFile> multipleImages;
    List<String> imagePaths;

    switch (index) {
      case 1:
        multipleImages = _multipleImage;
        imagePaths = _imagePaths;
        break;
      case 2:
        multipleImages = _multipleImage2;
        imagePaths = _imagePaths2;
        break;
      case 3:
        multipleImages = _multipleImage3;
        imagePaths = _imagePaths3;
        break;
      case 4:
        multipleImages = _multipleImage4;
        imagePaths = _imagePaths4;
        break;
      case 5:
        multipleImages = _multipleImage5;
        imagePaths = _imagePaths5;
        break;
      default:
        throw ArgumentError('Invalid index: $index');
    }

    if (source == ImageSource.gallery) {
      selectedImages = await picker.pickMultiImage();
      for (var selectedImage in selectedImages) {
        // Compress each selected image
        String compressedPath = await compressImage(selectedImage.path);
        multipleImages.add(XFile(compressedPath));
        imagePaths.add(compressedPath);
      }
      update();
    } else if (source == ImageSource.camera) {
      pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        // Compress the picked image
        String compressedPath = await compressImage(pickedImage.path);
        multipleImages.add(XFile(compressedPath));
        imagePaths.add(compressedPath);
      }
      update();
    }

    return imagePaths.toString();
  }

  void setSchool(String? value) {
    _schoolValue = value;
    update();
  }

  void setTour(String? value) {
    _tourValue = value;
    update();
  }

  Widget bottomSheet(BuildContext context, int index) {
    return Container(
      color: AppColors.primary,
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text("Select Image",
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () async {
                  await takePhoto(ImageSource.camera, index);
                  Get.back();
                },
                child: const Text('Camera',
                    style: TextStyle(fontSize: 20.0, color: AppColors.primary)),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () async {
                  await takePhoto(ImageSource.gallery, index);
                  Get.back();
                },
                child: const Text('Gallery',
                    style: TextStyle(fontSize: 20.0, color: AppColors.primary)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showImagePreview(String imagePath, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.file(File(imagePath), fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }

  void clearFields() {
    _tourValue = null;
    _schoolValue = null;
    correctUdiseCodeController.clear();
    libraryDescriptionController.clear();
    dateController.clear();
    dateController2.clear();
    _multipleImage.clear();
    _imagePaths.clear();
    _multipleImage2.clear();
    _imagePaths2.clear();
    update();
  }

  Future<void> fetchData() async {
    isLoading = true;
    update();
    _issueTrackerList =
        await LocalDbController().fetchLocalIssueTrackerRecords();
    _libIssueList = await LocalDbController().fetchLocalLibIssueRecords();
    _furnitureIssueList = await LocalDbController().fetchLocalFurnitureIssue();
    _playgroundIssueList =
        await LocalDbController().fetchLocalPlaygroundIssue();
    _digiLabIssueList = await LocalDbController().fetchLocalDigiLabIssue();
    _alexaIssueList = await LocalDbController().fetchLocalAlexaIssue();

    // _libIssueList = await LocalDbController().fetchLocalLibIssue();
    // _playIssueList = await LocalDbController().fetchLocalPlayIssue();
    isLoading = false;
    update();
  }
}
