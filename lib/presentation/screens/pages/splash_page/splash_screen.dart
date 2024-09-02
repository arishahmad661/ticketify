import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticketify/presentation/screens/pages/splash_page/widgets/splash_page.dart';
import '../../../../blocs/authentication/auth_bloc.dart';
import '../../../../blocs/authentication/auth_event.dart';

class SplashHomePage extends StatelessWidget {
  SplashHomePage({super.key});

  final _ctrl = PageController();

  final pages = [
    const SplashPageWidget(
      title: "Flexible Ticketing",
      desc: "Paid & free tickets; discount & access codes",
      summ1: "Free & Paid Tickets",
      summ2: "Approval Tickets",
      summ3: "Hidden Tickets",
      icon3: Icons.lock,
      icon2: Icons.checklist,
      icon1: Icons.currency_rupee,
    ),
    const SplashPageWidget(
        title: "Amplify Event",
        desc: "Get more foot-fall & make your event a “sell-out”",
        summ1: "Referral Program",
        summ2: "Increase Sales",
        summ3: "Giveaway Rewards",
        icon1: Icons.join_inner,
        icon2: Icons.auto_graph,
        icon3: Icons.currency_exchange),
    const SplashPageWidget(
        title: "Communicate",
        desc: "SMS / WhatsApp messages + Unlimited emails",
        summ1: "Emails",
        summ2: "Whatsapp",
        summ3: "SMS",
        icon1: Icons.email_outlined,
        icon2: Icons.sms,
        icon3: Icons.sms_outlined),
    const SplashPageWidget(
        title: "Check-in App",
        desc: "Blazing fast check-ins at registration desks!",
        summ1: "Faster Check-in",
        summ2: "On-spot",
        summ3: "Card Printing",
        icon1: Icons.timer,
        icon3: Icons.print_outlined,
        icon2: Icons.person_add_alt_1),
    const Center()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _ctrl,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    if (index == pages.length - 1) {
                      return Scaffold(
                        body: Center(
                            child: InkWell(
                              radius: 50,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                context.read<AuthBloc>().add(SignINPageRequested());
                              },
                              child: CircleAvatar(
                          backgroundColor: Colors.blueGrey[100],
                          radius: 50,
                          child:const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                        ),
                            )),
                      );
                    }
                    return pages[index];
                  },
                ),
              ),
              // const SizedBox(height: 32),
              SmoothPageIndicator(
                controller: _ctrl,
                count: pages.length,
                effect: const ExpandingDotsEffect(activeDotColor: Colors.blueGrey),
                axisDirection: Axis.horizontal,
              ),
            ]);
  }
}
