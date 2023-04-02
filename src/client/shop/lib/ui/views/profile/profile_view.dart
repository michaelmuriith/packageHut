import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_text.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //profile image
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //profile name
          const SizedBox(
            height: 10,
          ),
          const Text(
            'John Doe',
            style: ktsSubtitle,
          ),
          //PAYMENT DETAILS
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Payment Details',
                style: ktsTitle,
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          const Divider(),
          //ADDRESS
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account Settings',
                  style: ktsTitle,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Orders',
                  style: ktsTitle,
                ),
              ],
            ),
          ),
          //LOGOUT
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.logout),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: ktsTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
