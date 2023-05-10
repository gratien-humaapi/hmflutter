//
import 'package:artisan/common/constant.dart';
import 'package:artisan/common/size_config.dart';
import 'package:artisan/gen/assets.gen.dart';
import 'package:artisan/utils/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100,
        ),
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          color: primaryColor,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

//
class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100,
        ),
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          color: const Color(0xFFECECEC),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, color: Color(0xFF6D6D6D)),
            ),
          ),
        ),
      ),
    );
  }
}

//
class MessageModel {
  String username;
  String message;
  String time;
  MessageModel(
      {required this.message, required this.username, required this.time});
}

//
class ChatScreen extends HookWidget {
  const ChatScreen({super.key, required this.id});

  final String id;
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final textEditingController = useTextEditingController();
    final messages = useState<List<MessageModel>>([]);
    // add 15 more messages using a loop
    String sender = "Paul";
    String user = "Robert";
    // useEffect(() {
    // scrollController.animateTo(scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    //   // for (int i = 0; i < 5; i++) {
    //   //   messages.value.add(
    //   //     MessageModel(
    //   //       username: Random().nextBool() ? user : sender,
    //   //       message: faker.lorem
    //   //           .sentences(faker.randomGenerator.integer(5, min: 1))
    //   //           .join(),
    //   //       time: "${DateTime.now()}",
    //   //     ),
    //   //   );
    //   // }
    // }, [messages]);

    replayMessage() async {
      List<MessageModel> temp = List.from(messages.value);
      await Future.delayed(const Duration(seconds: 2)).then(
        (value) => temp.add(
          MessageModel(
              message: 'ssssssssssssss',
              username: sender,
              time: DateTime.now().toString()),
        ),
      );
      messages.value = temp;
      scrollController.animateTo(
          scrollController.position.maxScrollExtent + 1000,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20)),
              child: Row(
                children: [
                  HMIconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    fillColor: Colors.white,
                    iconColor: iconColor,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Robert MAGUNO",
                        style: TextStyle(
                            // color: labelTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      // reverse: true,
                      controller: scrollController,
                      padding: EdgeInsets.only(
                          left: getProportionateScreenHeight(20),
                          right: getProportionateScreenHeight(20)),
                      shrinkWrap: true,
                      itemCount: messages.value.length,
                      itemBuilder: (context, index) {
                        if (messages.value[index].username == user) {
                          return OwnMessageCard(
                            message: messages.value[index].message,
                            time: messages.value[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: messages.value[index].message,
                            time: messages.value[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: getProportionateScreenHeight(80),
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(8),
                          vertical: getProportionateScreenHeight(8)),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Expanded(
                            child: HMTextField(
                              // variant: HMTextVariant.outlined,
                              controller: textEditingController,
                              hintText: "Saissisez un message...",
                              onChange: (value) {
                                //
                              },
                            ),
                          ),
                          getProportionateScreenWidth(14).px,
                          SvgPicture.asset(Assets.icons.microphone),
                          GestureDetector(
                            onTap: () async {
                              List<MessageModel> temp =
                                  List.from(messages.value);
                              temp.add(MessageModel(
                                  message: textEditingController.value.text,
                                  username: user,
                                  time: DateTime.now().toString()));
                              messages.value = temp;
                              textEditingController.clear();
                              scrollController.animateTo(
                                  scrollController.position.maxScrollExtent +
                                      1000,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                              await replayMessage();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(14)),
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(12)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 14,
                                      color: const Color(0xFFFFAA6C)
                                          .withOpacity(0.8),
                                    )
                                  ]),
                              child: SvgPicture.asset(Assets.icons.send),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
