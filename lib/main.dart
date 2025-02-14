import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'package:web/web.dart' as html;
import 'package:webgallery/web_gallery.dart';

void main() {
  ui.platformViewRegistry.registerViewFactory('image-container', (int viewId) {
    final container =
        web.document.createElement('div') as web.HTMLDivElement
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.display = 'flex'
          ..style.justifyContent = 'center'
          ..style.alignItems = 'center'
          ..style.borderRadius = '12px'
          ..style.overflow = 'hidden';

    final imageElement =
        web.document.createElement('img') as web.HTMLImageElement
          ..id = 'fullscreen-image'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.objectFit = 'cover';

    container.appendChild(imageElement);
    imageElement.onDoubleClick.listen((_) {
      if (html.document.fullscreenElement == null) {
        imageElement.requestFullscreen();
      } else {
        html.document.exitFullscreen();
      }
    });

    return container;
  });

  runApp(const WebGallery());
}
