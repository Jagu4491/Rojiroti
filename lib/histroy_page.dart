import 'package:flutter/material.dart';
import 'package:ram_app/music_page.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _isBriefExpanded = false;
  bool _isHistoryExpanded = false;
  bool _isArchitectureExpanded = false;
  bool _significanceExpanded = false;
  bool _isReach = false;
  bool _isMusicLibraryExpanded = false;
  bool _isConclusion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ram.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8), // Adjust opacity as needed
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/images/History.jpg')),
                SizedBox(height: 10),
                _buildExpandableSection(
                  title: 'Brief',
                  content: 'The Ayodhya Ram Mandir, also known as Lord Shri Ram Temple, '
                      'is a Hindu temple located in Ayodhya, Uttar Pradesh, India. '
                      'The temple has been the center of a long-standing religious and political dispute in India. The new Hindu temple at Ram Janm Bhumi is being built, and Hindus worldwide are excited about its opening. We have all the info about the Ayodhya Ram Mandir opening in 2024. It\'s set to open on January 24, 2024, and Prime Minister Shri Narendra Modi will inaugurate it. Ayodhya, where the temple is, is considered a sacred place as it\'s the birthplace of Lord Shri Ram. The temple is expected to be completed on February 24, 2024.\n\n'
                      'Once they announce the opening date, they will start allowing people to book tickets for a visit. To do that, you\'ll need to register for the Ayodhya Ram Mandir visit in 2024. This registration is essential if you want to see the new Ram Mandir once it\'s finished.\n\n'
                      'In this article, we will explore more about the history, architecture, significance, and how to reach the Ayodhya Ram Mandir.',
                  isExpanded: _isBriefExpanded,
                  onToggle: () {
                    setState(() {
                      _isBriefExpanded = !_isBriefExpanded;
                    });
                  },
                ),
                _buildExpandableSection(
                  title: 'History',
                  content: 'The history of the Ayodhya Ram Mandir is centuries-old. The temple is built on the site believed to be the birthplace of Lord Ram, one of the most revered Hindu deities. The temple was demolished by the Mughal emperor Babur in the 16th century and a mosque was built in its place. The mosque, known as the Babri Masjid, stood on the site for centuries until it was demolished in 1992 by Hindu nationalists, triggering widespread violence and communal tensions in the country.\n\n'
                      'The Ayodhya dispute has been a contentious issue in Indian politics for decades. The dispute revolved around the ownership of the site where the Babri Masjid stood and whether it was the birthplace of Lord Ram. The dispute was finally settled by the Indian Supreme Court in 2019, which ruled in favor of the construction of a Ram Janmabhoomi temple on the site. The construction of the temple was undertaken by the Shri Ram Janmabhoomi Teerth Kshetra, a trust formed by the Indian government to oversee the construction of the temple.',
                  isExpanded: _isHistoryExpanded,
                  onToggle: () {
                    setState(() {
                      _isHistoryExpanded = !_isHistoryExpanded;
                    });
                  },
                ),
                _buildExpandableSection(
                  title: 'Architecture and Features',
                  content: 'The Ayodhya Ram Mandir is a grand temple built in the Nagara style of temple architecture, characterized by its towering spires or shikharas. The temple is built using pink sandstone and is spread across an area of 2.77 acres. The temple is surrounded by a large courtyard and has several smaller shrines dedicated to other Hindu deities. The most striking feature of the temple is the giant Shaligram stone, a black stone believed to represent Lord Ram and brought from the Gandaki river in Nepal.\n\n'
                      'The temple is 161 feet high and has three floors, each with a different purpose. The first floor is dedicated to Lord Ram, while the second floor is dedicated to Lord Hanuman, and the third floor is a museum showcasing the history and culture of Ayodhya.\n\n'
                      'The temple complex also includes a yajnashala or a hall for conducting yajnas or Hindu fire rituals, a community kitchen, and a medical facility. The temple complex is spread over 67 acres and is expected to become a major cultural and religious center, attracting millions of devotees from around the world.',
                  isExpanded: _isArchitectureExpanded,
                  onToggle: () {
                    setState(() {
                      _isArchitectureExpanded = !_isArchitectureExpanded;
                    });
                  },
                ),
                _buildExpandableSection(
                  title: 'Significance',
                  content: 'The Ayodhya Ram Mandir is considered to be one of the most important pilgrimage sites for Hindus. It is believed to be the birthplace of Lord Ram and is considered a sacred site. The construction of the temple is seen as a symbolic victory for the Hindu community, who had been fighting for the temple\'s construction for decades.\n\n'
                      'The temple is expected to contribute to the development of Ayodhya as a major religious and cultural center. It is also expected to create jobs and generate economic growth in the region. The temple is expected to attract millions of devotees from across India and the world, contributing to the development of Ayodhya as a major religious and cultural center.',
                  isExpanded: _significanceExpanded,
                  onToggle: () {
                    setState(() {
                      _significanceExpanded = !_significanceExpanded;
                    });
                  },
                ),
                _buildExpandableSection(
                  title: 'How to Reach the Ayodhya Ram Mandir',
                  content: 'Ayodhya International Airport, officially known as Maryada Purushottam Shri Ram International Airport, is an upcoming international airport designed to serve the cities of Ayodhya and Faizabad in the state of Uttar Pradesh, India. This airport is approx 8.5 km from Faizabad, situated adjacent to NH-27 and NH-330 at Naka, in the Ayodhya district, the airport\'s name was changed to honor Lord Shri Rama in 2021. the airport is scheduled to be inaugurated by Prime Minister Narendra Modi on December 30, 2023. Flight operations are expected to commence from January 10, 2024. Charan Singh International Airport in Lucknow, which is approximately 135 km from Ayodhya can also be a good option, one can hire a taxi or take a bus to Ayodhya.\n\n'
                      'Ayodhya is also well-connected by road, rail Ayodhya Junction railway station, situated in the city of Ayodhya, Uttar Pradesh, India, is a key railway hub serving the region. Within Ayodhya, it stands as one of the two major railway junctions, the other being Faizabad Junction.  which is well-connected to major cities in India. You can take a train from Delhi, Mumbai, Kolkata, or other major cities to Ayodhya. From the railway station, you can hire a taxi or take a local bus to the temple.\n\n'
                      'Ayodhya is also connected to major cities in Uttar Pradesh by road. You can take a bus or hire a taxi from Lucknow, Varanasi, or other major cities to Ayodhya.',
                  isExpanded: _isReach,
                  onToggle: () {
                    setState(() {
                      _isReach = !_isReach;
                    });
                  },
                ),
                _buildExpandableSection(
                  title: ' Music Library',
                  content: '',
                  isExpanded: _isMusicLibraryExpanded,
                  onToggle: () {
                    setState(() {
                      _isMusicLibraryExpanded = !_isMusicLibraryExpanded;
                    });
                    if(_isMusicLibraryExpanded) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MusicScreen()));
                    }
                  },
                ),
                _buildExpandableSection(
                  title: ' Conclusion',
                  content: 'The Ayodhya Ram Mandir is not just a temple, but a symbol of faith, unity, and cultural heritage. The construction of the temple is a landmark event in the history of India, signifying the triumph of truth, justice, and righteousness. The temple is a testimony to the enduring spirit of the Hindu community and their unwavering devotion to Lord Ram.\n\n'
                      'The Ayodhya Ram Mandir has been the center of a long-standing religious and political dispute in India. However, with the construction of the Ram Janmabhoomi temple, the dispute has been settled, and the site has been restored to its rightful owners. The temple is a beacon of hope and inspiration, reminding us of the power of faith and the strength of the human spirit.\n\n'
                      'As India prepares for the inauguration of the Ayodhya Ram Mandir, the temple promises to be a place of spiritual and cultural awakening. It is a monument to India\'s rich cultural and religious heritage, and a testament to the enduring legacy of Lord Shri Ram.',
                  isExpanded: _isConclusion,
                  onToggle: () {
                    setState(() {
                      _isConclusion = !_isConclusion;
                    });
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onToggle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_right_sharp,color: Colors.deepOrange,),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
