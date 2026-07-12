import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:google_mobile_ads/google_mobile_ads.dart';

// Learn more about displaying interstitial ads:
// https://developers.google.com/admob/flutter/interstitial

// While true, Google's official test interstitial ad is shown instead of
// your real ad. Set to false before publishing a real release build.
const bool kShowTestInterstitialAds = false;

InterstitialAd? _interstitialAd;
String? _loadingInterstitialAdUnitId;
String? _lastInterstitialIosAdUnitId;
String? _lastInterstitialAndroidAdUnitId;
bool _lastInterstitialShowTestAds = false;

void loadInterstitialAd(
  String iosAdUnitId,
  String androidAdUnitId,
  bool showTestAds,
) {
  if (kIsWeb) {
    print('AdMob is not supported on web.');
    return;
  }
  _lastInterstitialIosAdUnitId = iosAdUnitId;
  _lastInterstitialAndroidAdUnitId = androidAdUnitId;
  _lastInterstitialShowTestAds = showTestAds;
  String adUnitId;
  if (Platform.isIOS) {
    adUnitId =
        showTestAds ? 'ca-app-pub-3940256099942544/4411468910' : iosAdUnitId;
  } else if (Platform.isAndroid) {
    adUnitId = showTestAds
        ? 'ca-app-pub-3940256099942544/1033173712'
        : androidAdUnitId;
  } else {
    print("AdMob is not supported on this platform.");
    return;
  }

  if (adUnitId == _loadingInterstitialAdUnitId) {
    // Already loading the same ad.
    return;
  }
  if (adUnitId == _interstitialAd?.adUnitId) {
    // The ad is already loaded.
    return;
  }
  _loadingInterstitialAdUnitId = adUnitId;

  InterstitialAd.load(
    adUnitId: adUnitId,
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        if (adUnitId == _loadingInterstitialAdUnitId) {
          _interstitialAd = ad;
          _loadingInterstitialAdUnitId = null;
        }
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('Interstitial ad failed to load: $error');
        _loadingInterstitialAdUnitId = null;
      },
    ),
  );
}

Future<bool> showInterstitialAd() async {
  if (_interstitialAd == null) {
    print('Interstitial ad is not loaded.');
    // Return success even if the ad is not yet loaded.
    // The ad waits for the user, so the user never waits for the ad!
    // https://youtu.be/r2RgFD3Apyo?t=188
    return true;
  }
  final completer = Completer<bool>();
  _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdDismissedFullScreenContent: (InterstitialAd ad) {
      ad.dispose();
      _interstitialAd = null;
      completer.complete(true);
      if (_lastInterstitialAndroidAdUnitId != null) {
        loadInterstitialAd(
          _lastInterstitialIosAdUnitId ?? '',
          _lastInterstitialAndroidAdUnitId!,
          _lastInterstitialShowTestAds,
        );
      }
    },
    onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      _interstitialAd = null;
      completer.complete(false);
      if (_lastInterstitialAndroidAdUnitId != null) {
        loadInterstitialAd(
          _lastInterstitialIosAdUnitId ?? '',
          _lastInterstitialAndroidAdUnitId!,
          _lastInterstitialShowTestAds,
        );
      }
    },
  );
  _interstitialAd!.show();
  return completer.future;
}

void adMobRequestConsent() {
  if (kIsWeb) {
    print('AdMob is not supported on web.');
    return;
  }

  ConsentRequestParameters params = ConsentRequestParameters();

  ConsentInformation.instance.requestConsentInfoUpdate(params, () async {
    if (await ConsentInformation.instance.isConsentFormAvailable()) {
      loadForm();
    }
  }, (error) {});
}

void loadForm() {
  ConsentForm.loadConsentForm((consentForm) async {
    var status = await ConsentInformation.instance.getConsentStatus();
    if (status == ConsentStatus.required) {
      consentForm.show((error) {
        loadForm();
      });
    }
  }, (error) {});
}

Future<bool> checkConsentNotRequired() async {
  var status = await ConsentInformation.instance.getConsentStatus();
  return status == ConsentStatus.notRequired;
}

void adMobUpdateRequestConfiguration() {
  if (kIsWeb) {
    print('AdMob is not supported on web.');
    return;
  }
  final RequestConfiguration requestConfiguration = RequestConfiguration(
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.no,
    maxAdContentRating: MaxAdContentRating.g,
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
}

// ============================================================
// App Open Ad — shown once when the app is launched/resumed.
// Learn more: https://developers.google.com/admob/flutter/app-open
// ============================================================

AppOpenAd? _appOpenAd;
bool _isShowingAppOpenAd = false;
bool _isLoadingAppOpenAd = false;
bool _appReadyToShowOpenAd = false;

void loadAppOpenAd(
  String iosAdUnitId,
  String androidAdUnitId,
  bool showTestAds,
) {
  if (kIsWeb || _isLoadingAppOpenAd) {
    return;
  }
  String adUnitId;
  if (Platform.isIOS) {
    adUnitId =
        showTestAds ? 'ca-app-pub-3940256099942544/5575463023' : iosAdUnitId;
  } else if (Platform.isAndroid) {
    adUnitId = showTestAds
        ? 'ca-app-pub-3940256099942544/9257395921'
        : androidAdUnitId;
  } else {
    return;
  }

  _isLoadingAppOpenAd = true;
  AppOpenAd.load(
    adUnitId: adUnitId,
    request: AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (AppOpenAd ad) {
        _appOpenAd = ad;
        _isLoadingAppOpenAd = false;
        // If the splash screen already finished waiting for us, show the
        // ad right away instead of waiting for the next app launch.
        if (_appReadyToShowOpenAd) {
          showAppOpenAdIfAvailable();
        }
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('AppOpenAd failed to load: $error');
        _isLoadingAppOpenAd = false;
      },
    ),
  );
}

void showAppOpenAdIfAvailable() {
  if (kIsWeb) {
    return;
  }
  _appReadyToShowOpenAd = true;
  if (_appOpenAd == null || _isShowingAppOpenAd) {
    print('AppOpenAd is not ready to be shown yet.');
    return;
  }

  _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (AppOpenAd ad) {
      _isShowingAppOpenAd = true;
    },
    onAdDismissedFullScreenContent: (AppOpenAd ad) {
      _isShowingAppOpenAd = false;
      ad.dispose();
      _appOpenAd = null;
    },
    onAdFailedToShowFullScreenContent: (AppOpenAd ad, AdError error) {
      print('AppOpenAd failed to show: $error');
      _isShowingAppOpenAd = false;
      ad.dispose();
      _appOpenAd = null;
    },
  );
  _appOpenAd!.show();
}
