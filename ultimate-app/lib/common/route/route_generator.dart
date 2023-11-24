import 'package:flutter/material.dart';
import 'package:flutter_ultimate/authentications/sign_up/screen/auth_user_b.dart';

import '../../authentications/account_information/screen/account_information.dart';
import '../../authentications/add_mobile_number/screen/add_mobile_number.dart';
import '../../authentications/forgot_password/screen/forgot_password.dart';
import '../../authentications/kyc/screen/kyc.dart';
import '../../authentications/login/screen/login.dart';
import '../../authentications/menu.dart';
import '../../authentications/register/screen/register.dart';
import '../../authentications/reset_password/screen/reset_password.dart';
import '../../authentications/sign_up/screen/sign_up.dart';
import '../../authentications/sign_up_social/screen/sign_up_social.dart';
import '../../authentications/verify/screen/verify.dart';
import '../../ecommerces/card_product/screen/card_product_home.dart';
import '../../ecommerces/customer_manager/screen/customer_manager.dart';
import '../../ecommerces/customer_support/screen/customer_support.dart';
import '../../ecommerces/earning/screen/earning_home.dart';
import '../../ecommerces/inventory/screen/inventory.dart';
import '../../ecommerces/list_product/screen/list_product_home.dart';
import '../../ecommerces/main_seller/screen/main_seller.dart';
import '../../ecommerces/menu.dart';
import '../../ecommerces/order_management/screen/order_management_home.dart';
import '../../ecommerces/payment_processing/screen/payment_processing_home.dart';
import '../../ecommerces/product_details/screen/product_details.dart';
import '../../finances/bill_payment_1/screen/bill_payment_1_home.dart';
import '../../finances/bill_payment_2/screen/bill_payment_2_home.dart';
import '../../finances/chart_saving/screen/chart_saving_home.dart';
import '../../finances/dashboard_asset_none/screen/dashboard_asset_none_home.dart';
import '../../finances/dashboard_full_nopremium/screen/dashboard_full_nopremium_home.dart';
import '../../finances/delete_goal/screen/delete_goal.dart';
import '../../finances/friend_transaction/screen/friend_transaction.dart';
import '../../finances/goal_detail/screen/goal_detail.dart';
import '../../finances/invest_1/screen/invest_1_home.dart';
import '../../finances/invest_2/screen/invest_2_home.dart';
import '../../finances/main_saving/screen/main_saving_home.dart';
import '../../finances/menu.dart';
import '../../finances/payout/screen/payout_home.dart';
import '../../finances/portfolios/screen/portfolios.dart';
import '../../finances/profits/screen/profits_home.dart';
import '../../finances/stock_1/screen/stock_1.dart';
import '../../finances/stock_2/screen/stock_2_home.dart';
import '../../finances/task_earn/screen/task_earn_home.dart';
import '../../finances/wallet_1/screen/wallet_1_home.dart';
import '../../finances/wallet_2/screen/wallet_2_home.dart';
import '../../finances/wallet_3/screen/wallet_3_home.dart';
import '../../food_delivery/eat_now/screen/eat_now.dart';
import '../../food_delivery/food_detail/screen/food_detail.dart';
import '../../food_delivery/home_1/screen/home_1_home.dart';
import '../../food_delivery/home_2/screen/home_2_home.dart';
import '../../food_delivery/menu.dart';
import '../../food_delivery/my_order/screen/my_order.dart';
import '../../food_delivery/nearby_me/screen/nearby_me.dart';
import '../../food_delivery/order_success/screen/order_success.dart';
import '../../food_delivery/restaurant_detail/screen/restaurant_detail.dart';
import '../../food_delivery/today_food/screen/today_food.dart';
import '../../food_delivery/tracking_order/screen/tracking_order.dart';
import '../../onboardings/menu.dart';
import '../../onboardings/onboarding_1/screen/onboarding_1.dart';
import '../../profiles/menu.dart';
import '../../profiles/profile_eight/screen/profile_eight.dart';
import '../../profiles/profile_elevent/screen/profile_elevent_home.dart';
import '../../profiles/profile_five/screen/profile_five.dart';
import '../../profiles/profile_four/screen/profile_four.dart';
import '../../profiles/profile_nine/screen/profile_nine.dart';
import '../../profiles/profile_one/screen/profile_one_home.dart';
import '../../profiles/profile_seven/screen/profile_seven_home.dart';
import '../../profiles/profile_six/screen/profile_six_home.dart';
import '../../profiles/profile_ten/screen/profile_ten.dart';
import '../../profiles/profile_three/screen/profile_three.dart';
import '../../profiles/profile_twenty/screen/profile_twenty.dart';
import '../../profiles/profile_two/screen/profile_two_home.dart';
import '../../readings/book_detail/screen/book_detail.dart';
import '../../readings/bookmark_1/screen/bookmark_1_home.dart';
import '../../readings/bookmark_2/screen/bookmark_2_home.dart';
import '../../readings/bookmark_listen/screen/bookmark_listen.dart';
import '../../readings/interest_1/screen/interest_1.dart';
import '../../readings/interest_2/screen/interest_2.dart';
import '../../readings/main_seller_1/screen/main_seller_1.dart';
import '../../readings/main_seller_2/screen/main_seller_2_home.dart';
import '../../readings/menu.dart';
import '../../readings/post_details/screen/post_detail.dart';
import '../../readings/reading_habit/screen/reading_habit_home.dart';
import '../../socials_media/achievements/screen/achievements.dart';
import '../../socials_media/activity/screen/activity_home.dart';
import '../../socials_media/comments/screen/comments.dart';
import '../../socials_media/feed/screen/feed_home.dart';
import '../../socials_media/friend_list/screen/friend_list.dart';
import '../../socials_media/home_social/screen/home_social_home.dart';
import '../../socials_media/invite_friends/screen/invite_friends.dart';
import '../../socials_media/list_friends/screen/list_friends_home.dart';
import '../../socials_media/menu.dart';
import '../../socials_media/notification/screen/notification.dart';
import '../../socials_media/post_details/screen/post_details.dart';
import '../../socials_media/reviews/screen/reviews_home.dart';
import '../../socials_media/survey/screen/survey.dart';
import '../../socials_media/upgrade_premium/screen/upgrade_premium.dart';
import '../../socials_media/vote/screen/vote_home.dart';
import 'routes.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuOnboardingNavigation(),
        );
      case Routes.authentication:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuAuthenNavigation(),
        );
      // case Routes.profile:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) => const MenuProfileNavigation(),
      //   );
      case Routes.finance:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuFinanceNavigation(),
        );
      case Routes.socialMedia:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuSocialMediaNavigation(),
        );
      case Routes.foodDelivery:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuFoodDeliveryNavigation(),
        );
      case Routes.ecommerce:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuEcommerceNavigation(),
        );
      case Routes.reading:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MenuReadingNavigation(),
        );

      // / route catalog onBoarding
      case Routes.onBoarding1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const OnBoardingOne(),
        );

      // / route catalog Authen
      case Routes.accountInformation:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AccountInformation(),
        );
      case Routes.addMobileNumber:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddMobileNumber(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ForgotPassword(),
        );
      case Routes.kyc:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Kyc(),
        );
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Login(),
        );
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUp(),
        );
      case Routes.signUpB:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AuthPageB(),
        );
      case Routes.signUpSocial:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUpSocial(),
        );
      case Routes.register:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Register(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ResetPassword(),
        );
      case Routes.verify:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Verify(
              // phoneNumber: settings.arguments as String,
              ),
        );
      // / route catalog profile
      case Routes.profile1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileOneHome(),
        );
      case Routes.profile2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileTwoHome(),
        );
      case Routes.profile3:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileThree(),
        );
      case Routes.profile4:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileFour(),
        );
      case Routes.profile5:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileFive(),
        );
      case Routes.profile6:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileSixHome(),
        );
      case Routes.profile7:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileSevenHome(),
        );
      case Routes.profile8:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileEight(),
        );
      case Routes.profile9:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileNine(),
        );
      case Routes.profile10:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileTen(),
        );
      case Routes.profile11:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileEleventHome(),
        );
      case Routes.profile12:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfileTwenty(),
        );
      // / route catalog Finance
      case Routes.billPayment1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BillPayment1Home(),
        );
      case Routes.billPayment2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BillPayment2Home(),
        );
      case Routes.invest1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Invest1Home(),
        );
      case Routes.invest2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Invest2Home(),
        );
      case Routes.stock1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Stock1(),
        );
      case Routes.stock2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Stock2Home(),
        );
      case Routes.wallet1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Wallet1Home(),
        );
      case Routes.wallet2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Wallet2Home(),
        );
      case Routes.wallet3:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Wallet3Home(),
        );
      case Routes.portfolios:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Portfolios(),
        );
      case Routes.payout:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PayoutHome(),
        );
      case Routes.taskEarn:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const TaskEarnHome(),
        );
      case Routes.profits:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProfitsHome(),
        );

      case Routes.mainSaving:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MainSavingHome(),
        );

      case Routes.deleteGoal:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const DeleteGoal(),
        );
      case Routes.chart_saving:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ChartSavingHome(),
        );
      case Routes.goalDetail:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const GoalDetail(),
        );
      case Routes.friendTransaction:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FriendTransaction(),
        );
      case Routes.dashboardAssetNone:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const DashboardAssetNoneHome(),
        );
      case Routes.dashboardFullNopremium:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const DashboardFullNopremiumHome(),
        );

      // / route catalog Social Media
      case Routes.feed:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FeedHome(),
        );
      case Routes.postDetails:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PostDetails(),
        );
      case Routes.homeSocial:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HomeSocialHome(),
        );
      case Routes.achievements:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Achievements(),
        );
      case Routes.activity:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ActivityHome(),
        );
      case Routes.vote:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const VoteHome(),
        );
      case Routes.listFriends:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ListFriendsHome(),
        );
      case Routes.comments:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Comments(),
        );
      case Routes.reviews:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ReviewsHome(),
        );
      case Routes.inviteFriends:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const InviteFriends(),
        );
      case Routes.survey:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Survey(),
        );
      case Routes.upgradePremium:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const UpgradePremium(),
        );
      case Routes.friendList:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FriendList(),
        );
      case Routes.notification:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ListNotification(),
        );

      // / route catalog Food
      case Routes.home1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Home1Home(),
        );
      case Routes.home2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Home2Home(),
        );

      case Routes.food_detail:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FoodDetail(),
        );
      case Routes.my_order:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MyOrder(),
        );
      case Routes.nearby_me:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const NearbyMe(),
        );
      case Routes.order_success:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const OrderSuccess(),
        );
      case Routes.restaurant_detail:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const RestaurantDetail(),
        );
      case Routes.tracking_order:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const TrackingOrder(),
        );
      case Routes.eat_now:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const EatNow(),
        );
      case Routes.today_food:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const TodayFood(),
        );

      // / route catalog E-commerce
      case Routes.main_seller:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MainSeller(),
        );
      case Routes.list_product:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ListProductHome(),
        );
      case Routes.payment_processing:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PaymentProcessingHome(),
        );
      case Routes.inventory:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Inventory(),
        );
      case Routes.customer_manager:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const CustomerManager(),
        );
      case Routes.earning:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const EarningHome(),
        );
      case Routes.product_detail:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ProductDetails(),
        );
      case Routes.customer_support:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const CustomerSupport(),
        );
      case Routes.order_management:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const OrderManagementHome(),
        );
      case Routes.card_product:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const CardProductHome(),
        );

      // / route catalog Reading
      case Routes.interest_1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Interest1(),
        );
      case Routes.main_seller_2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MainSeller2Home(),
        );
      case Routes.main_seller_1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MainSeller1(),
        );
      case Routes.interest_2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Interest2(),
        );
      case Routes.post_details:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PostDetail(),
        );
      case Routes.bookmark_2:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Bookmark2Home(),
        );
      case Routes.book_detail:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BookDetail(),
        );
      case Routes.bookmark_listen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BookmarkListen(),
        );
      case Routes.reading_habit:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ReadingHabitHome(),
        );
      case Routes.bookmark_1:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Bookmark1Home(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
