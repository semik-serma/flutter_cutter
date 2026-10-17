import 'package:flutter/material.dart';
import 'package:new_flutter_project/cozy/product_model.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  List<Productmodel> persons = [
    Productmodel(
      id: '1',
      name: 'Ram Sharma',
      description: 'Flutter Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    Productmodel(
      id: '2',
      name: 'Sita Thapa',
      description: 'UI/UX Designer',
      imageUrl: 'https://i.pravatar.cc/150?img=2',
    ),
    Productmodel(
      id: '3',
      name: 'Hari Gurung',
      description: 'Web Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    Productmodel(
      id: '4',
      name: 'Gita Rai',
      description: 'Software Engineer',
      imageUrl: 'https://i.pravatar.cc/150?img=4',
    ),
    Productmodel(
      id: '5',
      name: 'Bikash Tamang',
      description: 'Backend Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    Productmodel(
      id: '6',
      name: 'Anita Karki',
      description: 'Cybersecurity Student',
      imageUrl: 'https://i.pravatar.cc/150?img=6',
    ),
    Productmodel(
      id: '7',
      name: 'Suman KC',
      description: 'AI/ML Engineer',
      imageUrl: 'https://i.pravatar.cc/150?img=7',
    ),
    Productmodel(
      id: '8',
      name: 'Nisha Lama',
      description: 'Mobile App Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=8',
    ),
    Productmodel(
      id: '9',
      name: 'Prakash Adhikari',
      description: 'Full Stack Developer',
      imageUrl: 'https://i.pravatar.cc/150?img=9',
    ),
    Productmodel(
      id: '10',
      name: 'Mina Basnet',
      description: 'Data Scientist',
      imageUrl: 'https://i.pravatar.cc/150?img=10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 12,
                crossAxisSpacing: 48,
                childAspectRatio: 16,
              ),
              itemBuilder: (context, index) {
                final person = persons[index];
                // return Card(
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.network("${person.imageUrl}"),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black,
                            padding: EdgeInsets.all(4),
                            child: Text(
                              "${person.name}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                // );
              },
            );
          },
        ),
      ),
    );
  }
}
