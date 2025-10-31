// Please see this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/main/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart

!function(){try{var e="undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:{},n=(new e.Error).stack;n&&(e._sentryDebugIds=e._sentryDebugIds||{},e._sentryDebugIds[n]="8087e055-e204-5934-b185-1978d7f58276")}catch(e){}}();
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
//# debugId=8087e055-e204-5934-b185-1978d7f58276
