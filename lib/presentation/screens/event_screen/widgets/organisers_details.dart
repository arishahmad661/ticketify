import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import 'package:ticketify/presentation/widgets/text.dart';

Widget organisersDetail({required FeaturedEventModel featuredEvent}) {
  return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          featuredEvent.organisersMainLogo.isEmpty || featuredEvent.organisersMainLogo == ""?  const Center(child: Icon(Icons.error)):
          Center(child: buildNetworkImage(imgURL: featuredEvent.organisersMainLogo, width: 160.0)),
          Text(
            featuredEvent.organisersName,
            textAlign: TextAlign.center,
            style: textStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          ReadMoreText(
            featuredEvent.organiserDescription,
            trimMode: TrimMode.Line,
            trimLines: 5,
            colorClickableText: Colors.blue,
            annotations: [
              Annotation(
                regExp: RegExp(featuredEvent.organisersName,),
                spanBuilder: ({required text, textStyle}) => TextSpan(text: text, style: textStyle?.copyWith(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
}

