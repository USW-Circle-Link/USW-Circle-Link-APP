// Please see this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/main/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyCBQAPsaSqPdohRrWaoDmQt_KIdrmsZAyg",
  authDomain: "usw-circle-link.firebaseapp.com",
  databaseURL: "https://usw-circle-link.firebaseio.com",
  projectId: "usw-circle-link",
  storageBucket: "usw-circle-link.firebasestorage.app",
  messagingSenderId: "189705439962",
  appId: "1:189705439962:web:49017f94792010e29873e3",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
!function(){try{var e="undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:{},n=(new e.Error).stack;n&&(e._sentryDebugIds=e._sentryDebugIds||{},e._sentryDebugIds[n]="3da0d1d3-1cc6-5907-b2c6-714e29d15f85")}catch(e){}}();
//# debugId=3da0d1d3-1cc6-5907-b2c6-714e29d15f85
