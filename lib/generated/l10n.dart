// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose Language`
  String get Language {
    return Intl.message(
      'Choose Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Digital Egypt Innovation Hub`
  String get BoardTitle {
    return Intl.message(
      'Digital Egypt Innovation Hub',
      name: 'BoardTitle',
      desc: '',
      args: [],
    );
  }

  /// `An integrated system to support innovation and entrepreneurship in the communications and information technology sector`
  String get BoardSubtitle {
    return Intl.message(
      'An integrated system to support innovation and entrepreneurship in the communications and information technology sector',
      name: 'BoardSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Start with us now`
  String get BourdButton {
    return Intl.message(
      'Start with us now',
      name: 'BourdButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin_title {
    return Intl.message('Sign In', name: 'signin_title', desc: '', args: []);
  }

  /// `Enter your details to start`
  String get signin_subtitle {
    return Intl.message(
      'Enter your details to start',
      name: 'signin_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message('Email', name: 'email_hint', desc: '', args: []);
  }

  /// `Password`
  String get password_hint {
    return Intl.message('Password', name: 'password_hint', desc: '', args: []);
  }

  /// `Forgot your password?`
  String get forgot_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get signup_button {
    return Intl.message(
      'Create a new account',
      name: 'signup_button',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_title {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next_button {
    return Intl.message('Next', name: 'next_button', desc: '', args: []);
  }

  /// `Name`
  String get name_hint {
    return Intl.message('Name', name: 'name_hint', desc: '', args: []);
  }

  /// `Phone number`
  String get phone_hint {
    return Intl.message('Phone number', name: 'phone_hint', desc: '', args: []);
  }

  /// `City`
  String get city_hint {
    return Intl.message('City', name: 'city_hint', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirmation code`
  String get verify_subtitle {
    return Intl.message(
      'Enter your confirmation code',
      name: 'verify_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend code!`
  String get resend_code {
    return Intl.message(
      'Resend code!',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `You have an empty field`
  String get empty_field_message {
    return Intl.message(
      'You have an empty field',
      name: 'empty_field_message',
      desc: '',
      args: [],
    );
  }

  /// `Create a New Password`
  String get new_password_title {
    return Intl.message(
      'Create a New Password',
      name: 'new_password_title',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password_hint {
    return Intl.message(
      'New Password',
      name: 'new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_now {
    return Intl.message('Book Now', name: 'book_now', desc: '', args: []);
  }

  /// `Instructor`
  String get instructor_label {
    return Intl.message(
      'Instructor',
      name: 'instructor_label',
      desc: '',
      args: [],
    );
  }

  /// `Scholarship Subscription Request`
  String get subscribeRequest {
    return Intl.message(
      'Scholarship Subscription Request',
      name: 'subscribeRequest',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age_hint {
    return Intl.message('Age', name: 'age_hint', desc: '', args: []);
  }

  /// `College`
  String get college_hint {
    return Intl.message('College', name: 'college_hint', desc: '', args: []);
  }

  /// `Send Request Now`
  String get sendRequest {
    return Intl.message(
      'Send Request Now',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Courses`
  String get favorites_title {
    return Intl.message(
      'Favorite Courses',
      name: 'favorites_title',
      desc: '',
      args: [],
    );
  }

  /// `No favorite courses available`
  String get no_favorites {
    return Intl.message(
      'No favorite courses available',
      name: 'no_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request Now`
  String get submit_request {
    return Intl.message(
      'Submit Request Now',
      name: 'submit_request',
      desc: '',
      args: [],
    );
  }

  /// `Booking: August 1, 2025`
  String get booking_date {
    return Intl.message(
      'Booking: August 1, 2025',
      name: 'booking_date',
      desc: '',
      args: [],
    );
  }

  /// `Search for a scholarship`
  String get search_hint {
    return Intl.message(
      'Search for a scholarship',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications available`
  String get no_notification {
    return Intl.message(
      'No notifications available',
      name: 'no_notification',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get edit_password {
    return Intl.message(
      'Edit Password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Password`
  String get save_password {
    return Intl.message(
      'Save Password',
      name: 'save_password',
      desc: '',
      args: [],
    );
  }

  /// `Edited Successfully`
  String get edit_success {
    return Intl.message(
      'Edited Successfully',
      name: 'edit_success',
      desc: '',
      args: [],
    );
  }

  /// `Booking Successfully`
  String get Book_success {
    return Intl.message(
      'Booking Successfully',
      name: 'Book_success',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get edit_failed {
    return Intl.message('Failed', name: 'edit_failed', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Basic Information`
  String get basic_info {
    return Intl.message(
      'Basic Information',
      name: 'basic_info',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all data correctly`
  String get fill_all_data {
    return Intl.message(
      'Please fill in all data correctly',
      name: 'fill_all_data',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `The course has been completed with excellence`
  String get course_completed_with_excellence {
    return Intl.message(
      'The course has been completed with excellence',
      name: 'course_completed_with_excellence',
      desc: '',
      args: [],
    );
  }

  /// `The course has not been completed yet`
  String get course_not_completed_yet {
    return Intl.message(
      'The course has not been completed yet',
      name: 'course_not_completed_yet',
      desc: '',
      args: [],
    );
  }

  /// `Latest Courses:`
  String get latest_courses {
    return Intl.message(
      'Latest Courses:',
      name: 'latest_courses',
      desc: '',
      args: [],
    );
  }

  /// `Flutter App Development`
  String get flutter_app_development {
    return Intl.message(
      'Flutter App Development',
      name: 'flutter_app_development',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `How can we help you?!`
  String get how_can_we_help {
    return Intl.message(
      'How can we help you?!',
      name: 'how_can_we_help',
      desc: '',
      args: [],
    );
  }

  /// `We’ll get back to you within 24 hours!`
  String get reply_within_24_hours {
    return Intl.message(
      'We’ll get back to you within 24 hours!',
      name: 'reply_within_24_hours',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_phone {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your complaint`
  String get enter_complaint {
    return Intl.message(
      'Enter your complaint',
      name: 'enter_complaint',
      desc: '',
      args: [],
    );
  }

  /// `Send Complaint`
  String get send_complaint {
    return Intl.message(
      'Send Complaint',
      name: 'send_complaint',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message('My Account', name: 'my_account', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Current Courses`
  String get current_courses {
    return Intl.message(
      'Current Courses',
      name: 'current_courses',
      desc: '',
      args: [],
    );
  }

  /// `Completed Courses`
  String get completed_courses {
    return Intl.message(
      'Completed Courses',
      name: 'completed_courses',
      desc: '',
      args: [],
    );
  }

  /// `All Courses`
  String get all_courses {
    return Intl.message('All Courses', name: 'all_courses', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
