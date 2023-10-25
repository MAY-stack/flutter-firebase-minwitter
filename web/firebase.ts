// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAx9Fp5ePS1uBrnLlIFcsx2TR761TV_OlU",
  authDomain: "mwitter-24a06.firebaseapp.com",
  projectId: "mwitter-24a06",
  storageBucket: "mwitter-24a06.appspot.com",
  messagingSenderId: "591086742697",
  appId: "1:591086742697:web:36f4dbd7f1cd28f42b8db8",
  measurementId: "G-YNW0LZGZN1"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);  //키값들이 포함된 config를 넣은 app 생성
const analytics = getAnalytics(app);

//Authtentication
const auth = getAuth(app);  //그 app에 대한 인증 서비스를 사용하고 싶다면 getAuth를 사용하면 된다.
