

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

| Platform   |      Status      |  Link |
|----------|:-------------:|:------|
| Web | ✔️ | https://spending-tracker-313e0.web.app/ |
| Android |    ❌   |  _soon_ |
| iOS | ❌ |   _soon_  |

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
<img src="https://raw.githubusercontent.com/MCarlomagno/spending_tracker/master/assets/readme_banner.png" alt="Screenshot 1" width="100%"/>
</div>

## Setup

### **Prerequisites**

- Flutter 2.X installed in your computer. If you haven't installed it yet, follow [this guide](https://flutter.dev/docs/get-started/install).

### Installation

1- Clone the project:

```
git clone https://github.com/MCarlomagno/spending_tracker.git
```

2- Open the folder:

```
cd spending_tracker
```

3- Install dependencies:

```
flutter pub get
```

4- Run:

```
flutter run
```

## **Contributing**

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## **Contact**

Marcos Carlomagno - marcoscarlomagno1@gmail.com

Project Link: https://github.com/MCarlomagno/spending_tracker

## **License**

[MIT](https://choosealicense.com/licenses/mit/)
