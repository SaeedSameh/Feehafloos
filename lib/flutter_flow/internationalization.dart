import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ATMmap
  {
    'j79tobxj': {
      'en': 'Search banks or ATMs...',
      'ar': 'ابحث عن ماكينات الصراف الآلي...',
    },
    'f41uiqkf': {
      'en': 'Search banks or ATMs...',
      'ar': 'ابحث عن ماكينات الصراف الآلي...',
    },
    'i30yyg1e': {
      'en': 'Banque Misr',
      'ar': 'بنك مصر',
    },
    'cm6hy29j': {
      'en': 'Banque du Caire',
      'ar': 'بنك القاهرة',
    },
    'hx4gznb9': {
      'en': 'National Bank of Egypt ( NBE )',
      'ar': 'البنك الأهلي المصري (NBE)',
    },
    'xun2hg2a': {
      'en': 'Commercial International Bank ( CIB )',
      'ar': 'البنك التجاري الدولي (CIB)',
    },
    'ruyk4een': {
      'en': 'QNB',
      'ar': 'بنك قطر الوطني',
    },
    'b6yc1pjz': {
      'en': 'Alexbank',
      'ar': 'بنك اسكندرية',
    },
    'p2wnfavy': {
      'en': 'Housing and Development Bank ( HDB )',
      'ar': 'بنك الإسكان و التعمير (HDB)',
    },
    'kov2yf26': {
      'en': 'Egyptian Gulf Bank (EG-BANK)',
      'ar': 'البنك الخليجي المصري (EG-BANK)',
    },
    'crsm0yut': {
      'en': 'Suez Canal Bank',
      'ar': 'بنك قناة السويس',
    },
    'sihjxcuz': {
      'en': 'The United Bank of Egypt',
      'ar': 'المصرف المتحد',
    },
    '2tm7bpaq': {
      'en': 'HSBC Egypt',
      'ar': 'بنك إتش إس بي سي مصر',
    },
    'raym42az': {
      'en': 'First Abu Dhabi Bank (FAB Misr)',
      'ar': 'بنك أبوظبي الأول (FAB مصر)',
    },
    '9fy73eu1': {
      'en': 'Emirates NBD',
      'ar': 'بنك الإمارات دبي الوطني',
    },
    '54zme5ia': {
      'en': 'Crédit Agricole Egypt',
      'ar': 'كريدي أجريكول مصر',
    },
    '7gbxjjnl': {
      'en': 'Arab International Bank (AIB)',
      'ar': 'المصرف العربي الدولي (AIB)',
    },
    '6mdyx8gb': {
      'en': 'Arab Bank Egypt',
      'ar': 'البنك العربي مصر',
    },
    '1ftkbqdq': {
      'en': 'National Bank of Kuwait (NBK)',
      'ar': 'البنك الوطني الكويتي (NBK)',
    },
    'xexlhhh7': {
      'en': 'Al Ahli Bank of Kuwait (ABK)',
      'ar': 'البنك الأهلي الكويتي (ABK)',
    },
    'tbatyjvy': {
      'en': 'Mashreq Bank',
      'ar': 'بنك المشرق',
    },
    'h4e0i4v7': {
      'en': 'Bank ABC',
      'ar': 'بنك ABC',
    },
    'sr83m9ph': {
      'en': 'Attijariwafa Bank Egypt',
      'ar': 'بنك التجاري وفا مصر',
    },
    'ywg5dkyo': {
      'en': 'Abu Dhabi Islamic Bank (ADIB Egypt)',
      'ar': 'مصرف أبو ظبي الإسلامي (ADIB مصر)',
    },
    'a7k0a1sh': {
      'en': 'Faisal Islamic Bank of Egypt',
      'ar': 'بنك فيصل الإسلامي بمصر',
    },
    'szu06s0b': {
      'en': 'Al Baraka Bank Egypt',
      'ar': 'بنك البركة مصر',
    },
    'jyx07vhp': {
      'en': 'KFH Egypt',
      'ar': 'بنك التمويل الكويتي',
    },
    '3kcbl7at': {
      'en': 'Agricultural Bank of Egypt (ABE)',
      'ar': 'البنك الزراعي المصري (ABE)',
    },
    't9eekwvb': {
      'en': 'MIDBANK',
      'ar': 'ميدبانك',
    },
    '63xmgfgw': {
      'en': 'saib Bank',
      'ar': 'بنك سايب',
    },
    'm5baodus': {
      'en': 'Arab African International ',
      'ar': 'البنك العربي الافريقي',
    },
    '0vdn47jc': {
      'en': 'Bank NXT',
      'ar': 'بنك نكست',
    },
  },
  // Search
  {
    '39hv85vr': {
      'en': 'Search banks or ATMs...',
      'ar': 'ابحث عن أجهزة الصراف الآلي...',
    },
    'ma97xoor': {
      'en': 'Search banks or ATMs...',
      'ar': 'ابحث عن أجهزة الصراف الآلي...',
    },
    'dwngq8kf': {
      'en': 'Banque Misr',
      'ar': 'بنك مصر',
    },
    'n14tgz7j': {
      'en': 'Banque du Caire',
      'ar': 'بنك القاهرة',
    },
    'zcupi7jp': {
      'en': 'National Bank of Egypt ( NBE )',
      'ar': 'البنك الأهلي المصري (NBE)',
    },
    'jqsc3nc0': {
      'en': 'Commercial International Bank ( CIB )',
      'ar': 'البنك التجاري الدولي (CIB)',
    },
    '8hd84vkg': {
      'en': 'QNB',
      'ar': 'بنك قطر الوطني',
    },
    'zz5eo3dh': {
      'en': 'Alexbank',
      'ar': 'بنك اسكندرية',
    },
    '6n767xpx': {
      'en': 'Housing and Development Bank ( HDB )',
      'ar': 'بنك الإسكان و التعمير (HDB)',
    },
    '2g2bjlcu': {
      'en': 'Egyptian Gulf Bank (EG-BANK)',
      'ar': 'البنك الخليجي المصري (EG-BANK)',
    },
    'xbu2wbzh': {
      'en': 'Suez Canal Bank',
      'ar': 'بنك قناة السويس',
    },
    '9rziaa1r': {
      'en': 'The United Bank of Egypt',
      'ar': 'المصرف المتحد',
    },
    '25298k3r': {
      'en': 'HSBC Egypt',
      'ar': 'بنك إتش إس بي سي مصر',
    },
    '9qoolaf1': {
      'en': 'First Abu Dhabi Bank (FAB Misr)',
      'ar': 'بنك أبوظبي الأول (FAB مصر)',
    },
    '2042uapb': {
      'en': 'Emirates NBD',
      'ar': 'بنك الإمارات دبي الوطني',
    },
    'ro2a1w6e': {
      'en': 'Crédit Agricole Egypt',
      'ar': 'كريدي أجريكول مصر',
    },
    'oyyxup88': {
      'en': 'Arab International Bank (AIB)',
      'ar': 'المصرف العربي الدولي (AIB)',
    },
    '78xrqdsr': {
      'en': 'Arab Bank Egypt',
      'ar': 'البنك العربي مصر',
    },
    'vu2d89pb': {
      'en': 'National Bank of Kuwait (NBK)',
      'ar': 'البنك الوطني الكويتي (NBK)',
    },
    'b4xc2lsk': {
      'en': 'Al Ahli Bank of Kuwait (ABK)',
      'ar': 'البنك الأهلي الكويتي (ABK)',
    },
    'wo0igow6': {
      'en': 'Mashreq Bank',
      'ar': 'بنك المشرق',
    },
    'ygjd1t52': {
      'en': 'Bank ABC',
      'ar': 'بنك ABC',
    },
    'hsx62hyi': {
      'en': 'Attijariwafa Bank Egypt',
      'ar': 'بنك التجاري وفا مصر',
    },
    'a31050u5': {
      'en': 'Abu Dhabi Islamic Bank (ADIB Egypt)',
      'ar': 'مصرف أبو ظبي الإسلامي (ADIB مصر)',
    },
    'tzt8eayd': {
      'en': 'Faisal Islamic Bank of Egypt',
      'ar': 'بنك فيصل الإسلامي بمصر',
    },
    'job116rt': {
      'en': 'Al Baraka Bank Egypt',
      'ar': 'بنك البركة مصر',
    },
    's1n5q95d': {
      'en': 'KFH Egypt',
      'ar': 'بنك التمويل الكويتي',
    },
    'qapli8qk': {
      'en': 'Agricultural Bank of Egypt (ABE)',
      'ar': 'البنك الزراعي المصري (ABE)',
    },
    '1luredlr': {
      'en': 'MIDBANK',
      'ar': 'ميدبانك',
    },
    'gkuqlne7': {
      'en': 'saib Bank',
      'ar': 'بنك سايب',
    },
    'pfdwwsd5': {
      'en': 'Arab African International ',
      'ar': 'البنك العربي الافريقي',
    },
    'hgxekq0a': {
      'en': 'Bank NXT',
      'ar': 'بنك نكست',
    },
    'cfso8usa': {
      'en': 'Popular Banks',
      'ar': 'اشهر البنوك',
    },
    '7k7ibdqx': {
      'en': 'All Banks',
      'ar': 'جميع البنوك',
    },
    'ticcmiy9': {
      'en': 'Banque Misr',
      'ar': 'بنك مصر',
    },
    '08f1klou': {
      'en': 'NBE',
      'ar': 'البنك الاهلي المصري',
    },
    'w7jyxp9s': {
      'en': 'CIB',
      'ar': 'البنك التجاري الدولي (CIB)',
    },
    '9bx8kbql': {
      'en': 'Banque du Caire',
      'ar': 'بنك القاهرة',
    },
    'hpkdt5o6': {
      'en': 'QNB',
      'ar': 'بنك قطر الوطني',
    },
    '22h9xuuw': {
      'en': 'Alexbank',
      'ar': 'بنك اسكندرية',
    },
    '3vey95ep': {
      'en': 'Recent Searches',
      'ar': 'اخر عمليات البحث',
    },
    'get4bk1m': {
      'en': 'Quick Find',
      'ar': 'البحث السريع',
    },
    'pg31p8za': {
      'en': 'ATMs Near Me',
      'ar': 'أجهزة الصراف الآلي القريبة مني',
    },
    'r2n6sncc': {
      'en': 'Cash Available',
      'ar': 'الماكينات اللي فيها فلوس',
    },
  },
  // NewScreen7
  {
    'fuujqc9g': {
      'en': 'Feha Floos',
      'ar': 'فيها فلوس',
    },
    '7nshhbsk': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
    },
    'l7ka2e51': {
      'en': 'Dark Mode',
      'ar': 'الوضع الداكن',
    },
    'gysz6ipx': {
      'en': 'Version 1.0.0',
      'ar': 'الإصدار 1.0.0',
    },
    'd6gp8ydn': {
      'en': 'Developed by Abo Asir',
      'ar': 'تم تطويره بواسطة أبو آسر',
    },
  },
  // ReportHistory
  {
    'i9wmio8c': {
      'en': 'Report History',
      'ar': 'سجل التقارير',
    },
    'ksvuxbj8': {
      'en': 'Total Reports',
      'ar': 'إجمالي التقارير',
    },
    'brrvdges': {
      'en': '85%',
      'ar': '85%',
    },
    'xf2mkise': {
      'en': 'Accuracy',
      'ar': 'الدقة',
    },
    '51cqy2mf': {
      'en': 'Live Reports',
      'ar': 'تقارير مباشرة',
    },
  },
  // TERMSCONDITIONS
  {
    'rip4lx30': {
      'en': 'TERMS & CONDITIONS',
      'ar': 'الشروط والأحكام',
    },
    'ov0214n9': {
      'en':
          'FEEHAFLOOS — TERMS & CONDITIONS\n\nThese Terms and Conditions (\"Terms\") constitute a binding agreement between the user and FeehaFloos. By downloading accessing or using the application you agree to comply with and be bound by these Terms.\n\n1. Description of Service\nFeehaFloos is a free informational utility application designed exclusively to display the geographical locations of ATMs on a map and provide crowdsourced information regarding cash availability.\n\n2. Crowdsourced Information and Reporting\nData Accuracy: The cash status and availability information displayed within the app are derived from community reports. While we aim to provide helpful indicators FeehaFloos does not guarantee warrant or represent the real-time cash availability operational status or safety of any physical ATM.\n\nATM Relocation and Removal: The application map displays ATM locations based on available data and user reports. Physical ATMs may be removed relocated or temporarily out of service by their respective operating banks without prior notice. Users are encouraged to utilize the in-app reporting feature to notify us if an ATM is no longer present. FeehaFloos assumes no liability for travel expenses lost time or inconvenience resulting from navigating to an ATM that is no longer present at the indicated location.\n\nUser Responsibility: Users agree to submit truthful indicators regarding whether an ATM has cash is out of service or has been removed from its location. Any deliberate attempt to disrupt the platform with false information may result in your device being restricted from making future reports.\n\n3. Complete Financial Disclaimer\nFeehaFloos is strictly an informational map guide. We are not a bank financial institution or an ATM operator. We accept absolutely no liability for any banking fees card retention transaction failures financial losses or inconvenience experienced at any third-party physical ATM machine.\n\n4. Limitation of Liability\nTo the maximum extent permitted by applicable law FeehaFloos and its developers shall not be liable for any direct indirect incidental or consequential damages resulting from your use of the application including your reliance on any map locations or ATM status reports displayed within the service.\n\n5. Governing Law\nThese Terms are governed by and construed in accordance with the laws of the jurisdiction in which the application is officially distributed.',
      'ar':
          'شروط وأحكام فيها فلووس\n\nتُشكّل هذه الشروط والأحكام (\"الشروط\") اتفاقية ملزمة بين المستخدم وفيها فلووس. بتحميل التطبيق أو الوصول إليه أو استخدامه، فإنك توافق على الالتزام بهذه الشروط.\n\n1. وصف الخدمة\nفيها فلووس هو تطبيق مجاني لعرض معلومات حول مواقع أجهزة الصراف الآلي على الخريطة، وتوفير معلومات مُجمّعة من المستخدمين حول توافر النقد.\n\n2. المعلومات والتقارير المُجمّعة من المستخدمين\nدقة البيانات: تُستمد معلومات حالة النقد وتوافره المعروضة في التطبيق من تقارير المستخدمين. مع أننا نسعى جاهدين لتوفير مؤشرات مفيدة، إلا أن فيها فلووس لا تضمن أو تُؤكد توافر النقد في الوقت الفعلي، أو حالة التشغيل، أو سلامة أي جهاز صراف آلي.\n\nنقل وإزالة أجهزة الصراف الآلي: تعرض خريطة التطبيق مواقع أجهزة الصراف الآلي بناءً على البيانات المتاحة وتقارير المستخدمين. قد تقوم البنوك المُشغّلة بإزالة أجهزة الصراف الآلي أو نقلها أو إيقافها مؤقتًا عن الخدمة دون إشعار مُسبق. نشجع المستخدمين على استخدام خاصية الإبلاغ داخل التطبيق لإعلامنا في حال عدم وجود جهاز صراف آلي. لا تتحمل FeehaFloos أي مسؤولية عن نفقات السفر أو الوقت الضائع أو أي إزعاج ناتج عن محاولة الوصول إلى جهاز صراف آلي غير موجود في الموقع المحدد.\n\nمسؤولية المستخدم: يوافق المستخدمون على تقديم معلومات صحيحة حول ما إذا كان جهاز الصراف الآلي يحتوي على نقود، أو خارج الخدمة، أو تم نقله من موقعه. أي محاولة متعمدة لتعطيل المنصة بمعلومات خاطئة قد تؤدي إلى تقييد جهازك ومنعه من إرسال التقارير مستقبلاً.\n\n3. إخلاء المسؤولية المالية الكامل\nFeehaFloos هو دليل خرائط إرشادي فقط. نحن لسنا مؤسسة مالية مصرفية أو مشغلًا لأجهزة الصراف الآلي. لا نتحمل أي مسؤولية عن أي رسوم مصرفية، أو احتجاز للبطاقات، أو فشل في المعاملات، أو خسائر مالية، أو أي إزعاج قد يواجهه المستخدم عند استخدام أي جهاز صراف آلي تابع لجهة خارجية.\n\n\n٤. تحديد المسؤولية\nإلى أقصى حد يسمح به القانون المعمول به، لا تتحمل FeehaFloos ومطوروها أي مسؤولية عن أي أضرار مباشرة أو غير مباشرة أو عرضية أو تبعية ناتجة عن استخدامك للتطبيق، بما في ذلك اعتمادك على أي مواقع على الخريطة أو تقارير حالة أجهزة الصراف الآلي المعروضة ضمن الخدمة.\n\n٥. القانون الحاكم\nتخضع هذه الشروط وتُفسر وفقًا لقوانين الولاية القضائية التي يُوزع فيها التطبيق رسميًا.',
    },
    'uieoji9a': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PrivacyPolicy
  {
    'ww373oks': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'rybfdbvg': {
      'en':
          'FEEHAFLOOS — PRIVACY POLICY\n\nWelcome to FeehaFloos (\"we,\" \"our,\" or \"us\"). We are committed to maintaining the highest standards of privacy and data protection. This Privacy Policy outlines our practices regarding data privacy and explains that our application is designed to function without collecting your personal or financial information.\n\n1. No Personal or Financial Data Collection\nFeehaFloos strictly operates as a utility application.\n\nNo User Accounts: You are not required to register, create a profile, or provide any personal identification (such as your name, email address, or phone number) to use the application.\n\nNo Financial Transactions: The application does not handle, process, or request any financial information, credit card details, bank account numbers, or digital payments. The app is completely free of financial transactions.\n\n2. Location Access (The Only Permission Requested)\nThe only permission FeehaFloos requests from your device is access to your precise geographic location (GPS data).\n\nPurpose: This access is strictly necessary to calculate your current position and display nearby Automated Teller Machines (ATMs) on the map interface.\n\nNo Storage: Your location data is processed locally on your device in real-time to render the map view (integrated via third-party mapping providers like Mapbox). Your geographic coordinates are never stored, tracked, or saved on any external servers.\n\n3. Third-Party Mapping Services\nTo display ATMs on the map, the application utilizes reliable third-party mapping APIs. These services receive temporary location requests solely to provide accurate directional map data and do not have access to any identifiable user information.\naction failures, financial losses, or inconvenience experienced at any third-party physical ATM machine.\n\n4. Limitation of Liability\nTo the maximum extent permitted by applicable law, FeehaFloos and its developers shall not be liable for any direct, indirect, incidental, or consequential damages resulting from your use of the application, including your reliance on any map locations or ATM status reports displayed within the service.\n\n5. Governing Law\nThese Terms are governed by and construed in accordance with the laws of the jurisdiction in which the application is officially distributed.',
      'ar':
          'سياسة خصوصية فيها فلووس\n\nمرحباً بكم في فيها فلووس (\"نحن\" أو \"لنا\"). نلتزم بأعلى معايير الخصوصية وحماية البيانات. توضح سياسة الخصوصية هذه ممارساتنا المتعلقة بخصوصية البيانات، وتؤكد أن تطبيقنا مصمم للعمل دون جمع أي معلومات شخصية أو مالية.\n\n1. عدم جمع البيانات الشخصية أو المالية\nيعمل فيها فلووس كتطبيق خدمات فقط.\n\n\nلا حاجة لحسابات المستخدمين: لا يُطلب منك التسجيل أو إنشاء ملف تعريف أو تقديم أي معلومات تعريفية شخصية (مثل اسمك أو بريدك الإلكتروني أو رقم هاتفك) لاستخدام التطبيق.\n\n\nلا معاملات مالية: لا يتعامل التطبيق مع أي معلومات مالية أو تفاصيل بطاقات ائتمان أو أرقام حسابات بنكية أو مدفوعات رقمية، ولا يطلبها. التطبيق خالٍ تماماً من المعاملات المالية.\n\n\n2. الوصول إلى الموقع (الإذن الوحيد المطلوب)\nالإذن الوحيد الذي يطلبه فيها فلووس من جهازك هو الوصول إلى موقعك الجغرافي الدقيق (بيانات نظام تحديد المواقع العالمي GPS).\n\n\nالغرض: هذا الوصول ضروري لحساب موقعك الحالي وعرض أجهزة الصراف الآلي القريبة على واجهة الخريطة.\n\nلا تخزين: تتم معالجة بيانات موقعك محليًا على جهازك في الوقت الفعلي لعرض الخريطة (مدمجة عبر مزودي خدمات خرائط خارجيين مثل Mapbox). لا يتم تخزين إحداثياتك الجغرافية أو تتبعها أو حفظها على أي خوادم خارجية.\n\n3. خدمات الخرائط الخارجية\nلعرض أجهزة الصراف الآلي على الخريطة، يستخدم التطبيق واجهات برمجة تطبيقات خرائط خارجية موثوقة. تتلقى هذه الخدمات طلبات موقع مؤقتة فقط لتوفير بيانات خرائط اتجاهية دقيقة، ولا يمكنها الوصول إلى أي معلومات تعريفية للمستخدم.\n\nلا يتحمل التطبيق مسؤولية أي أعطال أو خسائر مالية أو أي إزعاج قد تواجهه في أي جهاز صراف آلي تابع لجهة خارجية.\n\n\n٤. تحديد المسؤولية\nإلى أقصى حد يسمح به القانون المعمول به، لا تتحمل FeehaFloos ومطوروها أي مسؤولية عن أي أضرار مباشرة أو غير مباشرة أو عرضية أو تبعية ناتجة عن استخدامك للتطبيق، بما في ذلك اعتمادك على أي مواقع على الخريطة أو تقارير حالة أجهزة الصراف الآلي المعروضة ضمن الخدمة.\n\n٥. القانون الحاكم\nتخضع هذه الشروط وتُفسر وفقًا لقوانين الولاية القضائية التي يُوزع فيها التطبيق رسميًا.',
    },
    'dbxjqldf': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Howitwork
  {
    '1rccf3w3': {
      'en': 'How it Work',
      'ar': 'كيف يعمل؟',
    },
    'vbff4cjj': {
      'en':
          '(How FeehaFloos Works)\n1 Search for Your Bank\nAs soon as you open the app you can search directly by your bank name to display all its available ATMs The app also saves your recent search history so you can access your favorite banks later with a single tap\n\n2 Find Nearby and Cash-Ready ATMs\nThe interactive map will pinpoint your location and display all ATMs around you You can easily use our smart filter to display only the ATMs that currently have cash to save your time and effort\n\n3 Update ATM Status and Help Others\nWhen you visit any ATM you can share your experience with the community and update its status instantly whether it contains cash is completely empty or out of service\n\n4 Follow Real-Time Reports and Updates\nYou can track live reports and status updates submitted by other users for every ATM in real time to check cash availability before making your trip\n\n5 Report Missing or Removed ATMs\nIf you navigate to an ATM location and find it missing or completely removed you can submit an instant report to help us update the map and delete incorrect locations for everyone benefit',
      'ar':
          '(كيف يعمل تطبيق FeehaFloos)\n1. ابحث عن بنكك\nبمجرد فتح التطبيق، يمكنك البحث مباشرةً باسم بنكك لعرض جميع أجهزة الصراف الآلي المتاحة. كما يحفظ التطبيق سجل عمليات البحث الأخيرة لتتمكن من الوصول إلى بنوكك المفضلة لاحقًا بنقرة واحدة.\n\n2. اعثر على أجهزة الصراف الآلي القريبة والجاهزة للسحب النقدي\nستحدد الخريطة التفاعلية موقعك وتعرض جميع أجهزة الصراف الآلي من حولك. يمكنك بسهولة استخدام فلترنا الذكي لعرض أجهزة الصراف الآلي التي تحتوي على نقود فقط لتوفير وقتك وجهدك.\n\n3. حدّث حالة أجهزة الصراف الآلي وساعد الآخرين\nعند زيارتك لأي جهاز صراف آلي، يمكنك مشاركة تجربتك مع المجتمع وتحديث حالته فورًا، سواء كان يحتوي على نقود، أو فارغًا تمامًا، أو خارج الخدمة.\n\n4. تابع التقارير والتحديثات الفورية\nيمكنك متابعة التقارير المباشرة وتحديثات الحالة التي يرسلها المستخدمون الآخرون لكل جهاز صراف آلي في الوقت الفعلي للتحقق من توفر النقود قبل الذهاب.\n\n5. أبلغ عن أجهزة الصراف الآلي المفقودة أو التي تمت إزالتها\nإذا توجهت إلى موقع جهاز صراف آلي ووجدته مفقودًا أو تمت إزالته بالكامل، يمكنك إرسال تقرير فوري لمساعدتنا في تحديث الخريطة وحذف المواقع غير الصحيحة لصالح الجميع.',
    },
    'm8u70g7v': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ReportAtm
  {
    'klo2r9xs': {
      'en': 'Report an Atm',
      'ar': 'أبلغ عن ماكينة صراف آلي',
    },
    'ui7jqp3b': {
      'en':
          'If you navigate to an ATM location and find it missing or completely removed or if you notice a new ATM that is not yet visible on our map you can report it instantly by sending an email to our support address Please provide the bank name and the exact location to help us update the data for everyone benefit\nfeehafloos@gmail.com',
      'ar':
          'إذا توجهت إلى موقع جهاز صراف آلي ووجدته مفقودًا أو تمت إزالته بالكامل، أو إذا لاحظت جهاز صراف آلي جديدًا غير ظاهر على خريطتنا، يمكنك الإبلاغ عنه فورًا عبر إرسال بريد إلكتروني إلى عنوان الدعم لدينا. يُرجى تزويدنا باسم البنك والموقع الدقيق لمساعدتنا في تحديث البيانات ليستفيد منها الجميع.\nfeehafloos@gmail.com',
    },
    'rb2eifvs': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Contactus
  {
    'ekh49g7e': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'q8e5d5vn': {
      'en':
          'We always love to hear your feedback and improve your experience If you have any suggestions to enhance the app or any inquiries you would like to share with us please feel free to reach out to us directly via email and our team will get back to you as soon as possible\nfeehafloos@gmail.com',
      'ar':
          'يسعدنا دائمًا تلقي ملاحظاتكم وتحسين تجربتكم. إذا كانت لديكم أي اقتراحات لتطوير التطبيق أو أي استفسارات ترغبون في مشاركتها معنا، فلا تترددوا في التواصل معنا مباشرةً عبر البريد الإلكتروني، وسيقوم فريقنا بالرد عليكم في أقرب وقت ممكن.\nfeehafloos@gmail.com',
    },
    'w7orabec': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Button2
  {
    '34zl558c': {
      'en': 'Get Directions',
      'ar': 'احصل على الاتجاهات',
    },
  },
  // AtmDetailsSheet
  {
    'nf8pwbvo': {
      'en': 'Updated',
      'ar': 'تم التحديث',
    },
    '42qau9ic': {
      'en': 'Has Cash',
      'ar': 'فيها فلوس',
    },
    'wr3lxkho': {
      'en': 'Empty',
      'ar': 'فاضية',
    },
    '7r3ia72c': {
      'en': 'Broken',
      'ar': 'عطلانة',
    },
  },
  // filterstatuesheet
  {
    'fy5dyyd5': {
      'en': 'Filter by Status',
      'ar': 'تصفية حسب الحالة',
    },
    'gcqtjbv5': {
      'en': 'Show ATMs based on their current reported state',
      'ar': 'عرض أجهزة الصراف الآلي بناءً على حالتها المُبلغ عنها حاليًا',
    },
    'dw9dnthc': {
      'en': 'Has Cash',
      'ar': 'فيها فلوس',
    },
    'ttwukjzy': {
      'en': 'Empty',
      'ar': 'فاضية',
    },
    'tseczqb1': {
      'en': 'Broken',
      'ar': 'عطلانة',
    },
    'o6ok2e22': {
      'en': 'Show All ATMs',
      'ar': 'عرض الجميع',
    },
  },
  // noreport
  {
    'rvmk1cp8': {
      'en': 'There are no reports at the moment.',
      'ar': 'لا توجد تقارير في الوقت الحالي.',
    },
  },
  // Loading
  {
    'bexmpi3p': {
      'en': 'Loading',
      'ar': 'جاري التحميل',
    },
    'h0wh57c2': {
      'en': 'Hello World',
      'ar': '',
    },
  },
  // Drawer
  {
    '88lc8cup': {
      'en': 'App Language',
      'ar': 'لغة التطبيق',
    },
    'jxw5ptd9': {
      'en': 'Dark Mode',
      'ar': 'الوضع الداكن',
    },
    'xa7wwswi': {
      'en': 'Report an ATM',
      'ar': 'الإبلاغ عن ماكينة صراف آلي',
    },
    'xfm8au2a': {
      'en': 'How it works',
      'ar': 'كيف يعمل؟',
    },
    'ru5um2n8': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'bvkp1ame': {
      'en': 'Legal',
      'ar': 'قانوني',
    },
    'psh7wflv': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    '1pu1y1ib': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    't8c36fln': {
      'en': 'Version',
      'ar': 'إصدار',
    },
    'z8okwjjn': {
      'en': 'Developed by Abo Asir',
      'ar': 'تم تطويره بواسطة أبو آسر',
    },
  },
  // Update
  {
    'fnxynzy8': {
      'en': 'Update Required',
      'ar': 'هناك اصدار جديد متوفر',
    },
    'r592pb15': {
      'en':
          'A new version of FeehaFloos is available. Please update now to continue locating ATMs and enjoy new features.',
      'ar':
          'يتوفر إصدار جديد من تطبيق FeehaFloos. يرجى التحديث الآن لمواصلة تحديد مواقع أجهزة الصراف الآلي والاستمتاع بالميزات الجديدة.',
    },
  },
  // Miscellaneous
  {
    '9r9jurxv': {
      'en': 'We need to access your location to show you nearby ATMs',
      'ar': 'نحتاج إلى الوصول إلى موقعك لعرض أجهزة الصراف الآلي القريبة منك',
    },
    '4rpr7j8e': {
      'en': 'We need  your permissions  to access to show you nearby ATMs',
      'ar': 'نحتاج موافقتك على الاذن للسماح لنا',
    },
    'ykxcorhj': {
      'en':
          'This permission is required to deliver personalized ads via AdMob.',
      'ar': '',
    },
    '76ekcjbd': {
      'en': '',
      'ar': '',
    },
    'g0s8y84e': {
      'en': '',
      'ar': '',
    },
    's1fl456p': {
      'en': '',
      'ar': '',
    },
    'v8uhn8bh': {
      'en': '',
      'ar': '',
    },
    'zaaz7kp8': {
      'en': '',
      'ar': '',
    },
    '1sjqbu9u': {
      'en': '',
      'ar': '',
    },
    'b4bbbcgx': {
      'en': '',
      'ar': '',
    },
    '3ydkbuz3': {
      'en': '',
      'ar': '',
    },
    'l3s1rgtm': {
      'en': '',
      'ar': '',
    },
    'sss88jcm': {
      'en': '',
      'ar': '',
    },
    'q0dq5ndh': {
      'en': '',
      'ar': '',
    },
    '4yzwdvon': {
      'en': '',
      'ar': '',
    },
    'fnk0lyu2': {
      'en': '',
      'ar': '',
    },
    'kvllidq6': {
      'en': '',
      'ar': '',
    },
    '0tfbxg0e': {
      'en': '',
      'ar': '',
    },
    'nof8ar18': {
      'en': '',
      'ar': '',
    },
    'cm52ci6h': {
      'en': '',
      'ar': '',
    },
    '9963980p': {
      'en': '',
      'ar': '',
    },
    'v340323m': {
      'en': '',
      'ar': '',
    },
    'nr1gtcsr': {
      'en': '',
      'ar': '',
    },
    'y3mftvg7': {
      'en': '',
      'ar': '',
    },
    '43r2v1ol': {
      'en': '',
      'ar': '',
    },
    'pwnxnvxg': {
      'en': '',
      'ar': '',
    },
    'rggkfqmp': {
      'en': '',
      'ar': '',
    },
    'n2c1gh4b': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
