

# Spending tracker 📈 ⚖️

[![Web deployment)](https://github.com/mcarlomagno/spending_tracker/actions/workflows/firebase-hosting-merge.yml/badge.svg)](https://spending-tracker-313e0.web.app/)

Spending Tracker is a cross-platform application for managing incomes and expenses in the cloud, this is archived by using two main concepts: _Buckets_ and _Transactions_.

#### Bucket

A bucket is a representation of any amount of money (physical or virtual) with a given description and currency.<br>
> E.g. The money you have in a bank account or the cash in your wallet.

#### Transaction
A transaction is a regular transaction done by the user, can be an _income_ or an _expense_:
> E.g The money you pay when you buy something in a grosery store or a regular tax.

## Live access

| Resource   |      Status      |  Link |
|----------|:-------------:|:------|
| Web | ✔️ | <a href="https://spending-tracker-313e0.web.app/" target="_blank">to Web app</a> |
| Android |    ✔️   | <a href="https://play.google.com/store/apps/details?id=com.mcarlomagno.spending_tracker" target="_blank">to App Store</a> |
| iOS | ❌ |   _soon_  |
| Figma Design | ✔️ | <a href="https://www.figma.com/file/xUheUzznOBOFl9us9n017p/spending_tracker?node-id=514%3A622" target="_blank">to Figma Project</a> |

## Built with ❤️ using Flutter and Firebase

### Flutter dependencies

| Dependency            | Version |
|-----------------------|---------|
|[provider](https://pub.dev/packages/provider) | ^5.0.0  |
|[get_it](https://pub.dev/packages/get_it)                 | ^6.0.0  |
|[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) | -       |
|[firebase_core](https://pub.dev/packages/firebase_core)          | ^1.10.6 |
|[firebase_auth](https://pub.dev/packages/firebase_auth)          | ^3.3.4  |
|[cloud_firestore](https://pub.dev/packages/cloud_firestore)        | ^3.1.6  |


### Firebase Services
| Service            |
|-----------------------|
|[Cloud Firestore](https://firebase.flutter.dev/docs/firestore/usage/) |
|[Firebase Authentication](https://firebase.flutter.dev/docs/firestore/overview)                 |
|[Firebase Hosting](https://firebase.google.com/docs/hosting) |

## Screenshots
<div align="center">
<img src="https://raw.githubusercontent.com/MCarlomagno/spending_tracker/master/assets/readmebanner_readme.png" alt="Screenshot 1" width="100%"/>
</div>

## Setup

### **Prerequisites**

- Flutter 2.X installed in your computer. If you haven't installed it yet, follow [this guide](https://flutter.dev/docs/get-started/install).
- [Optional] In case you want to use your own Firebase project, you can follow the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview).

### Installation

1- Clone the project

```
git clone https://github.com/MCarlomagno/spending_tracker.git
```

2- Open the folder

```
cd spending_tracker
```

3- Install dependencies

```
flutter pub get
```

4- Run

```
flutter run
```

## **Contributing**

Pull requests and Issue openings are very welcome 😊. For major changes, please open an issue first to discuss what you would like to change.

## **Contact**

If you have any suggestion that you think does not fit as a contribution for the project (PR or Issue), or you just want to have a small talk with me, dont be shy and let's do it 😉

<img src="https://camo.githubusercontent.com/4a3dd8d10a27c272fd04b2ce8ed1a130606f95ea6a76b5e19ce8b642faa18c27/68747470733a2f2f6564656e742e6769746875622e696f2f537570657254696e7949636f6e732f696d616765732f7376672f676d61696c2e737667" alt="gmail" style="width:30px;"/> marcoscarlomagno1@gmail.com<br>
<img src="https://camo.githubusercontent.com/c8a9c5b414cd812ad6a97a46c29af67239ddaeae08c41724ff7d945fb4c047e5/68747470733a2f2f6564656e742e6769746875622e696f2f537570657254696e7949636f6e732f696d616765732f7376672f6c696e6b6564696e2e737667" alt="linkedin" style="width:30px;"/> https://www.linkedin.com/in/marcos-carlomagno/<br>
<img src="https://camo.githubusercontent.com/f4b401dd7cd9b7840fd31acafd49e151a80e4c9600bf219934461b96dd98e013/68747470733a2f2f6564656e742e6769746875622e696f2f537570657254696e7949636f6e732f696d616765732f7376672f74656c656772616d2e737667" alt="telegram" style="width:30px;"/> https://t.me/marcoscarlomagno<br>
<img src="https://camo.githubusercontent.com/a583b5ce3b463c784cb87592b3da7b9b9d014d7a16adfff04b91cb1452ae4ca2/68747470733a2f2f6564656e742e6769746875622e696f2f537570657254696e7949636f6e732f696d616765732f7376672f6d656469756d2e737667" alt="medium" style="width:30px;"/> https://mcarlomagno.medium.com/<br>


## **License**

[MIT](https://choosealicense.com/licenses/mit/)
