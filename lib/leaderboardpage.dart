import 'package:figma/pluz.dart';
import 'package:flutter/material.dart';

class Aage extends StatefulWidget {
  const Aage({super.key});

  @override
  State<Aage> createState() => _AageState();
}

class _AageState extends State<Aage> with TickerProviderStateMixin {
  static List<Tab> myTabs = <Tab>[
    Tab(text: 'New Leads'),
    Tab(text: 'Follow up'),
    Tab(text: 'Groups'),
  ];

  late TabController _tabController;
  final TextEditingController _searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/login.avif'),
                ),
                SizedBox(width: 15),
                Text(
                  'Good Morning, Janaki !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              child: TextFormField(
                controller: _searchcontroller,
                decoration: InputDecoration(
                  labelText: 'Search for something',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                NewLeadsTab(),
                FollowUpTab(),
                GroupsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NewLeadsTab extends StatefulWidget {
  @override
  _NewLeadsTabState createState() => _NewLeadsTabState();
}

class _NewLeadsTabState extends State<NewLeadsTab> {

  List<Map<String, String>> leads = [];


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Lead',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    leads.add({
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'phoneNumber': phoneNumberController.text,
                    });
                  });
                  Navigator.pop(context);
                  firstNameController.clear();
                  lastNameController.clear();
                  phoneNumberController.clear();
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: leads.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${leads[index]['firstName']} ${leads[index]['lastName']}'),
              subtitle: Text('${leads[index]['phoneNumber']}'),
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _showBottomSheet,
            backgroundColor: const Color.fromARGB(255, 52, 43, 225),
            shape: CircleBorder(),
            child: Icon(Icons.add, size: 25),
          ),
        ),
      ],
    );
  }
}



class FollowUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Follow up tab',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}

class GroupsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Groups tab',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
