import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

class MentionInput extends StatefulWidget {
  const MentionInput({required this.handleSubmit, required this.placeholder, this.buttonLabel = 'Submit', Key? key})
      : super(key: key);

  final Function(String value) handleSubmit;

  final String placeholder;

  final String buttonLabel;

  @override
  State<MentionInput> createState() => _MentionInputState();
}

class _MentionInputState extends State<MentionInput> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  List<Map<String, dynamic>> data = [
    {
      'id': 'USER_92be3e82-08b2-4b9d-8f27-72ad804951e0',
      'display': 'Dwain Bethel',
      'full_name': 'Dwain Bethel',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': '61asasgasgsag6a',
      'display': 'khaled',
      'full_name': 'DJ Khaled',
      'style': TextStyle(color: Colors.purple),
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': 'asfgasga41',
      'display': 'markT',
      'full_name': 'Mark Twain',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
    {
      'id': 'asfsaf451a',
      'display': 'JhonL',
      'full_name': 'Jhon Legend',
      'photo':
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
          child: FlutterMentions(
            key: key,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(hintText: widget.placeholder),
            onSearchChanged: (trigger, value) {
              print('DWAIN $trigger :: $value');
              if (value.toLowerCase().startsWith('d')) {
                setState(() {
                  data = [
                    {
                      'id': 'USER_92be3e82-08b2-4b9d-8f27-72ad804951e0',
                      'display': 'Dwain Bethel',
                      'full_name': 'Dwain Bethel',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    }
                  ];
                });
              } else {
                setState(() {
                  data = [
                    {
                      'id': 'USER_92be3e82-08b2-4b9d-8f27-72ad804951e0',
                      'display': 'Dwain Bethel',
                      'full_name': 'Dwain Bethel',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': '61asasgasgsag6a',
                      'display': 'khaled',
                      'full_name': 'DJ Khaled',
                      'style': TextStyle(color: Colors.purple),
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': 'asfgasga41',
                      'display': 'markT',
                      'full_name': 'Mark Twain',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': 'asfsaf451a',
                      'display': 'JhonL',
                      'full_name': 'Jhon Legend',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                  ];
                });
              }
            },
            mentions: [
              Mention(
                  trigger: '@',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                  data: data,
                  matchAll: false,
                  suggestionBuilder: (data) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              data['photo'],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: <Widget>[
                              Text(data['full_name']),
                              Text('@${data['display']}'),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              Mention(
                trigger: '#',
                disableMarkup: true,
                style: TextStyle(
                  color: Colors.blue,
                ),
                data: [
                  {'id': 'reactjs', 'display': 'reactjs'},
                  {'id': 'javascript', 'display': 'javascript'},
                ],
                matchAll: true,
              )
            ],
          ),
        ),
        ElevatedButton(
          child: Text('Get Text'),
          onPressed: () {
            widget.handleSubmit(key.currentState!.controller!.markupText);
          },
        ),
      ]),
    );
  }
}
