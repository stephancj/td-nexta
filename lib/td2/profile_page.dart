import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexta/td2/post_details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map> posts = [
    {
      'text': 'Ceci est un post de test',
      'image':
          'https://images.pexels.com/photos/14288495/pexels-photo-14288495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'isLiked': false,
      'isCommentedTextfieldVisible': false,
      'isEditing': false,
      'comments': []
    },
    {
      'text': 'Ceci est un post de test 2 ',
      'image':
          'https://images.pexels.com/photos/14288495/pexels-photo-14288495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'isLiked': false,
      'isCommentedTextfieldVisible': false,
      'isEditing': false,
      'comments': []
    },
    {
      'text': 'Ceci est un post de test 3',
      'image':
          'https://images.pexels.com/photos/14288495/pexels-photo-14288495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'isLiked': false,
      'isCommentedTextfieldVisible': false,
      'isEditing': false,
      'comments': []
    },
  ];

  // bool isAndroid = Platform.isAndroid;
  // bool isIOS = Platform.isIOS;

  TextEditingController postTextController = TextEditingController();
  TextEditingController commentTextController = TextEditingController();
  TextEditingController editPostTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: screensize.width,
                height: screensize.height * 0.2,
                color: Colors.blue,
                // child: Image.network('https://images.pexels.com/photos/11073147/pexels-photo-11073147.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', fit: BoxFit.cover),
              ),
              Positioned(
                top: screensize.height * 0.1 - 50,
                left: screensize.width * 0.5 - 50,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  // backgroundImage: NetworkImage('https://images.pexels.com/photos/11073147/pexels-photo-11073147.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Stéphan Christian',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Développeur Flutter',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screensize.width * 0.75,
                child: TextField(
                  controller: postTextController,
                  decoration: const InputDecoration(
                    labelText: 'Nouvelle publication',
                    hintText: 'Entrez votre publication ici ...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // isAndroid ? ElevatedButton(onPressed: (){}, child: const Text('Publier')) : CupertinoButton(onPressed: (){}, child: const Text('Publier')),
              ElevatedButton(
                  onPressed: () {
                    addPost(postTextController.text);
                  },
                  child: const Text('Publier'))
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostDetailsPage(
                              text: posts[index]['text'],
                              imageUrl: posts[index]['image'],
                            )));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(posts[index]['image'],
                            width: screensize.width,
                            height: screensize.height * 0.3,
                            fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(posts[index]['text'],
                              style: const TextStyle(fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      posts[index]['isLiked'] =
                                          !posts[index]['isLiked'];
                                    });
                                  },
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: posts[index]['isLiked'] == true
                                        ? Colors.blue
                                        : Colors.grey,
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      posts[index]
                                              ['isCommentedTextfieldVisible'] =
                                          !posts[index]
                                              ['isCommentedTextfieldVisible'];
                                    });
                                  },
                                  child: const Text('Commenter')),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      posts.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      posts[index]['isEditing'] =
                                          !posts[index]['isEditing'];
                                    });
                                  },
                                  child: const Text('Modifier'))
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: posts[index]
                                        ['isCommentedTextfieldVisible'] ==
                                    true
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: screensize.width * 0.60,
                                        child: TextField(
                                          controller: commentTextController,
                                          decoration: const InputDecoration(
                                            labelText: 'Commentaire',
                                            hintText:
                                                'Entrez votre commentaire ici ...',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              posts[index]['comments'].add(
                                                  commentTextController.text);
                                              posts[index][
                                                      'isCommentedTextfieldVisible'] =
                                                  false;
                                              commentTextController.clear();
                                            });
                                          },
                                          child: const Text('Envoyer')),
                                    ],
                                  )
                                : const SizedBox()),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: posts[index]['isEditing'] == true
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: screensize.width * 0.60,
                                        child: TextField(
                                          controller: editPostTextController,
                                          decoration: const InputDecoration(
                                            labelText: 'description',
                                            hintText:
                                                'Entrez la nouvelle description ici ...',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              posts[index]['text'] =
                                                  editPostTextController.text;
                                              posts[index]['isEditing'] = false;
                                              editPostTextController.clear();
                                            });
                                          },
                                          child: const Text('Modifier')),
                                    ],
                                  )
                                : const SizedBox()),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                for (var comment in posts[index]['comments'])
                                  Text(comment),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  addPost(String text) {
    setState(() {
      posts.add({
        'text': text,
        'image':
            'https://images.pexels.com/photos/10585984/pexels-photo-10585984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'isLiked': false,
        'isCommentedTextfieldVisible': false,
        'isEditing': false,
        'comments': []
      });
    });
  }
}
