import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:country_code_picker_plus/src/country_code_picker_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/auth/data/models/my_countries_codes.dart';

enum CountryCodePickerMode { dialog, dropdown, bottomSheet }

class CountryPicker extends StatefulWidget {
  final ValueChanged<MyCountry>? onChanged;
  final ValueChanged<MyCountry?>? onInit;
  final String? initialSelection;
  final List<String> favorite;
  final TextStyle? textStyle;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? dialogTextStyle;
  final WidgetBuilder? emptySearchBuilder;
  final Function(MyCountry?)? builder;
  final bool enabled;
  final TextOverflow textOverflow;
  final Icon closeIcon;
  final EdgeInsetsGeometry? padding;
  final Decoration? flagDecoration;

  /// Barrier color of ModalBottomSheet
  final Color? barrierColor;

  /// Background color of ModalBottomSheet
  final Color? backgroundColor;

  /// BoxDecoration for dialog
  final BoxDecoration? boxDecoration;

  /// the size of the selection dialog
  final Size? dialogSize;

  /// Background color of selection dialog
  final Color? dialogBackgroundColor;

  /// used to customize the country list
  final List<String>? countryFilter;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially useful in combination with [showOnlyCountryWhenClosed],
  /// because longer country names are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  final bool hideMainText;

  final bool? showFlagMain;

  final bool? showFlagDialog;

  /// Width of the flag images
  final double flagWidth;

  /// Use this property to change the order of the options
  final Comparator<MyCountry>? comparator;

  /// Set to true if you want to hide the search part
  final bool hideSearch;

  /// Set to true if you want to hide the close icon dialog
  final bool hideCloseIcon;

  /// Set to true if you want to show drop down button
  final bool showDropDownButton;

  /// [BoxDecoration] for the flag image

  /// An optional argument for injecting a list of countries
  /// with customized codes.
  final List<Map<String, String>> countryList;

  final EdgeInsetsGeometry dialogItemPadding;

  final EdgeInsetsGeometry searchPadding;
  final CountryCodePickerMode mode;

  /// The widget to use for the drop-down button's icon.
  ///
  /// Defaults to an [Icon] with the [Icons.arrow_drop_down] glyph.
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double? iconSize;

  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final EdgeInsets? insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;

  const CountryPicker({
    this.onChanged,
    this.onInit,
    this.initialSelection = 'LY',
    this.favorite = const [],
    this.textStyle,
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.builder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.barrierColor,
    this.backgroundColor,
    this.boxDecoration,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.hideCloseIcon = false,
    this.showDropDownButton = true,
    this.dialogSize,
    this.dialogBackgroundColor,
    this.closeIcon = const Icon(Icons.close),
    this.countryList = myCountriesCodes,
    this.dialogItemPadding =
    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.searchPadding = const EdgeInsets.symmetric(horizontal: 24),
    super.key,
    this.mode = CountryCodePickerMode.dialog,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.insetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment, this.padding, this.flagDecoration
  });

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    List<Map<String, String>> jsonList = countryList;

    List<MyCountry> elements =
    jsonList.map((json) => MyCountry.fromJson(json)).toList();

    if (comparator != null) {
      elements.sort(comparator);
    }

    if (countryFilter != null && countryFilter!.isNotEmpty) {
      final uppercaseCustomList =
      countryFilter!.map((criteria) => criteria.toUpperCase()).toList();
      elements = elements
          .where((criteria) =>
      uppercaseCustomList.contains(criteria.code) ||
          uppercaseCustomList.contains(criteria.name) ||
          uppercaseCustomList.contains(criteria.dialCode))
          .toList();
    }

    return CountryPickerState(elements);
  }
}

class CountryPickerState extends State<CountryPicker> {
  MyCountry? selectedItem;
  List<MyCountry> elements = [];
  List<MyCountry> favoriteElements = [];
  late List<MyCountry> localizedElements;

  CountryPickerState(this.elements);

  @override
  Widget build(BuildContext context) {
    Widget internalWidget;

    if (widget.mode == CountryCodePickerMode.dropdown) {
      return DropdownButtonHideUnderline(
          child: DropdownButton<MyCountry>(
              iconSize:
              widget.showDropDownButton ? (widget.iconSize ?? 24.0) : 0.0,
              value: selectedItem,
              style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
              icon: widget.icon,
              iconEnabledColor: widget.iconEnabledColor,
              iconDisabledColor: widget.iconDisabledColor,
              items: elements
                  .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                      padding: widget.padding ?? EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 10.w
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.showFlag)
                              Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  decoration: widget.flagDecoration,
                                  clipBehavior:
                                  widget.flagDecoration == null
                                      ? Clip.none
                                      : Clip.hardEdge,
                                  child: Image.asset(e.flagUri,
                                      package: 'country_code_picker_plus',
                                      width: widget.flagWidth)),
                            Text(e.toString(),
                                style: widget.textStyle ??
                                    Theme.of(context).textTheme.labelLarge)
                          ]))))
                  .toList(),
              onChanged: widget.enabled
                  ? (MyCountry? value) {
                selectedItem = value;
                if (selectedItem != null) {
                  _publishSelection(selectedItem!);
                }
              }
                  : null));
    }

    if (widget.builder != null) {
      internalWidget = InkWell(
          onTap: widget.enabled ? showCountryCodePickerDialog : null,
          child: widget.builder!(selectedItem));
    } else {
      internalWidget = InkWell(
          onTap: widget.enabled ? showCountryCodePickerDialog : null,
          child: Padding(
              padding: widget.padding ?? EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 10.w
              ),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.grey0,
                      borderRadius: BorderRadius.circular(5.r)),
                  padding: EdgeInsets.all(5.sp),
                  child: Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10.w,
                      children: [
                        if (!widget.hideMainText)
                          Flexible(
                              fit: widget.alignLeft
                                  ? FlexFit.tight
                                  : FlexFit.loose,
                              child: Text(
                                  widget.showOnlyCountryWhenClosed
                                      ? selectedItem!.toMyCountryStringOnly()
                                      : selectedItem.toString(),
                                  style: widget.textStyle ??
                                      Theme.of(context).textTheme.labelLarge,
                                  overflow: widget.textOverflow)),
                        if (widget.showFlagMain != null
                            ? widget.showFlagMain!
                            : widget.showFlag)
                          Flexible(
                              flex: widget.alignLeft ? 0 : 1,
                              fit: widget.alignLeft
                                  ? FlexFit.tight
                                  : FlexFit.loose,
                              child: Container(
                                  clipBehavior: widget.flagDecoration == null
                                      ? Clip.none
                                      : Clip.hardEdge,
                                  decoration: widget.flagDecoration,
                                  child: Image.asset(selectedItem!.flagUri,
                                      package: 'country_code_picker_plus',
                                      width: widget.flagWidth)))
                      ]))));
    }
    return internalWidget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateLocalizedList();
    _onInit(selectedItem as MyCountry);
  }

  void _updateLocalizedList() {
    final locale = Localizations.localeOf(context);
    for (var country in elements) {
      country.name =
      locale.languageCode == "ar" ? country.arName : country.name;
    }
  }

  @override
  void didUpdateWidget(CountryPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
                (criteria) =>
            (criteria.code.toUpperCase() ==
                widget.initialSelection!.toUpperCase()) ||
                (criteria.dialCode == widget.initialSelection) ||
                (criteria.name.toUpperCase() ==
                    widget.initialSelection!.toUpperCase()),
            orElse: () => elements[0]);
      } else {
        selectedItem = elements[0];
      }
      _onInit(selectedItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (item) =>
          (item.code.toUpperCase() ==
              widget.initialSelection!.toUpperCase()) ||
              (item.dialCode == widget.initialSelection) ||
              (item.name.toUpperCase() ==
                  widget.initialSelection!.toUpperCase()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((item) =>
    widget.favorite.firstWhereOrNull((criteria) =>
    item.code.toUpperCase() == criteria.toUpperCase() ||
        item.dialCode == criteria ||
        item.name.toUpperCase() == criteria.toUpperCase()) !=
        null)
        .toList();
  }

  Future<dynamic> _showCountryCodeBottomSheet() async {
    return await showModalBottomSheet(
        context: context,
        backgroundColor: widget.backgroundColor,
        elevation: widget.elevation,
        shape: widget.shape,
        clipBehavior: widget.clipBehavior,
        builder: (BuildContext context) {
          bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
          return CountryCodePickerDialog(
              elements
                  .map((c) => Country(
                  flagUri: c.flagUri,
                  dialCode: c.dialCode,
                  code: c.code,
                  name: isArabic ? c.arName : c.name))
                  .toList(),
              favoriteElements
                  .map((c) => Country(
                  flagUri: c.flagUri,
                  dialCode: c.dialCode,
                  code: c.code,
                  name: isArabic ? c.arName : c.name))
                  .toList(),
              showCountryOnly: widget.showCountryOnly,
              emptySearchBuilder: widget.emptySearchBuilder,
              searchDecoration: widget.searchDecoration,
              searchStyle: widget.searchStyle,
              textStyle: widget.dialogTextStyle,
              boxDecoration: widget.boxDecoration,
              showFlag: widget.showFlagDialog ?? widget.showFlag,
              flagWidth: widget.flagWidth,
              size: widget.dialogSize,
              backgroundColor: widget.dialogBackgroundColor,
              barrierColor: widget.barrierColor,
              hideSearch: widget.hideSearch,
              hideCloseIcon: widget.hideCloseIcon,
              closeIcon: widget.closeIcon,
              flagDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
              dialogItemPadding: widget.dialogItemPadding,
              searchPadding: widget.searchPadding);
        });
  }

  Future<dynamic> _showCountryCodeDialog() async {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return await showDialog(
        barrierColor: widget.barrierColor ?? Colors.grey.withValues(alpha: 0.5),
        context: context,
        builder: (context) => Center(
            child: Dialog(
                elevation: widget.elevation,
                shadowColor: widget.shadowColor,
                surfaceTintColor: widget.surfaceTintColor,
                insetAnimationDuration: widget.insetAnimationDuration,
                insetAnimationCurve: widget.insetAnimationCurve,
                insetPadding: widget.insetPadding,
                clipBehavior: widget.clipBehavior,
                shape: widget.shape,
                alignment: widget.alignment,
                child: CountryCodePickerDialog(
                    elements
                        .map((c) => Country(
                        flagUri: c.flagUri,
                        dialCode: c.dialCode,
                        code: c.code,
                        name: isArabic ? c.arName : c.name))
                        .toList(),
                    favoriteElements
                        .map((c) => Country(
                        flagUri: c.flagUri,
                        dialCode: c.dialCode,
                        code: c.code,
                        name: isArabic ? c.arName : c.name))
                        .toList(),
                    showCountryOnly: widget.showCountryOnly,
                    emptySearchBuilder: widget.emptySearchBuilder,
                    searchDecoration: widget.searchDecoration,
                    searchStyle: widget.searchStyle,
                    textStyle: widget.dialogTextStyle,
                    boxDecoration: widget.boxDecoration,
                    showFlag: widget.showFlagDialog ?? widget.showFlag,
                    flagWidth: widget.flagWidth,
                    size: widget.dialogSize,
                    backgroundColor: widget.dialogBackgroundColor,
                    barrierColor: widget.barrierColor,
                    hideSearch: widget.hideSearch,
                    hideCloseIcon: widget.hideCloseIcon,
                    closeIcon: widget.closeIcon,
                    flagDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
                    dialogItemPadding: widget.dialogItemPadding,
                    searchPadding: widget.searchPadding))));
  }

  void showCountryCodePickerDialog() async {
    dynamic item;
    switch (widget.mode) {
      case CountryCodePickerMode.dialog:
        item = await _showCountryCodeDialog();
        break;

      case CountryCodePickerMode.bottomSheet:
        item = await _showCountryCodeBottomSheet();
        break;
      case CountryCodePickerMode.dropdown:
        break;
    }
    if (item != null) {
      setState(() {
        selectedItem = MyCountry(
            code: item.code,
            name: item.name,
            arName: item.name,
            flagUri: item.flagUri,
            dialCode: item.dialCode);
      });

      _publishSelection(MyCountry(
          code: item.code,
          name: item.name,
          arName: item.name,
          flagUri: item.flagUri,
          dialCode: item.dialCode));
    }
  }

  void _publishSelection(MyCountry countryCode) {
    if (widget.onChanged != null) {
      widget.onChanged!(countryCode);
    }
  }

  void _onInit(MyCountry? countryCode) {
    if (widget.onInit != null) {
      widget.onInit!(countryCode);
    }
  }
}

class MyCountry {
  String name;
  final String arName;
  final String flagUri;
  final String code;
  final String dialCode;

  MyCountry(
      {this.name = "",
        this.arName = "",
        this.code = "",
        this.flagUri = "",
        this.dialCode = ""});

  @override
  String toString() => dialCode;

  String toLongString() => "$dialCode ${toMyCountryStringOnly()}";

  String toMyCountryStringOnly() {
    return _cleanName;
  }

  String get _cleanName {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.languageCode == "ar" ? arName : name;
  }

  factory MyCountry.fromJson(Map<String, dynamic> json) {
    return MyCountry(
        name: json['en_short_name'] ?? "",
        arName: json['ar_short_name'] ?? "",
        code: json['alpha_2_code'] ?? "",
        dialCode: json['dial_code'] ?? "",
        flagUri: 'assets/flags/${json['alpha_2_code'].toLowerCase()}.png');
  }

  MyCountry copyWith(
      {String? code,
        String? name,
        String? arName,
        String? dialCode,
        String? flagUri}) {
    return MyCountry(
        code: code ?? this.code,
        name: name ?? this.name,
        arName: arName ?? this.arName,
        dialCode: dialCode ?? this.dialCode,
        flagUri: flagUri ?? this.flagUri);
  }
}