import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/addnote/add_note_screen.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          'Notlarım',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Şu anda satın aldığınız bir not bulunmamaktadır. \nHadi notları keşfedelim',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      ElevatedButton(
                        onPressed: () => Get.offAll(const HomePage()),
                        child: const Text('Notları Keşfet'),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Şu anda sattığınız bir not bulunmamaktadır. Diğer öğrencilerin notlarınıza erişmesini istiyorsanız not yükleme ekranına gidiniz',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      ElevatedButton(
                        onPressed: () => Get.to(const AddNoteScreen()),
                        child: const Text('Not Yükleme'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        TabBar(
          indicatorColor: Colors.orange.shade200,
          labelColor: Colors.black,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          unselectedLabelColor: Colors.grey.shade400,
          indicator: const BoxDecoration(),
          overlayColor: WidgetStateColor.transparent,
          dividerHeight: 0,
          controller: _tabController,
          tabs: const [
            Text(
              'Alınan Notlar',
            ),
            Text(
              'Satılan Notlar',
            ),
          ],
        ),
      ]),
    );
  }
}
