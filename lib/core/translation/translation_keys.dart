import 'package:flutter/material.dart';

import '../cache/cache_keys.dart';

abstract class TranslationKeys {
  //every defintion in this file is a key for translation not a value


  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);
  
  static const welcomeToDoIt = "welcome To\nDo It !"; 
  static const readyToConquer =
      "Ready to conquer your tasks? Let's Do It together.";
  static const letStart = "Let’s Start";
  static const register = "Register";
  static const login = "login";
  static const hello = "hello";
  static const title = "title";
  static const description = "description";
  static const String userNameTitle = "Username";
  static const String passWordTitle = "Password";
  static const String confirmPassWordTitle = " Confirm Password";

  static const String settingsTitle = "Settings";
  static const String languageTitle = "Language";
  static const String arabicTitle = "AR";
  static const String englishTitle = "EN";

  static const String userNoAccountTitle = "Don’t Have An Account?";
  static const String appTitle = 'Tasks App';
  static const String changePasswordTitle = "Change Password";
  static const String updateProfileTitle = "Update Profile";
  static const String rememberMeTitle = "Remember me?";
  static const String alreadyHaveAccountTitle = "Already Have An Account?";
  static const String noTaskMsgTitle =
      " There are no tasks yet, \n Press the button \n To add New Task  ";
  //'add tasks'
  static const String addTaskTitle = 'add tasks';
  static const String editTaskTitle = 'edit tasks';
  static const String deleteTaskTitle = 'delete tasks';
  static const String deleteTaskMsgTitle = 'Are you sure you want to delete this task?';
  static const String filterTaskTitle = 'filter tasks';
  static const String taskAppBarTitle = 'Current Tasks';
  static const String searchTitle = "Search... ";
  static const String resultTitle = "Results";
  static const String inProgressTitle = "In Progress";


  static const String oldPasswordTitle = "Old Password";
  static const String newPasswordTitle = "New Password";
  static const String saveBtnTitle = "Save";
  static const String taskGroupName = "Task Groups";
  static const String personalTaskTitle = "Personal Task";
    static const String viewTaskTitle = "View Tasks";
    static const String homeTaskTitle = "Home Task";

  static const String workTaskTitle = "Work Task";
  static const String workTaskSubTitle = "Add New Features";
  static const String personalTaskSubTitle =
      "Improve my English skills\n by trying to speak";
   static const String homeTaskSubTitle =
      "Add new feature for Do It \n app and commit it";
       static const String titleInHomeContainer =
      'Your today’s tasks \n almost done!';

  static const String cancelBtnTitle = "Cancel";
  static const String deleteBtnTitle = "Delete";
   static const String updateBtnTitle = "Update"; 
    static const String logoutBtnTitle = "LogOut"; 



}
