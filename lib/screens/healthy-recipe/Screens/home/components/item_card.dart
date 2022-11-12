
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Models/Item.dart';
import '../../../constants.dart';
import '../../details/details.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Item item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(item: item)));
      },
     child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(item.color)
        ),
        margin: EdgeInsets.only(top: index.isOdd ? 10 : 0, bottom: index.isOdd ? 0 : 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
             tag: item.id,
             child: Image.asset(
                item.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontStyle:FontStyle.italic,
                          fontSize:24,
                          color:Color(0xff000000),
                        ),
                      ),
                    ],
                  ),

                  IconButton(
                    icon: SvgPicture.asset('assets/icons/heart.svg'),
                    onPressed: () {}
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
