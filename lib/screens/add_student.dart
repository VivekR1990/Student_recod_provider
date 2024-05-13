import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/utils/text_controlls/text_controllers.dart';
import 'package:sutdent_provider/utils/constants.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/provider/image_provider.dart';
import 'package:sutdent_provider/utils/text_controlls/text_validation.dart';
import 'package:sutdent_provider/widgets/add_student/profile_pic.dart';
import 'package:sutdent_provider/widgets/add_student/submit_button.dart';
import 'package:sutdent_provider/widgets/my_textfield.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key, required this.student});
  final StudentModel? student;
  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _studentControllers = StudentDataControllers();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _studentControllers.getStudentDetails(widget.student!);
      if (widget.student != null && widget.student!.profilePicture != null) {
        Provider.of<ImageProvide>(context, listen: false)
            .setImage(File(widget.student!.profilePicture!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvide imgProvider =
        Provider.of<ImageProvide>(context, listen: false);

    return ColoredBox(
      color: const Color.fromRGBO(165, 214, 167, 1),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(165, 214, 167, 1),
            title: Text(
              widget.student == null
                  ? 'Add Student Details'
                  : 'Edit Student Details',
              style: appbarTextStyle,
            ),
          ),
          body: PopScope(
            onPopInvoked: (didPop) => imgProvider.clearImge(),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const ProfilePicSelect(),
                      k20Height,
                      MyTextfield(
                          label: 'Name',
                          icon: Icons.person,
                          controller: _studentControllers.nameController,
                          validator: TextFormValidation.validataName),
                      k20Height,
                      MyTextfield(
                          controller: _studentControllers.guardianController,
                          label: 'Guardian Name',
                          icon: Icons.supervisor_account,
                          validator: TextFormValidation.validateParentName),
                      k20Height,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MyTextfield(
                                label: 'Batch',
                                icon: Icons.credit_card,
                                controller: _studentControllers.batchController,
                                validator: TextFormValidation.validateBatch),
                          ),
                          k10Width,
                          Expanded(
                            child: MyTextfield(
                                controller: _studentControllers.ageController,
                                validator: TextFormValidation.validateAge,
                                label: 'Age',
                                keyboardType: TextInputType.number,
                                icon: Icons.calendar_view_day_sharp),
                          ),
                        ],
                      ),
                      k20Height,
                      MyTextfield(
                          controller: _studentControllers.contactController,
                          label: 'Contact No',
                          icon: Icons.phone_android,
                          keyboardType: TextInputType.number,
                          validator: TextFormValidation.validateContact),
                      k20Height,
                      MyTextfield(
                        validator: TextFormValidation.validateEmail,
                        maxLine: 1,
                        label: 'E-Mail',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,

                        controller: _studentControllers.emailController,
                      ),
                      k20Height,
                      MyTextfield(
                        validator: TextFormValidation.validateAddress,
                        controller: _studentControllers.addressController,
                        label: 'Address',
                        icon: Icons.location_on_sharp,
                        maxLine: 4,
                      ),
                      k20Height,
                      SubmitButton(
                          formKey: _formKey,
                          studentController: _studentControllers,
                          studentItem: widget.student)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _studentControllers.nameController.dispose();
    _studentControllers.guardianController.dispose();
    _studentControllers.batchController.dispose();
    _studentControllers.ageController.dispose();
    _studentControllers.contactController.dispose();
    _studentControllers.emailController.dispose();
    _studentControllers.addressController.dispose();
    super.dispose();
  }
}
