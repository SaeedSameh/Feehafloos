import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Set this to false before publishing a real release build.
// While true, Google's official test banner is shown instead of your
// real ad (useful for making sure everything renders correctly first).
const bool kShowTestBannerAds = false;

const String _androidBannerAdUnitId =
    'ca-app-pub-6031227362246075/2246616896';
const String _iosBannerAdUnitId =
    'ca-app-pub-6031227362246075/2246616896'; // replace if you add an iOS unit

/// A persistent banner ad meant to be placed once at the bottom of the
/// app (see main.dart), so it shows on every screen without having to
/// edit each individual page.
class PersistentBannerAd extends StatefulWidget {
  const PersistentBannerAd({super.key});

  @override
  State<PersistentBannerAd> createState() => _PersistentBannerAdState();
}

class _PersistentBannerAdState extends State<PersistentBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    if (kIsWeb) {
      return;
    }

    String adUnitId;
    if (kShowTestBannerAds) {
      adUnitId = 'ca-app-pub-3940256099942544/6300978111'; // Google test unit
    } else if (Platform.isAndroid) {
      adUnitId = _androidBannerAdUnitId;
    } else if (Platform.isIOS) {
      adUnitId = _iosBannerAdUnitId;
    } else {
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() => _isLoaded = true);
          }
        },
        onAdFailedToLoad: (ad, error) {
          print('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }
    return SafeArea(
      top: false,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.transparent,
        height: _bannerAd!.size.height.toDouble(),
        child: SizedBox(
          width: _bannerAd!.size.width.toDouble(),
          height: _bannerAd!.size.height.toDouble(),
          child: AdWidget(ad: _bannerAd!),
        ),
      ),
    );
  }
}
