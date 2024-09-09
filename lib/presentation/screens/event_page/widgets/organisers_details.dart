import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import 'package:ticketify/presentation/widgets/text.dart';

Widget organisersDetail({required FeaturedEventModel featuredEvent}) {
  return Column(
    children: List.generate(featuredEvent.organisersName.length, (index) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          featuredEvent.organisersPic.isEmpty || featuredEvent.organisersPic[0] == ""?  const Center(child: Icon(Icons.error)):
          Center(child: buildNetworkImage(imgURL: featuredEvent.organisersPic[index], width: 160.0)),
          Text(
            featuredEvent.organisersName[index],
            textAlign: TextAlign.center,
            style: textStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          ReadMoreText(
            featuredEvent.organiserDescription[index],
            trimMode: TrimMode.Line,
            trimLines: 5,
            colorClickableText: Colors.blue,
            annotations: [
              Annotation(
                regExp: RegExp(featuredEvent.organisersName[index],),
                spanBuilder: ({required text, textStyle}) => TextSpan(text: text, style: textStyle?.copyWith(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    }),
  );
}

