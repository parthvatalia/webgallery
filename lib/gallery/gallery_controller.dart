import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/helpers.dart' as web;
import 'package:web/web.dart' as web;

class GalleryController extends GetxController {
  final urlController = TextEditingController();
  final RxBool isImageVisible = false.obs;
  final RxBool isMenuOpen = false.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void displayImage() {
    if (urlController.text.isNotEmpty) {
      Future.delayed(Duration(seconds: 1), () {
        final imageElement =
            web.document.getElementById('fullscreen-image')
                as web.HTMLImageElement?;
        if (imageElement != null) {
          imageElement.src = urlController.text;
        }
      });
      isImageVisible.value = true;
    }
  }

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  void handleFullscreen(bool enter) {
    final imageElement = web.document.querySelector('#fullscreen-image');
    if (imageElement != null) {
      if (enter && web.document.fullscreenElement == null) {
        imageElement.requestFullscreen();
      } else if (!enter && web.document.fullscreenElement != null) {
        web.document.exitFullscreen();
      }
    }
    toggleMenu();
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }
}
